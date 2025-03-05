<?php
$host = getenv("DATABASE_HOST");
$user = getenv("DATABASE_USER");
$password = getenv("DATABASE_PASSWORD");
$dbname = getenv("DATABASE_NAME");

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
