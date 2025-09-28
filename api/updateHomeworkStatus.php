<?php
include 'setup.php';

if (isset($receivedData['updates']) && is_array($receivedData['updates'])) {
    // Bulk update
    $updates = $receivedData['updates'];
    $successCount = 0;
    $errors = [];

    foreach ($updates as $update) {
        $query = "UPDATE tblhomeworktracker SET status = ?, comment = ? WHERE id = ?";
        $stmt = $mysqli->prepare($query);

        if (!$stmt) {
            $errors[] = "Prepare failed: " . $mysqli->error;
            continue;
        }

        $stmt->bind_param("ssi", $update['status'], $update['comment'], $update['trackerId']);

        if (!$stmt->execute()) {
            $errors[] = "Execute failed for trackerId {$update['trackerId']}: " . $stmt->error;
        } else {
            $successCount++;
        }

        $stmt->close();
    }

    if (empty($errors)) {
        send_response("All statuses updated successfully", 200);
    } else {
        send_response("Some updates failed: " . implode(', ', $errors), 500);
    }
} else {
    // Single update (backward compatibility)
    $query = "UPDATE tblhomeworktracker SET status = ?, comment = ? WHERE id = ?";
    $stmt = $mysqli->prepare($query);

    if (!$stmt) {
        log_info("Prepare failed: " . $mysqli->error);
        send_response("Prepare failed: " . $mysqli->error, 500);
    }

    $stmt->bind_param("ssi", $receivedData['status'], $receivedData['comment'], $receivedData['trackerId']);

    if (!$stmt->execute()) {
        log_info("Execute failed: " . $stmt->error);
        send_response("Execute failed: " . $stmt->error, 500);
    }

    if ($stmt->affected_rows > 0) {
        send_response("Status updated successfully", 200);
    } else {
        send_response("No rows updated", 404);
    }

    $stmt->close();
}
?>