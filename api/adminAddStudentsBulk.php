<?php
include 'setup.php';

if (!isset($receivedData['students'])) {
    send_response("Invalid JSON data or missing students array", 400);
}

$students = $receivedData['students'];
$successCount = 0;
$errors = [];

$mysqli->begin_transaction();

foreach ($students as $student) {
    $studentId = trim($student['studentId'] ?? '');
    $firstName = trim($student['firstName'] ?? '');
    $lastName = trim($student['lastName'] ?? '');
    $course = (int)($student['course'] ?? 0);

    if (empty($studentId) || empty($firstName) || empty($lastName) || !$course) {
        $errors[] = "Missing required fields for student ID: $studentId";
        continue;
    }

    // Check if course exists
    $query = "SELECT id FROM tblcourse WHERE id = ?";
    $stmt = $mysqli->prepare($query);

    if (!$stmt) {
        log_info("Prepare failed: " . $mysqli->error);
        $errors[] = "Database error for student ID: $studentId";
        continue;
    }

    $stmt->bind_param("i", $course);

    if (!$stmt->execute()) {
        log_info("Execute failed: " . $stmt->error);
        $errors[] = "Database error for student ID: $studentId";
        $stmt->close();
        continue;
    }

    $result = $stmt->get_result();
    if (!$result || !$result->fetch_assoc()) {
        $errors[] = "Invalid course ID for student ID: $studentId";
        $stmt->close();
        continue;
    }

    $stmt->close();

    // Check if student ID already exists
    $query = "SELECT id FROM tblstudents WHERE studentId = ?";
    $stmt = $mysqli->prepare($query);

    if (!$stmt) {
        log_info("Prepare failed: " . $mysqli->error);
        $errors[] = "Database error for student ID: $studentId";
        continue;
    }

    $stmt->bind_param("s", $studentId);

    if (!$stmt->execute()) {
        log_info("Execute failed: " . $stmt->error);
        $errors[] = "Database error for student ID: $studentId";
        $stmt->close();
        continue;
    }

    $result = $stmt->get_result();
    if ($result && $result->fetch_assoc()) {
        $errors[] = "Student ID already exists: $studentId";
        $stmt->close();
        continue;
    }

    $stmt->close();

    // Insert student
    $query = "INSERT INTO tblstudents (studentId, firstName, lastName, course) VALUES (?, ?, ?, ?)";
    $stmt = $mysqli->prepare($query);

    if (!$stmt) {
        log_info("Prepare failed: " . $mysqli->error);
        $errors[] = "Database error for student ID: $studentId";
        continue;
    }

    $stmt->bind_param("sssi", $studentId, $firstName, $lastName, $course);

    if (!$stmt->execute()) {
        log_info("Execute failed: " . $stmt->error);
        $errors[] = "Failed to insert student ID: $studentId";
        $stmt->close();
        continue;
    }

    $stmt->close();
    $successCount++;
}

if ($successCount > 0 && empty($errors)) {
    $mysqli->commit();
    send_response("$successCount students added successfully", 200);
} elseif ($successCount > 0) {
    $mysqli->commit();
    send_response("$successCount students added successfully. Errors: " . implode('; ', $errors), 207);
} else {
    $mysqli->rollback();
    send_response('No students were added. Errors: ' . implode('; ', $errors), 400);
}