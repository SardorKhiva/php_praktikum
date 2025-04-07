<?php
require_once "01_connect.php";

//$conn->exec("TRUNCATE TABLE test.talaba");    // talaba jadvalini tozalash

// prepare() + execute() orqali INSERT
$insert = "INSERT INTO test.talaba (firstname, lastname, email)
VALUES (?, ?, ?);";
$stmt = $conn->prepare($insert);
try {
    $stmt->execute(['Pahlavon', 'Mahmud', 'polovonpir@mail.uz']);
    echo "prepare + execute orqali INSERT qilindi";
} catch (PDOException $e) {
    echo "prepare + execute orqali INSERT qilishda xatolik: ";
    print_r($e->getMessage());
}

$stmt = $conn->prepare("INSERT INTO test.talaba (firstname, lastname, email)
VALUES(:firstname, :lastname, :email)");

$stmt->bindParam(':firstname', $firstname);
$stmt->bindParam(':lastname', $lastname);
$stmt->bindParam(':email', $email);

// yangi yozuv INSERT qilish
$firstname = 'Abdulla';
$lastname = 'Avloniy';
$email = 'avloniy@mail.uz';

$stmt->execute();

// boshqa yozuv INSERT qilish
$firstname = "No'mon";
$lastname = "Sobit";
$email = "hanafiy@mail.uz";
$stmt->execute();

$email = "hanafiyy@mail.uz";

// massiv ko'rinishida INSERT qilish
$data = [
    ':firstname' => $firstname,
    ':lastname' => $lastname,
    ':email' => $email
];
$stmt -> execute($data);

//require 'talaba_truncate.php';