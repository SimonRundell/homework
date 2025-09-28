import {useEffect, useState} from 'react';
import { Drawer, Spin } from 'antd';
import axios from 'axios';


function CourseList({ config, userDetails, setShowErrorMessage, setShowSuccessMessage, setShowCourse }) {
    const [classes, setClasses] = useState([]);
    const [isLoading, setIsLoading] = useState(false);
    const [showHomework, setShowHomework] = useState(null);
    const [homeworkData, setHomeworkData] = useState(null);

useEffect(() => {
    const fetchData = async () => {
      if (userDetails) {
        setIsLoading(true);
        const jsonData = { teacherCode: userDetails.id };
        // console.log('jsonData:', jsonData);
        try {
          const response = await axios.post(config.api + '/getCourses.php', jsonData, {
            headers: {
              'Content-Type': 'application/json',
            },
          });
          const classesData = JSON.parse(response.data.message);
          // console.log('Classes data:', classesData);
          setClasses(classesData);
          setShowSuccessMessage('Courses loaded successfully');
        } catch (error) {
          console.error('Error:', error);
          setShowErrorMessage('Failed to fetch classes');
        } finally {
          setIsLoading(false);
        }
      }
    };
    fetchData();
  }, [config, userDetails]);

  const displayHomeworkReport = (course) => {
      setShowHomework(course);
      const jsonData = { courseId: course.id };
      // console.log("Fetching report:", jsonData);
      // Make an API call to fetch the course report
      axios.post(config.api + '/getCourseReport.php', jsonData, {
          headers: {
              'Content-Type': 'application/json',
          },
      })
      .then((response) => {
          const reportData = JSON.parse(response.data.message);
          // console.log('Course report data:', reportData);
          setHomeworkData(reportData);
      })
      .catch((error) => {
          console.error('Error fetching course report:', error);
      });
  }

  const HomeworkReportTable = ({ homeworkData }) => {
    const students = new Map();
    const homeworks = [];

    homeworkData.forEach(hw => {
      homeworks.push({ id: hw.id, description: hw.description });
      hw.students.forEach(student => {
        const key = `${student.firstName} ${student.lastName}`;
        if (!students.has(key)) {
          students.set(key, { name: key, statuses: {} });
        }
        students.get(key).statuses[hw.id] = student.status;
      });
    });

    // Calculate completion statistics for each homework
    const completionStats = homeworks.map(hw => {
      const studentStatuses = Array.from(students.values()).map(student => student.statuses[hw.id]).filter(status => status !== '-');
      const completedCount = studentStatuses.filter(status => status === 'C').length;
      const totalCount = studentStatuses.length;
      const percentage = totalCount > 0 ? Math.round((completedCount / totalCount) * 100) : 0;
      return {
        id: hw.id,
        completed: completedCount,
        total: totalCount,
        percentage: percentage
      };
    });

    // Calculate completion statistics for each student
    const studentStats = Array.from(students.values()).map(student => {
      const studentStatuses = Object.values(student.statuses).filter(status => status !== '-');
      const completedCount = studentStatuses.filter(status => status === 'C').length;
      const totalCount = studentStatuses.length;
      const percentage = totalCount > 0 ? Math.round((completedCount / totalCount) * 100) : 0;
      return {
        name: student.name,
        completed: completedCount,
        total: totalCount,
        percentage: percentage
      };
    });

    return (
      <table className="homework-report-table">
        <thead>
          <tr>
            <th>Student</th>
            {homeworks.map(hw => (
              <th key={hw.id}>{hw.description}</th>
            ))}
            <th>Progress</th>
          </tr>
        </thead>
        <tbody>
          {Array.from(students.values()).map(student => {
            const studentStat = studentStats.find(stat => stat.name === student.name);
            return (
              <tr key={student.name}>
                <td>{student.name}</td>
                {homeworks.map(hw => (
                  <td key={hw.id} data-status={student.statuses[hw.id] || '-'}>{student.statuses[hw.id] || '-'}</td>
                ))}
                <td className={`progress-cell ${studentStat.percentage >= 80 ? 'progress-high' : studentStat.percentage >= 50 ? 'progress-medium' : 'progress-low'}`}>
                  {studentStat.completed}/{studentStat.total} ({studentStat.percentage}%)
                </td>
              </tr>
            );
          })}
        </tbody>
        <tfoot>
          <tr className="summary-row">
            <td><strong>Completed</strong></td>
            {completionStats.map(stat => (
              <td key={stat.id} className="summary-cell">
                {stat.completed}/{stat.total} ({stat.percentage}%)
              </td>
            ))}
            <td className="summary-cell">
              <strong>Class Total</strong>
            </td>
          </tr>
        </tfoot>
      </table>
    );
  };



    return (
        <>
          {isLoading && <div className="loading"></div>}
            <h2>Your Courses</h2>
          <div className="table-container">
            <div className="table-header">
              <div className="table-row">
                <div className="table-cell course-name">Course Name</div>
                <div className="table-cell year">Year</div>
                <div className="table-cell level">Level</div>
                <div className="table-cell group">Group</div>
                <div className="table-cell taught-by"></div>
                <div className="table-cell homework-status"></div>
              </div>
            </div>
            
            {classes.map((course) => (
              <div key={course.id} className="table-row">
                <div className="table-cell course-name">{course.courseName}</div>
                <div className="table-cell year">{course.year}</div>
                <div className="table-cell level">{course.level}</div>
                <div className="table-cell group">{course.group}</div>
                <div className="table-cell taught-by">
                    <button className="medium-button"
                      onClick={() => setShowCourse(course.id)}>
                      View
                    </button>
                </div>
                <div className="table-cell homework-status">
                    <button className="medium-button"
                      onClick={() => displayHomeworkReport(course)}>
                      Homework Status
                      </button>
                </div>
               </div>
            ))}
          </div>
        {showHomework && (

    <Drawer
      title="Add New Homework"
      placement="right"
      open={showHomework}
      width={'100%'}
      onClose={() => setShowHomework(null)}>
      <h2>Homework Report for: {showHomework.courseName}</h2>
      {homeworkData && homeworkData.length > 0 && (
        <HomeworkReportTable homeworkData={homeworkData} />
      )}
    </Drawer>
        )}
        </>
    )
  }


export default CourseList;