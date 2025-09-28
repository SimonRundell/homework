import { useState } from 'react';
import { Drawer, DatePicker } from 'antd';
import dayjs from 'dayjs';
import axios from 'axios';

function AddHomework({ config, courseId, visible, onClose, setShowErrorMessage, setShowSuccessMessage, setUpdateHomeworkList }) {
  const dateFormat = 'DD/MM/YYYY HH:mm';

  const [hwStartDate, setHWStartDate] = useState(dayjs());
  const [hwDeadline, setHWDeadline] = useState(dayjs().add(6, 'day').startOf('day'));
  const [description, setDescription] = useState('');

  const disabledTime = () => ({
    disabledHours: () => {
      const hours = [];
      // Disable hours before 9am only
      for (let i = 0; i < 24; i++) {
        if (i < 9) {
          hours.push(i);
        }
      }
      return hours;
    },
  });

  const handleSubmit = async () => {
    if (!description) {
      setShowErrorMessage('Please enter a homework description.');
      return;
    }

    const jsonData = {
      courseId: courseId,
      dateSet: hwStartDate.format('YYYY-MM-DD HH:mm:ss'),
      dateDue: hwDeadline.format('YYYY-MM-DD HH:mm:ss'),
      description: description,
      completed: 0
    };

    // console.log("Submitting homework:", jsonData);

    try {
      const response = await axios.post(config.api +'/insertHomework.php', jsonData);
      if (response.status === 200) {
        setShowSuccessMessage('Homework created successfully!');
        setUpdateHomeworkList(prev => !prev); // Trigger homework list update
      } else {
        setShowErrorMessage('Failed to create homework.');
      }
    } catch (error) {
      setShowErrorMessage('Error creating homework: ' + error.message);
    }
    onClose();
  };

  const handleFormSubmit = (event) => {
    event.preventDefault();
    handleSubmit();
  };

  return (
    <Drawer
      title="Add New Homework"
      placement="right"
      onClose={onClose}
      open={visible}
      width={400}
    >
      <form className="login-form" onSubmit={handleFormSubmit}>
        <div className="form-group">
          <label>Date Homework Set:</label>
          <DatePicker
            showTime
            format={dateFormat}
            value={hwStartDate}
            onChange={setHWStartDate}
            disabledTime={disabledTime}
            style={{ width: '100%' }}
          />
        </div>
        <div className="form-group">
          <label>Date of Deadline:</label>
          <DatePicker
            showTime
            format={dateFormat}
            value={hwDeadline}
            onChange={setHWDeadline}
            disabledTime={disabledTime}
            style={{ width: '100%' }}
          />
        </div>
        <div className="form-group">
          <label>Homework Description:</label>
          <textarea
            className="hwdescription"
            rows={8}
            placeholder="Homework description"
            value={description}
            onChange={(e) => setDescription(e.target.value)}
          />
        </div>
        <div className="form-group">
            <button type="submit">
              Create Homework
            </button>
        </div>
      </form>
    </Drawer>
  );
}

export default AddHomework;