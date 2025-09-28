<?php
include 'setup.php';

$studentId = trim($receivedData['studentId'] ?? '');
$firstName = trim($receivedData['firstName'] ?? '');
$lastName = trim($receivedData['lastName'] ?? '');
$course = (int)($receivedData['course'] ?? 0);

if (empty($studentId) || empty($firstName) || empty($lastName) || !$course) {
    send_response("All fields are required", 400);
}

// Check if course exists
$query = "SELECT id FROM tblcourse WHERE id = ?";
$stmt = $mysqli->prepare($query);

if (!$stmt) {
    log_info("Prepare failed: " . $mysqli->error);
    send_response("Prepare failed: " . $mysqli->error, 500);
}

$stmt->bind_param("i", $course);

if (!$stmt->execute()) {
    log_info("Execute failed: " . $stmt->error);
    send_response("Execute failed: " . $stmt->error, 500);
}

$result = $stmt->get_result();
if (!$result || !$result->fetch_assoc()) {
    send_response("Invalid course ID", 400);
}

$stmt->close();

// Check if student ID already exists
$query = "SELECT id FROM tblstudents WHERE studentId = ?";
$stmt = $mysqli->prepare($query);

if (!$stmt) {
    log_info("Prepare failed: " . $mysqli->error);
    send_response("Prepare failed: " . $mysqli->error, 500);
}

$stmt->bind_param("s", $studentId);

if (!$stmt->execute()) {
    log_info("Execute failed: " . $stmt->error);
    send_response("Execute failed: " . $stmt->error, 500);
}

$result = $stmt->get_result();
if ($result && $result->fetch_assoc()) {
    send_response("Student ID already exists", 400);
}

$stmt->close();

// Insert new student
$query = "INSERT INTO tblstudents (studentId, firstName, lastName, course) VALUES (?, ?, ?, ?)";
$stmt = $mysqli->prepare($query);

if (!$stmt) {
    log_info("Prepare failed: " . $mysqli->error);
    send_response("Prepare failed: " . $mysqli->error, 500);
}

$stmt->bind_param("sssi", $studentId, $firstName, $lastName, $course);

if (!$stmt->execute()) {
    log_info("Execute failed: " . $stmt->error);
    send_response("Execute failed: " . $stmt->error, 500);
}

send_response("Student added successfully", 200);