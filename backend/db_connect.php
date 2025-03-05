<?php
$host = "your-db-host";  // Example: "localhost" or AWS RDS endpoint
$username = "your-db-user";
$password = "your-db-password";
$database = "bracket_db";  // Change to your actual database name

// Create connection
$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
