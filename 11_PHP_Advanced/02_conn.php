<?php

try {
    $conn = new PDO ("mysql:host=localhost;dbname=test", "root", "1302");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//    echo "PDO orqali MySQL ga ulandi" . PHP_EOL;
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage() . PHP_EOL;
}