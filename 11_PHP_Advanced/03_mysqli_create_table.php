<?php

// mysqli orqali bazaga ualanamiz
require '01_old_connect.php';

$create_table = "CREATE TABLE IF NOT EXISTS `users` (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);";

if($conn->query($create_table) === TRUE) {
    echo "Table created successfully" . PHP_EOL;
} else {
    echo "Error creating table: " . $conn->error . PHP_EOL;
}

$conn->close(); // close connect

// query() - SQL so'rovlarni bajaruvchi funksiya