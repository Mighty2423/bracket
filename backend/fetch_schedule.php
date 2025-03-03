<?php
include 'db_connect.php';  // Include database connection

$query = "SELECT team1, team2, date, time, location FROM schedule ORDER BY date, time";
$result = $conn->query($query);

$schedule = array();

while ($row = $result->fetch_assoc()) {
    $schedule[] = $row;
}

echo json_encode($schedule); // Send JSON data

$conn->close();
?>
