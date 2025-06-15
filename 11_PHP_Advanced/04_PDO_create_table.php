<?php

require '02_conn.php';

$sql = "CREATE TABLE `tempTable` (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    text TEXT
)";


try {
    $conn->exec($sql);
    echo 'Table created successfully' . PHP_EOL;
} catch (PDOException $e) {
    echo 'Yangi jadval hosil qilinmadi: ' . $e->getMessage() . PHP_EOL;
}

// exec() - SQL so'rovni bajaruvchi funksiya