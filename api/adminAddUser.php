<?php
include 'setup.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

$email = trim($receivedData['email'] ?? '');
$staffName = trim($receivedData['staffName'] ?? '');
$departmentName = trim($receivedData['departmentName'] ?? '');
$admin = (int)($receivedData['admin'] ?? 0);
$passwordHash = $receivedData['passwordHash'] ?? '';
$defaultPassword = $receivedData['defaultPassword'] ?? '';

if (empty($email) || empty($staffName) || empty($passwordHash)) {
    send_response("Email, staff name, and password are required", 400);
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    send_response("Invalid email format", 400);
}

// Check if email already exists
$query = "SELECT id FROM tbluser WHERE email = ?";
$stmt = $mysqli->prepare($query);

if (!$stmt) {
    log_info("Prepare failed: " . $mysqli->error);
    send_response("Prepare failed: " . $mysqli->error, 500);
}

$stmt->bind_param("s", $email);

if (!$stmt->execute()) {
    log_info("Execute failed: " . $stmt->error);
    send_response("Execute failed: " . $stmt->error, 500);
}

$result = $stmt->get_result();
if ($result && $result->fetch_assoc()) {
    send_response("Email already exists", 400);
}

$stmt->close();

// Insert new user
$query = "INSERT INTO tbluser (email, staffName, departmentName, admin, passwordHash) VALUES (?, ?, ?, ?, ?)";
$stmt = $mysqli->prepare($query);

if (!$stmt) {
    log_info("Prepare failed: " . $mysqli->error);
    send_response("Prepare failed: " . $mysqli->error, 500);
}

$stmt->bind_param("sssis", $email, $staffName, $departmentName, $admin, $passwordHash);

if (!$stmt->execute()) {
    log_info("Execute failed: " . $stmt->error);
    send_response("Execute failed: " . $stmt->error, 500);
}

// Send email with default password
$mail = new PHPMailer(true);

try {
    // Server settings
    $mail->isSMTP();
    $mail->Host = $config['smtpServer'];
    $mail->SMTPAuth = true;
    $mail->Username = $config['smtpUser'];
    $mail->Password = $config['smtpPass'];
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
    $mail->Port = $config['smtpPort'];

    // Recipients
    $mail->setFrom($config['smtpFromEmail'], $config['smtpFrom']);
    $mail->addAddress($email, $staffName);

    // Content
    $mail->isHTML(false);
    $mail->Subject = 'Your Homework Tracker Account';
    $mail->Body = "Hello $staffName,\n\nYour account has been created for the Homework Tracker system.\n\nEmail: $email\nPassword: $defaultPassword\n\nPlease log in and change your password immediately.\n\nBest regards,\nHomework Tracker Admin";

    $mail->send();
} catch (Exception $e) {
    log_info("Email could not be sent. Mailer Error: {$mail->ErrorInfo}");
    // Note: Not sending error response here as user was already added successfully
}

send_response("User added successfully", 200);