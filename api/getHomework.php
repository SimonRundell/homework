<?php
include 'setup.php';

$query = "SELECT h.*, s.studentId, s.firstName, s.lastName, t.status, t.comment, t.id as trackerId
          FROM tblhomeworkset h
          LEFT JOIN tblhomeworktracker t ON h.id = t.homeworksetId
          LEFT JOIN tblstudents s ON t.studentId = s.id
          WHERE h.courseId = ?
          ORDER BY s.lastName, s.firstName, h.id";
$stmt = $mysqli->prepare($query);

if (!$stmt) {
    log_info("Prepare failed: " . $mysqli->error);
    send_response("Prepare failed: " . $mysqli->error, 500);
}

$stmt->bind_param("i", $receivedData['courseId']);

if (!$stmt->execute()) {
    log_info("Execute failed: " . $stmt->error);
    send_response("Execute failed: " . $stmt->error, 500);
}

$result = $stmt->get_result();

if ($result) {
    $homeworks = [];
    while ($row = $result->fetch_assoc()) {
        $hwId = $row['id'];
        if (!isset($homeworks[$hwId])) {
            $homeworks[$hwId] = [
                'id' => $row['id'],
                'courseId' => $row['courseId'],
                'dateSet' => $row['dateSet'],
                'dateDue' => $row['dateDue'],
                'description' => $row['description'],
                'completed' => $row['completed'],
                'students' => []
            ];
        }
        if ($row['studentId']) {
            $homeworks[$hwId]['students'][] = [
                'trackerId' => $row['trackerId'],
                'studentId' => $row['studentId'],
                'firstName' => $row['firstName'],
                'lastName' => $row['lastName'],
                'status' => $row['status'],
                'comment' => $row['comment']
            ];
        }
    }
    $json = json_encode(array_values($homeworks));
    send_response($json, 200);
} else {
    log_info("Query failed: " . $mysqli->error);
    send_response("Query failed: " . $mysqli->error, 500);
}