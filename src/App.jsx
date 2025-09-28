import { useEffect, useState } from 'react'
import appLogo from '/images/logo.svg'
import Login from './Login'
import axios from 'axios';
import { message } from 'antd';
import CourseList from './courseList';
import CourseView from './CourseView';
import ManageAccount from './manageAccount';
import AdminDrawer from './AdminDrawer';


import './App.css'

function App() {
  const [config, setConfig] = useState(null);
  const [userDetails, setUserDetails] = useState(null);
  const [messageApi, contextHolder] = message.useMessage();
  const [sendSuccessMessage, setSendSuccessMessage] = useState(false);
  const [sendErrorMessage, setSendErrorMessage] = useState(false);
  const [showCourse, setShowCourse] = useState(null);
  const [isManageAccountVisible, setIsManageAccountVisible] = useState(false);
  const [isAdminVisible, setIsAdminVisible] = useState(false);

  useEffect(() => {
    axios.get('/.config.json')
      .then(response => {
        // console.log('Config loaded:', response.data);
        setConfig(response.data);
      })
      .catch((error) => {
        console.error('Config loading error:', error);
        setSendErrorMessage('Error fetching config');
      });
  }, []);

  const loadDefaultAvatar = async () => {
    try {
      const response = await fetch('/images/default-avatar.png');
      const blob = await response.blob();
      const reader = new FileReader();
      reader.onload = () => {
        const base64 = reader.result;
        // Update userDetails with default avatar
        setUserDetails(prev => prev ? {...prev, avatar: base64} : null);
      };
      reader.readAsDataURL(blob);
    } catch (error) {
      console.error('Error loading default avatar:', error);
    }
  };

  useEffect(() => {
    if (userDetails && !userDetails.avatar) {
      loadDefaultAvatar();
    }
  }, [userDetails]);

  useEffect(() => {
    if (sendSuccessMessage) {
      messageApi.success(sendSuccessMessage);
      setSendSuccessMessage(false);
    }
    if (sendErrorMessage) {
      messageApi.error(sendErrorMessage);
      setSendErrorMessage(false);
    }
  }, [sendSuccessMessage, sendErrorMessage, messageApi]);

  if (!config) return <div>Application loading...</div>;

  return (
    <>
    {contextHolder}
      <div className="logo-container">
        <img src={appLogo} className="logo" alt="App logo" />
        
      </div>
      <div className="appStrap">Homework Tracker</div>
      {! userDetails && (
        <div className="centred-container">
          <Login
                config={config}
                setSendSuccessMessage={setSendSuccessMessage}
                setSendErrorMessage={setSendErrorMessage}
                setUserDetails={setUserDetails}
              />
            </div>
      )}
      {userDetails && (
        <>
        <div className="userDetails">
          <img 
            src={userDetails.avatar || '/images/default-avatar.png'} 
            alt="User Avatar" 
            className="user-avatar" 
            onClick={() => setIsManageAccountVisible(true)}
          />
          User: {userDetails.staffName}
          <div className="button-row">
            {userDetails.admin === 1 && (
              <button className="admin-button" onClick={() => setIsAdminVisible(true)}>Admin</button>
            )}
            <button className="logout-button" onClick={() => setUserDetails(null)}>Logout</button>
          </div>
        </div>
        <div className="centred-container">
          {!showCourse && (
            <CourseList
              config={config}
              userDetails={userDetails}
              setShowSuccessMessage={setSendSuccessMessage}
              setShowErrorMessage={setSendErrorMessage}
              setShowCourse={setShowCourse}
            />
          )}

          {showCourse && (
            <CourseView
              courseId={showCourse}
              onClose={() => setShowCourse(null)}
              setShowSuccessMessage={setSendSuccessMessage}
              setShowErrorMessage={setSendErrorMessage}
              config={config}
            />
          )}

          {isManageAccountVisible && (
            <ManageAccount
              config={config}
              isVisible={isManageAccountVisible}
              setIsVisible={setIsManageAccountVisible}
              userDetails={userDetails}
              setUserDetails={setUserDetails}
              setSendSuccessMessage={setSendSuccessMessage}
              setSendErrorMessage={setSendErrorMessage}
            />
          )}

          {isAdminVisible && (
            <AdminDrawer
              config={config}
              isVisible={isAdminVisible}
              setIsVisible={setIsAdminVisible}
              setSendSuccessMessage={setSendSuccessMessage}
              setSendErrorMessage={setSendErrorMessage}
            />
          )}

        </div>

      </>
      )}
    </>
  )
}



export default App
