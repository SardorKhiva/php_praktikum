<?php

$servername = 'localhost';
$username = 'root';
$password = '1302';
$dbname = 'test';

try {
    $conn = new mysqli($servername, $username, $password, $dbname);
//    echo 'mysqli orqali MySQL ga ulandi' . PHP_EOL;
} catch (mysqli_sql_exception $e) {
//    print_r($e);
    echo 'mysqli orqali MySQL ga ulanmadi: ' . $e->getMessage() . PHP_EOL;
}

// ulanganligini tekshirish
/*
if($conn->connect_error) {
    die("Connection failed");
} else {
    echo "Connected successfully" . PHP_EOL;
}
*/

// close connect
//$conn->close();