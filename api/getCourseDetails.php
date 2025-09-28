<?php
include 'setup.php';

$query = "SELECT * FROM tblcourse WHERE id = ?";
$stmt = $mysqli->prepare($query);

if (!$stmt) {
    log_info("Prepare failed: " . $mysqli->error);
    send_response("Prepare failed: " . $mysqli->error, 500);
}

$stmt->bind_param("s", $receivedData['courseId']);

if (!$stmt->execute()) {
    log_info("Execute failed: " . $stmt->error);
    send_response("Execute failed: " . $stmt->error, 500);
}

$result = $stmt->get_result();

if ($result) {
    $row = mysqli_fetch_assoc($result);
    if ($row) {
        $json = json_encode($row);
        send_response($json, 200);
    } else {
        send_response("Course not found", 404);
    }
} else {
    log_info("Query failed: " . $mysqli->error);
    send_response("Query failed: " . $mysqli->error, 500);
}