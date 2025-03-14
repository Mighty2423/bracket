<?php
include 'db_connect.php';  // Include database connection

$query = "SELECT t1.name AS team1, t2.name AS team2, m.match_time, l.name AS location
          FROM Matches m
          JOIN Teams t1 ON m.team1_id = t1.team_id
          JOIN Teams t2 ON m.team2_id = t2.team_id
          JOIN Locations l ON m.location_id = l.location_id
          ORDER BY m.match_time";
$result = $conn->query($query);

$schedule = array();

while ($row = $result->fetch_assoc()) {
    $schedule[] = $row;
}

echo json_encode($schedule); // Send JSON data

$conn->close();
?>
