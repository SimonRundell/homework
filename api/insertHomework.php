<?php
include 'setup.php';

// Start a transaction
$mysqli->begin_transaction();

try {
    // 0. Check if the course has any students
    $checkQuery = "SELECT COUNT(*) FROM tblstudents WHERE course = ?";
    $checkStmt = $mysqli->prepare($checkQuery);

    if (!$checkStmt) {
        throw new Exception("Student check prepare failed: " . $mysqli->error);
    }

    $checkStmt->bind_param("i", $receivedData['courseId']);
    $checkStmt->execute();
    $checkStmt->bind_result($studentCount);
    $checkStmt->fetch();
    $checkStmt->close();

    if ($studentCount < 1) {
        throw new Exception("No students enrolled in this course. Homework not created.");
    }

    // 1. Insert new homework set
    $query = "INSERT INTO tblhomeworkset (courseId, dateSet, dateDue, description, completed)
              VALUES (?, ?, ?, ?, ?)";
    $stmt = $mysqli->prepare($query);

    if (!$stmt) {
        throw new Exception("Homework create prepare failed: " . $mysqli->error);
    }

    $stmt->bind_param(
        "isssi",
        $receivedData['courseId'],
        $receivedData['dateSet'],
        $receivedData['dateDue'],
        $receivedData['description'],
        $receivedData['completed']
    );

    if (!$stmt->execute()) {
        throw new Exception("Homework creation failed: " . $stmt->error);
    }

    log_info("Homework inserted successfully");

    // Get the inserted homeworksetId
    $homeworksetId = $mysqli->insert_id;
    log_info("HomeworksetId: " . $homeworksetId);

    $stmt->close();

    // 2. Insert tracker entries for all students in that course
    $trackerQuery = "INSERT INTO tblhomeworktracker (homeworksetId, studentId, status) 
                     SELECT ?, id, 'X'
                     FROM tblstudents
                     WHERE course = ?";

    $trackerStmt = $mysqli->prepare($trackerQuery);

    if (!$trackerStmt) {
        throw new Exception("Tracker prepare failed: " . $mysqli->error);
    }

    $trackerStmt->bind_param("ii", $homeworksetId, $receivedData['courseId']);

    if (!$trackerStmt->execute()) {
        throw new Exception("Tracker insertion failed: " . $trackerStmt->error);
    }

    $trackerStmt->close();

    log_info("Tracker entries created successfully");

    // Commit the transaction
    $mysqli->commit();

    send_response("Homework successfully created", 200);

} catch (Exception $e) {
    // Rollback on any error
    $mysqli->rollback();

    log_info($e->getMessage());
    send_response($e->getMessage(), 500);
}
?>
