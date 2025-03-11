<?php
$host = "bracket.xxxxxxx.us-east-1.rds.amazonaws.com"; // Use your RDS endpoint
$username = "admin";
$password = "password";
$dbname = "bracket";
$port = getenv("DATABASE_PORT") ?: "3306"; // Ensure port is set

$conn = new mysqli($host, $user, $password, $dbname, $port);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
