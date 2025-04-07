<?php

require 'talaba_truncate.php';

$conn = null;
try {
    $conn = new PDO("mysql: host = 'localhost'; dbname = 'test'", 'root', '1302');
    echo 'Connected' . PHP_EOL;
} catch (PDOException $e) {
    echo "Not connected: " . $e->getMessage() . PHP_EOL;
}

$insert = "INSERT INTO test.talaba (firstname, lastname, email)
VALUES(?, ?, ?);";

$stmt = $conn->prepare($insert);

try {
    $stmt->execute(['ISM', 'FAMILYA', 'pochta@mail.uz']);
    echo "Query executed\n";
} catch (Exception $e) {
    echo "Query not executed: " . $e->getMessage() . PHP_EOL;
}

// boshqacha massiv usulida INSERT qilish
$data_arr = [
    ":firstname" => "iSm",
    ":lastname" => "fAmIlYa",
    ":email" => "mail@mail.uz"
];

$insert = "INSERT INTO test.talaba(firstname, lastname, email)
VALUES(:firstname, :lastname, :email);";

$stmt2 = $conn->prepare($insert);

try {
    $stmt2->execute($data_arr);
    echo "Data inserted!\n";
} catch (Exception $e) {
    print_r($e);
}

// qo'shimcha mashq
$fistname = "Sardor";
$lastname = "Xorazmlik";
$email = "mail@ma.uz";

$massiv = [
    ':firstname' => $fistname,
    ':lastname' => $lastname,
    ':email' => $email
];

$insert2 = "INSERT INTO test.talaba(firstname, lastname, email)
VALUES(:firstname, :lastname, :email);";

$stmt3 = $conn->prepare($insert2);

try {
    $stmt3->execute($massiv);
    echo "Massiv inserted!\n";
} catch (Exception $e) {
    print_r($e);
}


//
$talaba = [
    ':firstname' => 'Arnold',
    ':lastname' => 'Shvartznegr',
    ':email' => 'terminator@mail.us'
];

$arr_insert = "INSERT INTO test.talaba(firstname, lastname, email)
VALUES (:firstname, :lastname, :email);";

$stmt4 = $conn->prepare($arr_insert);

try {
    $stmt4->execute($talaba);
    echo "Talaba massivi INSERT qilindi\n";
} catch (Exception $e) {
    echo PHP_EOL;
    print_r($e);
}