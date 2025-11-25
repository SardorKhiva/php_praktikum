<?php

// MySQLi orqali ulanish
$mysqli = null;
try {
    $mysqli = new mysqli('localhost', 'root', '1302', 'temp');
    echo "mysqli orqali mysql ga ulandi!\n";
} catch (Throwable $th) {
    print ($th);
}

if ($mysqli->connect_error) {
    die('Connect Error :(') . PHP_EOL;
}

$pdo = null;
try {
    $pdo = new PDO("mysql:host=localhost; dbname=temp", 'root', '1302');
    echo "PDO orqali MySQL ga ulandi!\n";
} catch (Throwable $e) {
    print $e->getMessage() . PHP_EOL;
}

//$mysqli->close();
//$pdo = null;