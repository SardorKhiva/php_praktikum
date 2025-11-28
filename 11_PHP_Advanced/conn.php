<?php

// pdo ulanish
try {
    $pdo = new PDO("mysql:host=localhost;dbname=test", "root", "1302");
} catch (PDOException $e) {
    echo "PDO xatolik: " . $e->getMessage();
}

// mysqli ulanish
try {
    $mysqli = new mysqli("localhost", "root", "1302", "test");
} catch (Throwable $e) {
    echo "mysqli xatolik: " . $e->getMessage();
}