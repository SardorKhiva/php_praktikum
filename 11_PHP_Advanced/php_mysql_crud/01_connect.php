<?php

// mysqli orqali MySQL bazaga ulanish
$mysqli_conn = new mysqli('localhost', 'root', '1302', 'test');

// Ulanganini tekshirish
if ($mysqli_conn->connect_error) {
//    die("mysqli orqali MySQL bazaga ulanib bo'lmadi" . PHP_EOL);
    echo "mysqli orqali MySQL bazaga ulanib bo'lmadi"  . PHP_EOL;
}
//else {
//    echo "mysqli orqali MySQL bazaga ulandi" . PHP_EOL;
//}

// PDO orqali bazaga ulanish
try {
    $conn = new PDO ("mysql: host = 'localhost'; dbname = 'test'", 'root', '1302');
//    echo "PDO orqali MySQL ga ulandi" . PHP_EOL;
} catch (PDOException $e) {
    echo "PDO orqali MySQL ga ulanishda xatolik sodir bo'ldi: " . $e->getMessage();
}