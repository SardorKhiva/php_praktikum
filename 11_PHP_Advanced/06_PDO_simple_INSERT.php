<?php

require('02_conn.php');

$sql_insert = "INSERT INTO test.talaba (firstname, lastname, email) 
               VALUES ('Sardor', 'asdf', 'dszgfS')";

try {
    $conn->exec($sql_insert);
    echo 'Jadvalga INSERT qilindi' . PHP_EOL;
} catch (PDOException $e) {
    echo 'INSERT qilinmadi: ' . $e->getMessage() . PHP_EOL;
}