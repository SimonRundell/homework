<?php
include 'setup.php';

$courseName = trim($receivedData['courseName'] ?? '');
$taughtBy = (int)($receivedData['taughtBy'] ?? 0);
$year = (int)($receivedData['year'] ?? 1);
$level = trim($receivedData['level'] ?? '3');
$group = trim($receivedData['group'] ?? 'A');

if (empty($courseName) || !$taughtBy) {
    send_response("Course name and teacher are required", 400);
}

// Check if teacher exists
$query = "SELECT id FROM tbluser WHERE id = ?";
$stmt = $mysqli->prepare($query);

if (!$stmt) {
    log_info("Prepare failed: " . $mysqli->error);
    send_response("Prepare failed: " . $mysqli->error, 500);
}

$stmt->bind_param("i", $taughtBy);

if (!$stmt->execute()) {
    log_info("Execute failed: " . $stmt->error);
    send_response("Execute failed: " . $stmt->error, 500);
}

$result = $stmt->get_result();
if (!$result || !$result->fetch_assoc()) {
    send_response("Invalid teacher ID", 400);
}

$stmt->close();

// Insert new course
$query = "INSERT INTO tblcourse (courseName, taughtBy, year, level, `group`) VALUES (?, ?, ?, ?, ?)";
$stmt = $mysqli->prepare($query);

if (!$stmt) {
    log_info("Prepare failed: " . $mysqli->error);
    send_response("Prepare failed: " . $mysqli->error, 500);
}

$stmt->bind_param("siiss", $courseName, $taughtBy, $year, $level, $group);

if (!$stmt->execute()) {
    log_info("Execute failed: " . $stmt->error);
    send_response("Execute failed: " . $stmt->error, 500);
}

send_response("Course added successfully", 200);