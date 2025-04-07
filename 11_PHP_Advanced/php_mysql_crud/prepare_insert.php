<?php

global $conn;
require_once '01_connect.php';

$insert = "INSERT INTO test.talaba (firstname, lastname, email)
VALUES (?, ?, ?);";

$stmt = $conn->prepare($insert);

try {
    $stmt->execute(['dv', 'afdsgb', 'asfgvb']);
    echo 'insert qilindi';
} catch (PDOException $e) {
    echo 'insert qilinmadi: ' . $e->getMessage();
}

echo PHP_EOL;
echo 'Talaba ismi: ';
$firstname = trim(fgets(STDIN));

echo 'Talaba familyasi: ';
$lastname = trim(fgets(STDIN));

echo 'Talaba emaili: ';
$email = trim(fgets(STDIN));

$stmt = $conn->prepare($insert);
try {
    $stmt->execute([$firstname, $lastname, $email]);
    echo 'insert qilindi';
} catch (PDOException $e) {
    echo 'insert qilinmadi: ' . $e->getMessage();
}