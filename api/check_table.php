<?php
include 'setup.php';
$result = $mysqli->query('DESCRIBE tblhomeworkset');
while($row = $result->fetch_assoc()) {
    echo $row['Field'] . ' ' . $row['Type'];
    if ($row['Key'] == 'PRI') echo ' PRIMARY KEY';
    if ($row['Extra'] == 'auto_increment') echo ' AUTO_INCREMENT';
    echo "\n";
}
?>