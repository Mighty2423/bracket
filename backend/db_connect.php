<?php
$host = "bracket.c7ykagzynji7.us-east-1.rds.amazonaws.com"; // RDS Endpoint
$username = "admin";
$password = "password";
$dbname = "VolleyballTournament";
$port = getenv("DATABASE_PORT") ?: "3306"; // Ensure port is set

// Use proper variable name and cast port to integer
$conn = new mysqli($host, $username, $password, $dbname, (int)$port);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "Connected successfully!";
?>
