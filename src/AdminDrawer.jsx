import { useState, useEffect, useCallback } from 'react';
import { Drawer, Modal, Spin } from 'antd';
import axios from 'axios';
import CryptoJS from 'crypto-js';

function AdminDrawer({ config, isVisible, setIsVisible, setSendSuccessMessage, setSendErrorMessage }) {
    const [isLoading, setIsLoading] = useState(false);
    const [activeSection, setActiveSection] = useState(null);

    // Add User state
    const [newUserEmail, setNewUserEmail] = useState('');
    const [newUserName, setNewUserName] = useState('');
    const [newUserAdmin, setNewUserAdmin] = useState(0);
    const [newUserDepartment, setNewUserDepartment] = useState('');

    // Add Course state
    const [courseName, setCourseName] = useState('');
    const [taughtBy, setTaughtBy] = useState('');
    const [courseYear, setCourseYear] = useState(1);
    const [courseLevel, setCourseLevel] = useState('3');
    const [courseGroup, setCourseGroup] = useState('A');
    const [users, setUsers] = useState([]);

    // Add Student state
    const [studentId, setStudentId] = useState('');
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [studentCourse, setStudentCourse] = useState('');
    const [courses, setCourses] = useState([]);
    const [selectedCSVFile, setSelectedCSVFile] = useState(null);

    const loadUsers = useCallback(async () => {
        try {
            const response = await axios.get(config.api + '/getUsers.php');
            // The API returns {message: "json_string", status_code: 200}
            // So we need to parse the message field
            if (response.data.message) {
                const usersData = JSON.parse(response.data.message);
                setUsers(usersData);
            } else {
                console.error('No message field in response');
                setUsers([]);
            }
        } catch (error) {
            console.error('Error loading users:', error);
            setUsers([]); // Set to empty array on error
        }
    }, [config.api]);

    const loadCourses = useCallback(async () => {
        try {
            const response = await axios.get(config.api + '/getAllCourses.php');
            // The API returns {message: "json_string", status_code: 200}
            // So we need to parse the message field
            const coursesData = JSON.parse(response.data.message);
            setCourses(coursesData);
        } catch (error) {
            console.error('Error loading courses:', error);
            setCourses([]); // Set to empty array on error
        }
    }, [config.api]);

    useEffect(() => {
        if (isVisible) {
            loadUsers();
            loadCourses();
        }
    }, [isVisible, loadUsers, loadCourses]);

    const generatePassword = () => {
        const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        const lowercase = 'abcdefghijklmnopqrstuvwxyz';
        const numbers = '0123456789';
        const allChars = uppercase + lowercase + numbers;

        let password = '';
        // Ensure at least one of each required character
        password += uppercase[Math.floor(Math.random() * uppercase.length)];
        password += lowercase[Math.floor(Math.random() * lowercase.length)];
        password += numbers[Math.floor(Math.random() * numbers.length)];

        // Fill remaining characters
        for (let i = 3; i < 8; i++) {
            password += allChars[Math.floor(Math.random() * allChars.length)];
        }

        // Shuffle the password
        return password.split('').sort(() => Math.random() - 0.5).join('');
    };

    const handleAddUser = async () => {
        if (!newUserEmail || !newUserName) {
            setSendErrorMessage('Please fill in all required fields');
            return;
        }

        setIsLoading(true);
        const defaultPassword = generatePassword();
        const passwordHash = CryptoJS.MD5(defaultPassword).toString();

        const jsonData = {
            email: newUserEmail,
            staffName: newUserName,
            departmentName: newUserDepartment,
            admin: newUserAdmin,
            passwordHash: passwordHash,
        };

        // console.log('Adding user with data:', jsonData);

        try {
            const response = await axios.post(config.api + '/adminAddUser.php', jsonData, {
                headers: { 'Content-Type': 'application/json' }
            });

            if (response.data.status_code === 200) {
                setSendSuccessMessage('User added successfully. Default password sent to email.');
                setNewUserEmail('');
                setNewUserName('');
                setNewUserDepartment('');
                setNewUserAdmin(0);
                setActiveSection(null);
            } else {
                setSendErrorMessage(response.data.message);
            }
        } catch (error) {
            console.error('Error adding user:', error);
            setSendErrorMessage('Network error. Please try again.');
        }
        setIsLoading(false);
    };

    const handleAddCourse = async () => {
        if (!courseName || !taughtBy) {
            setSendErrorMessage('Please fill in all required fields');
            return;
        }

        setIsLoading(true);
        const jsonData = {
            courseName: courseName,
            taughtBy: taughtBy,
            year: courseYear,
            level: courseLevel,
            group: courseGroup
        };

        // console.log('Adding course with data:', jsonData);

        try {
            const response = await axios.post(config.api + '/adminAddCourse.php', jsonData, {
                headers: { 'Content-Type': 'application/json' }
            });

            if (response.data.status_code === 200) {
                setSendSuccessMessage('Course added successfully.');
                setCourseName('');
                setTaughtBy('');
                setCourseYear(1);
                setCourseLevel('3');
                setCourseGroup('A');
                setActiveSection(null);
            } else {
                setSendErrorMessage(response.data.message);
            }
        } catch (error) {
            console.error('Error adding course:', error);
            setSendErrorMessage('Network error. Please try again.');
        }
        setIsLoading(false);
    };

    const handleAddStudent = async () => {
        if (!studentId || !firstName || !lastName || !studentCourse) {
            setSendErrorMessage('Please fill in all required fields');
            return;
        }

        setIsLoading(true);
        const jsonData = {
            studentId: studentId,
            firstName: firstName,
            lastName: lastName,
            course: studentCourse
        };

        // console.log('Adding student with data:', jsonData);

        try {
            const response = await axios.post(config.api + '/adminAddStudent.php', jsonData, {
                headers: { 'Content-Type': 'application/json' }
            });

            if (response.data.status_code === 200) {
                setSendSuccessMessage('Student added successfully.');
                setStudentId('');
                setFirstName('');
                setLastName('');
                setStudentCourse('');
                setActiveSection(null);
            } else {
                setSendErrorMessage(response.data.message);
            }
        } catch (error) {
            console.error('Error adding student:', error);
            setSendErrorMessage('Network error. Please try again.');
        }
        setIsLoading(false);
    };

    const handleCSVUpload = (event) => {
        const file = event.target.files[0];
        setSelectedCSVFile(file);
    };

    const processCSVUpload = async () => {
        if (!selectedCSVFile) return;

        const reader = new FileReader();
        reader.onload = async (e) => {
            const csv = e.target.result;
            // Parse CSV and add students
            await parseAndAddStudents(csv);

        };
        reader.readAsText(selectedCSVFile);
        //console.log('Processing CSV file:', selectedCSVFile.name);
    };

    const parseAndAddStudents = async (csvText) => {
        const lines = csvText.split('\n');
        const students = [];

        for (let i = 1; i < lines.length; i++) { // Skip header
            const line = lines[i].trim();
            if (line) {
                const [studentId, lastName, firstName, course] = line.split(',');
                if (studentId && lastName && firstName && course) {
                    
                    if (course) {
                        students.push({
                            studentId: studentId.trim(),
                            firstName: firstName.trim(),
                            lastName: lastName.trim(),
                            course: course.trim()
                        });
                        // console.log("Adding student from CSV:", {
                        //     studentId: studentId.trim(),
                        //     firstName: firstName.trim(),
                        //     lastName: lastName.trim(),
                        //     course: course.trim()
                        // });
                    }
                }
            }
        }

        if (students.length > 0) {
            setIsLoading(true);
            try {
                const response = await axios.post(config.api + '/adminAddStudentsBulk.php', { students }, {
                    headers: { 'Content-Type': 'application/json' }
                });

                if (response.data.status_code === 200) {
                    setSendSuccessMessage(`${students.length} students added successfully.`);
                } else {
                    setSendErrorMessage(response.data.message);
                }
            } catch (error) {
                console.error('Error adding students:', error);
                setSendErrorMessage('Network error. Please try again.');
            }
            setIsLoading(false);
        }
    };

    return (
        <Drawer
            title="Admin Panel"
            placement="right"
            onClose={() => setIsVisible(false)}
            open={isVisible}
            width={500}
        >
            {isLoading && <div className="central-overlay-spinner">
                <div className="spinner-text">&nbsp;&nbsp;
                    <Spin size="large" />
                    Processing...
                </div>
            </div>}

            {!activeSection && (
                <div className="admin-menu">
                    <h3>Admin Functions</h3>
                    <button className="admin-option-button" onClick={() => setActiveSection('user')}>
                        Add New User
                    </button>
                    <button className="admin-option-button" onClick={() => setActiveSection('course')}>
                        Add Course
                    </button>
                    <button className="admin-option-button" onClick={() => setActiveSection('student')}>
                        Add Students
                    </button>
                </div>
            )}

            {activeSection === 'user' && (
                <div className="admin-section">
                    <h3>Add New User</h3>
                    <div className="form-group">
                        <label>Email (required):</label>
                        <input
                            type="email"
                            value={newUserEmail}
                            onChange={(e) => setNewUserEmail(e.target.value)}
                            placeholder="user@example.com"
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label>Full Name (required):</label>
                        <input
                            type="text"
                            value={newUserName}
                            onChange={(e) => setNewUserName(e.target.value)}
                            placeholder="Full Name"
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label>Department:</label>
                        <input
                            type="text"
                            value={newUserDepartment}
                            onChange={(e) => setNewUserDepartment(e.target.value)}
                            placeholder="Department"
                        />
                    </div>
                    <div className="form-group">
                        <label>Admin Status:</label>
                        <select value={newUserAdmin} onChange={(e) => setNewUserAdmin(parseInt(e.target.value))}>
                            <option value={0}>Regular User</option>
                            <option value={1}>Administrator</option>
                        </select>
                    </div>
                    <div className="form-actions">
                        <button onClick={handleAddUser} disabled={isLoading}>
                            {isLoading ? <Spin /> : 'Add User'}
                        </button>
                        <button onClick={() => setActiveSection(null)}>Back</button>
                    </div>
                </div>
            )}

            {activeSection === 'course' && (
                <div className="admin-section">
                    <h3>Add Course</h3>
                    <div className="form-group">
                        <label>Course Name (required):</label>
                        <input
                            type="text"
                            value={courseName}
                            onChange={(e) => setCourseName(e.target.value)}
                            placeholder="Course Name"
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label>Taught By (required):</label>
                        <select value={taughtBy} onChange={(e) => setTaughtBy(e.target.value)} required>
                            <option value="">Select Teacher</option>
                            {Array.isArray(users) && users.map(user => (
                                <option key={user.id} value={user.id}>
                                    {user.staffName}
                                </option>
                            ))}
                        </select>
                    </div>
                    <div className="form-group">
                        <label>Year:</label>
                        <div className="radio-group">
                            <label><input type="radio" value={1} checked={courseYear === 1} onChange={(e) => setCourseYear(parseInt(e.target.value))} /> Year 1</label>
                            <label><input type="radio" value={2} checked={courseYear === 2} onChange={(e) => setCourseYear(parseInt(e.target.value))} /> Year 2</label>
                        </div>
                    </div>
                    <div className="form-group">
                        <label>Level:</label>
                        <div className="radio-group">
                            <label><input type="radio" value="2" checked={courseLevel === "2"} onChange={(e) => setCourseLevel(e.target.value)} /> Level 2</label>
                            <label><input type="radio" value="3" checked={courseLevel === "3"} onChange={(e) => setCourseLevel(e.target.value)} /> Level 3</label>
                            <label><input type="radio" value="4" checked={courseLevel === "4"} onChange={(e) => setCourseLevel(e.target.value)} /> Level 4</label>
                        </div>
                    </div>
                    <div className="form-group">
                        <label>Group:</label>
                        <select value={courseGroup} onChange={(e) => setCourseGroup(e.target.value)}>
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                            <option value="D">D</option>
                        </select>
                    </div>
                    <div className="form-actions">
                        <button onClick={handleAddCourse} disabled={isLoading}>
                            {isLoading ? <Spin /> : 'Add Course'}
                        </button>
                        <button onClick={() => setActiveSection(null)}>Back</button>
                    </div>
                </div>
            )}

            {activeSection === 'student' && (
                <div className="admin-section">
                    <h3>Add Students</h3>

                    <div className="bulk-upload-section">
                        <h4>Bulk Upload (CSV)</h4>
                        <input
                            type="file"
                            accept=".csv"
                            onChange={handleCSVUpload}
                            disabled={isLoading}
                        />
                        <button
                            onClick={processCSVUpload}
                            disabled={isLoading || !selectedCSVFile}
                            className="admin-button"
                        >
                            Upload Students
                        </button>
                        <small>CSV format: studentId,lastName,firstName,courseName</small>
                    </div>

                    <div className="individual-add-section">
                        <h4>Add Individual Student</h4>
                        <div className="form-group">
                            <label>Student ID (required):</label>
                            <input
                                type="text"
                                value={studentId}
                                onChange={(e) => setStudentId(e.target.value)}
                                placeholder="Student ID"
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label>First Name (required):</label>
                            <input
                                type="text"
                                value={firstName}
                                onChange={(e) => setFirstName(e.target.value)}
                                placeholder="First Name"
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label>Last Name (required):</label>
                            <input
                                type="text"
                                value={lastName}
                                onChange={(e) => setLastName(e.target.value)}
                                placeholder="Last Name"
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label>Course (required):</label>
                            <select value={studentCourse} onChange={(e) => setStudentCourse(e.target.value)} required>
                                <option value="">Select Course</option>
                                {courses.map(course => (
                                    <option key={course.id} value={course.id}>
                                        {course.courseName}
                                    </option>
                                ))}
                            </select>
                        </div>
                        <div className="form-actions">
                            <button onClick={handleAddStudent} disabled={isLoading}>
                                {isLoading ? <Spin /> : 'Add Student'}
                            </button>
                            <button onClick={() => setActiveSection(null)}>Back</button>
                        </div>
                    </div>
                </div>
            )}
        </Drawer>
    );
}

export default AdminDrawer;