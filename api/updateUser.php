<?php

include 'setup.php';

$query = "UPDATE tbluser SET email=?, 
                             passwordHash=?, 
                             staffName=?, 
                             departmentName=?, 
                             avatar=? WHERE id=?
          ";

$stmt = $mysqli->prepare($query);

if (!$stmt) {
    log_info("User update prepare failed: " . $mysqli->error);
    send_response("User update prepare failed: " . $mysqli->error, 500);
} else {
    $stmt->bind_param("sssssi", $receivedData['email'], 
                                 $receivedData['passwordHash'], 
                                 $receivedData['staffName'],
                                 $receivedData['departmentName'],
                                 $receivedData['avatar'],
                                 $receivedData['userId']);
                                 
    if (!$stmt->execute()) {
        log_info("Execute failed: " . $stmt->error);
        send_response("User update failed: " . $stmt->error, 500);
    } else {
        // Fetch the updated user data
        $userQuery = "SELECT id, email, staffName, departmentName, avatar, passwordHash FROM tbluser WHERE id = ?";
        $userStmt = $mysqli->prepare($userQuery);
        
        if (!$userStmt) {
            log_info("User fetch prepare failed: " . $mysqli->error);
            send_response("User fetch prepare failed: " . $mysqli->error, 500);
        } else {
            $userStmt->bind_param("i", $receivedData['userId']);
            
            if (!$userStmt->execute()) {
                log_info("User fetch execute failed: " . $userStmt->error);
                send_response("User fetch failed: " . $userStmt->error, 500);
            } else {
                $result = $userStmt->get_result();
                $userData = $result->fetch_all(MYSQLI_ASSOC);
                send_response(json_encode($userData), 200);
            }
            
            $userStmt->close();
        }
    }
}

$stmt->close();
?>
