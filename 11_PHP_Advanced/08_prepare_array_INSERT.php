<?php

require '02_conn.php';

$data = [
    ':firstname' => 'Alex',
    ':lastname' => 'Bobbi',
    ':email' => 'alexbobbi@gmail.com'
];

$insert = "INSERT INTO test.talaba (firstname, lastname, email)
            VALUES (:firstname, :lastname, :email);";

$stmt = $conn->prepare($insert);

try {
    $stmt->execute($data);
    echo "data massivi INSERT qilindi" . PHP_EOL;
} catch (Exception $e) {
    echo "data massivi INSERT qilinmadi: " . $e->getMessage() . PHP_EOL;
//    print_r($stmt->errorInfo()) . PHP_EOL;
    echo 'Xato: ' . $stmt->errorInfo()[2] . PHP_EOL;
}