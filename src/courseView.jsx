import { useState, useEffect, useRef } from 'react';
import AddHomework from './AddHomework';
import axios from 'axios';

function CourseView({ courseId, onClose, setShowSuccessMessage, setShowErrorMessage, config }) {
  const [showNewHomework, setShowNewHomework] = useState(false);
  const [courseDetails, setCourseDetails] = useState(null);
  const [homeworkList, setHomeworkList] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [updateHomeworkList, setUpdateHomeworkList] = useState(false);
  const [changedStatuses, setChangedStatuses] = useState({});
  const [expandedHomework, setExpandedHomework] = useState(null);
  const inputRefs = useRef([]);
  const [editingStudent, setEditingStudent] = useState(null);
  const [changedComments, setChangedComments] = useState({});

  const formatDateTime = (dateString) => {
    if (!dateString) return '';
    const date = new Date(dateString);
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const year = date.getFullYear();
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    return `${day}/${month}/${year} ${hours}:${minutes}`;
  };

  const handleStatusChange = (trackerId, value, index) => {
    const upperValue = value.toUpperCase();
    if (['X', 'R', 'C'].includes(upperValue)) {
      setChangedStatuses(prev => ({ ...prev, [trackerId]: upperValue }));
      // Move to next input
      if (index < inputRefs.current.length - 1) {
        inputRefs.current[index + 1]?.focus();
      }
    } else {
      // Invalid, clear
      setChangedStatuses(prev => ({ ...prev, [trackerId]: '' }));
    }
  };

  const handleCommentChange = (trackerId, value) => {
    setChangedComments(prev => ({ ...prev, [trackerId]: value }));
  };

  const saveAllChanges = async () => {
    const changedTrackerIds = new Set([...Object.keys(changedStatuses), ...Object.keys(changedComments)]);
    const updates = [];

    // Find the student data for each changed trackerId
    for (const homework of homeworkList) {
      if (homework.students) {
        for (const student of homework.students) {
          if (changedTrackerIds.has(student.trackerId.toString())) {
            const status = changedStatuses[student.trackerId] ?? student.status;
            const comment = changedComments[student.trackerId] ?? student.comment;
            updates.push({
              trackerId: student.trackerId,
              status,
              comment
            });
          }
        }
      }
    }

    if (updates.length === 0) return;

    try {
      const response = await axios.post(config.api + '/updateHomeworkStatus.php', {
        updates: updates
      });
      if (response.status === 200) {
        setChangedStatuses({});
        setChangedComments({});
        setUpdateHomeworkList(prev => !prev); // Refresh list
        setShowSuccessMessage('All statuses and comments updated');
      } else {
        setShowErrorMessage('Failed to update statuses and comments');
      }
    } catch (error) {
      setShowErrorMessage('Error updating statuses and comments: ' + error.message);
    }
  };

  useEffect(() => {
    const fetchData = async () => {
      if (courseId) {
        setIsLoading(true);
        const jsonData = { courseId: courseId };
        //console.log('jsonData:', jsonData);
        try {
          const response = await axios.post(config.api + '/getHomework.php', jsonData, {
            headers: {
              'Content-Type': 'application/json',
            },
          });
          const homeworkData = JSON.parse(response.data.message);
          // console.log('Homework data:', homeworkData);
          setHomeworkList(homeworkData);
        } catch (error) {
          console.error('Error:', error);
          setShowErrorMessage('Failed to fetch homework');
        } finally {
          setIsLoading(false);
        }
      }
    };
    fetchData();
  }, [config, courseId, updateHomeworkList]);

  useEffect(() => {
    const fetchDetails = async () => {
      if (courseId) {
        setIsLoading(true);
        const jsonData = { courseId: courseId };
        // console.log('jsonData:', jsonData);
        try {
          const response = await axios.post(config.api + '/getCourseDetails.php', jsonData, {
            headers: {
              'Content-Type': 'application/json',
            },
          });
          const courseData = JSON.parse(response.data.message);
          // console.log('Course data:', courseData);
          setCourseDetails(courseData);
        } catch (error) {
          console.error('Error:', error);
          setShowErrorMessage('Failed to fetch course details');
        } finally {
          setIsLoading(false);
        }
      }
    };
    fetchDetails();
  }, [config, courseId]);

  return (
    <>
      <div className="course-details">
        <button className="medium-button" onClick={onClose}>Close</button>
        <button className="medium-button" onClick={() => setShowNewHomework(true)}>Add Homework</button>
      </div>
      <div className="course-details-column">
          <h2>{courseDetails?.courseName}</h2>
          <div className="small-gap">Year: {courseDetails?.year}  |  Level: {courseDetails?.level}  |  Group: {courseDetails?.group}</div>
        </div>

      {isLoading && <div className="loading">Loading homework...</div>}

      <div className="table-container">
        <div className="table-header">
          <div className="table-row">
            <div className="table-cell id">ID</div>
            <div className="table-cell date-set">Date Set</div>
            <div className="table-cell date-due">Date Due</div>
            <div className="table-cell course-name">Description</div>
            <div className="table-cell status">Action</div>
          </div>
        </div>
        
        {homeworkList.map((homework) => (
          <div key={homework.id}>
            <div className="table-row">
              <div className="table-cell id">{homework.id}</div>
              <div className="table-cell date-set">{formatDateTime(homework.dateSet)}</div>
              <div className="table-cell date-due">{formatDateTime(homework.dateDue)}</div>
              <div className="table-cell course-name">{homework.description}</div>
              <div className="table-cell status">
                <button className="medium-button"
                  onClick={() => setExpandedHomework(expandedHomework === homework.id ? null : homework.id)}
                >
                  {expandedHomework === homework.id ? 'Hide' : 'View'}
                </button>
              </div>
            </div>
            {expandedHomework === homework.id && homework.students && (
              <div className="sub-table">
                <div className="table-header">
                  <div className="table-row">
                    <div className="table-cell student-name">Student </div>
                    <div className="table-cell comment">Comment</div>
                    <div className="table-cell status">Status </div>
                    <div className="table-cell status"
><span className="left-gap"><button className="medium-button" onClick={saveAllChanges}>Update All</button></span></div>                  </div>
                </div>
                {homework.students.map((student, index) => (
                  <div key={student.trackerId} className={`table-row ${editingStudent === student.trackerId ? 'editing-row' : ''}`}>
                    <div className="table-cell student-name">
                      {student.firstName} {student.lastName}
                    </div>
                    <div className="table-cell comment">
                      <input
                        type="text"
                        value={changedComments[student.trackerId] ?? student.comment}
                        onChange={(e) => handleCommentChange(student.trackerId, e.target.value)}
                        style={{ width: '90%' }}
                      />
                    </div>
                    <div className="table-cell status">
                      <input
                        type="text"
                        maxLength="1"
                        value={changedStatuses[student.trackerId] ?? student.status}
                        onChange={(e) => handleStatusChange(student.trackerId, e.target.value, index)}
                        onFocus={(e) => {
                          setEditingStudent(student.trackerId);
                          e.target.select();
                        }}
                        onBlur={() => setEditingStudent(null)}
                        ref={(el) => inputRefs.current[index] = el}
                        style={{ width: '30%', textAlign: 'center' }}
                      />
                    </div>

                  </div>
                ))}

              </div>
            )}
          </div>
        ))}
        
        {homeworkList.length === 0 && !isLoading && (
          <div className="table-row">
            <div className="table-cell empty-state">
              No homework assigned yet.
            </div>
          </div>
        )}
      </div>

      {showNewHomework && (
        <AddHomework
          courseId={courseId}
          visible={showNewHomework}
          onClose={() => setShowNewHomework(false)}
          setShowSuccessMessage={setShowSuccessMessage}
          setShowErrorMessage={setShowErrorMessage}
          config={config}
          setUpdateHomeworkList={setUpdateHomeworkList}

        />
      )}
    </>
  );
}

export default CourseView;