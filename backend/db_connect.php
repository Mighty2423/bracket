<?php
$host = getenv("DATABASE_HOST") ?: "db"; // Default to 'db' for Docker networking
$user = getenv("DATABASE_USER") ?: "root";
$password = getenv("DATABASE_PASSWORD") ?: "";
$dbname = getenv("DATABASE_NAME") ?: "VolleyballTournament";
$port = getenv("DATABASE_PORT") ?: "3306"; // Ensure port is set

$conn = new mysqli($host, $user, $password, $dbname, $port);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>