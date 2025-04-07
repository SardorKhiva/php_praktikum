<?php

global $conn;
require_once("01_connect.php");

$drop_db = "DROP DATABASE IF EXISTS testBaza";
//$conn->exec($drop_db);

// yangi baza hosil qilish: IF NOT EXISTS
$create_db = "CREATE DATABASE testBaza";

try {
    $conn->prepare($create_db);
    $conn->exec($create_db);
    echo "testBaza hosil qilindi!\n";
} catch (Exception $e) {
    echo "Baza hosil qilinmadi: " . $e->getMessage() . PHP_EOL;
}