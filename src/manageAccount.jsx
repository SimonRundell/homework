import {useState, useEffect} from 'react';
import axios from 'axios';
import CryptoJS from 'crypto-js';
import { Drawer, Modal, Spin } from 'antd';

function ManageAccount({ config, userDetails, setUserDetails, setSendSuccessMessage, setSendErrorMessage, isVisible, setIsVisible }) {
    const [isLoading, setIsLoading] = useState(false);
    const [email, setEmail] = useState('');
    const [userName, setUserName] = useState('');
    const [userLocation, setUserLocation] = useState('');
    const [avatar, setAvatar] = useState('');
    const [avatarPreview, setAvatarPreview] = useState('');
    const [currentPassword, setCurrentPassword] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [confirmNewPassword, setConfirmNewPassword] = useState('');

    useEffect(() => {
        if (userDetails) {
            setEmail(userDetails.email);
            setUserName(userDetails.staffName);
            setUserLocation(userDetails.departmentName);
            setAvatar(userDetails.avatar);
        }

        // Load default avatar if not set
        if (!userDetails?.avatar) {
            loadDefaultAvatar();
        } else {
            setAvatarPreview(userDetails.avatar);
        }
    }, [userDetails]);

    const loadDefaultAvatar = async () => {
        try {
            const response = await fetch('/images/default-avatar.png');
            const blob = await response.blob();
            const reader = new FileReader();
            reader.onload = () => {
                const base64 = reader.result;
                setAvatar(base64);
                setAvatarPreview(base64);
            };
            reader.readAsDataURL(blob);
        } catch (error) {
            console.error('Error loading default avatar:', error);
            setAvatarPreview('');
        }
    };

    const validatePasswordStrength = (password) => {
        // Minimum 8 characters
        if (password.length < 8) {
            return 'Password must be at least 8 characters long';
        }
        
        // Check for uppercase letter
        if (!/[A-Z]/.test(password)) {
            return 'Password must contain at least one uppercase letter';
        }
        
        // Check for lowercase letter
        if (!/[a-z]/.test(password)) {
            return 'Password must contain at least one lowercase letter';
        }
        
        // Check for number
        if (!/\d/.test(password)) {
            return 'Password must contain at least one number';
        }
        
        return null; // Valid password
    };

    const handleAvatarChange = (event) => {
        const file = event.target.files[0];
        if (!file) return;

        // Validate file type
        const allowedTypes = ['image/png', 'image/jpeg', 'image/gif'];
        if (!allowedTypes.includes(file.type)) {
            setSendErrorMessage('Please select a PNG, JPG, or GIF image');
            return;
        }

        // Validate file size (2MB max)
        const maxSize = 2 * 1024 * 1024; // 2MB in bytes
        if (file.size > maxSize) {
            setSendErrorMessage('Image size must be less than 2MB');
            return;
        }

        // Convert to base64
        const reader = new FileReader();
        reader.onload = () => {
            const base64 = reader.result;
            setAvatar(base64);
            setAvatarPreview(base64);
        };
        reader.readAsDataURL(file);
    };

    const handleSave = async () => {
        if (email === '' || userName === '') {
            setSendErrorMessage('Please fill in all required fields');
            return;
        }

        // Handle password change logic
        let passwordHash = null;
        if (newPassword !== '' || confirmNewPassword !== '') {
            if (newPassword !== confirmNewPassword) {
                setSendErrorMessage('New passwords do not match');
                return;
            }
            if (currentPassword === '') {
                setSendErrorMessage('Please enter your current password to change it');
                return;
            }
            
            // Validate password strength
            const passwordError = validatePasswordStrength(newPassword);
            if (passwordError) {
                setSendErrorMessage(passwordError);
                return;
            }
            
            // Hash the new password
            passwordHash = CryptoJS.MD5(newPassword).toString();
        } else {
            // Use existing password hash if no new password is set
            passwordHash = userDetails.passwordHash;
        }

        setIsLoading(true);

        
        const jsonData = {
            userId: userDetails.id,
            email: email,
            staffName: userName,
            departmentName: userLocation,
            avatar: avatar,
            passwordHash: passwordHash
        };

        // console.log("JSONData:", jsonData);

        try {
            const response = await axios.post(config.api + '/updateUser.php', jsonData, {
                headers: {
                    'Content-Type': 'application/json', 
                },
            });
            const data = response.data;
            if (data.status_code === 200) {
                const updatedUser = JSON.parse(data.message)[0];
                setUserDetails(updatedUser);
                // console.log('New details:', updatedUser);
                setSendSuccessMessage('Account updated successfully');
                setIsVisible(false);
            } else {
                setSendErrorMessage(data.message);
            }
        } catch (error) {
            console.error('Error:', error);
            setSendErrorMessage('Network error. Please try again.');
        }
        setIsLoading(false);
    };

    return (
        <>
            <Drawer
                title="Manage Account"
                placement="right"
                onClose={() => setIsVisible(false)}
                open={isVisible}
                width={400}
                className="manage-account-drawer"

            >
                {isLoading && <div className="central-overlay-spinner">            
                    <div className="spinner-text">&nbsp;&nbsp;
                        <Spin size="large" />
                        Saving...
                    </div>
                </div>}
                <div className="form-group">
                    <label>Email (required) <small>Note: this is your login</small>:</label>
                    <input
                        type="email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        placeholder="Email"
                        required
                        disabled={isLoading}
                    />
                </div>
                <div className="form-group">
                    <label>Full Name (required):</label>
                    <input
                        type="text"
                        value={userName}
                        onChange={(e) => setUserName(e.target.value)}
                        placeholder="Full Name"
                        required
                        disabled={isLoading}
                    />
                </div>
                <div className="form-group">
                    <label>Department:</label>
                    <input
                        type="text"
                        value={userLocation}
                        onChange={(e) => setUserLocation(e.target.value)}
                        placeholder="Department"
                    />
                </div>
                <div className="form-group">
                    <label>Current Password (required for password change):</label>
                    <input
                        type="password"
                        value={currentPassword}
                        onChange={(e) => setCurrentPassword(e.target.value)}
                        placeholder="Enter current password"
                        disabled={isLoading}
                    />
                </div>
                <div className="form-group">
                    <label>New Password (leave blank to keep current):</label>
                    <input
                        type="password"
                        value={newPassword}
                        onChange={(e) => setNewPassword(e.target.value)}
                        placeholder="Enter new password"
                        disabled={isLoading}
                    />
                    <small>Password must be at least 8 characters with uppercase, lowercase, and numbers</small>
                </div>
                <div className="form-group">
                    <label>Confirm New Password:</label>
                    <input
                        type="password"
                        value={confirmNewPassword}
                        onChange={(e) => setConfirmNewPassword(e.target.value)}
                        placeholder="Confirm new password"
                        disabled={isLoading}
                    />
                </div>
                <div className="form-group">
                    <label>Avatar:</label>
                    <div className="avatar-section">
                        {avatarPreview && (
                            <img 
                                src={avatarPreview} 
                                alt="Avatar Preview" 
                                className="avatar-preview" 
                            />
                        )}
                        <input
                            type="file"
                            accept="image/png,image/jpeg,image/gif"
                            onChange={handleAvatarChange}
                            disabled={isLoading}
                            className="avatar-input"
                        />
                        <small>Max 2MB. PNG, JPG, or GIF only.</small>
                    </div>
                </div>
                                    <div>
                        <button className="medium-button" onClick={handleSave} disabled={isLoading}>
                            {isLoading ? <Spin /> : 'Save'}
                        </button>
                        <button className="medium-button" onClick={() => setIsVisible(false)} disabled={isLoading} style={{ marginLeft: '8px' }}>
                            Cancel
                        </button>
                    </div>
            </Drawer>
        </>
    );
};

export default ManageAccount;