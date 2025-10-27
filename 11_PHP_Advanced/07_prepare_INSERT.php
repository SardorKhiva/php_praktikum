<?php

require '02_conn.php';

$insert = "INSERT INTO test.talaba (firstname, lastname, email)
           VALUES (?, ?, ?);";

$stmt = $conn->prepare($insert);

try {
    $stmt->execute(['ism', 'familya', 'pochta']);
    echo 'prepare() orqali INSERT qilindi' . PHP_EOL;
} catch (Exception $e) {
    echo 'prepare() orqali INSERT qilishda xatolik: ' . $e->getMessage() . PHP_EOL;
}