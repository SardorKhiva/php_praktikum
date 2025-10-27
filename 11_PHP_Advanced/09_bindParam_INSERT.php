<?php

require '02_conn.php';

$stmt = $conn->prepare("INSERT INTO test.talaba (firstname, lastname, email)
        VALUES (:firstname, :lastname, :email);");

// o'zgaruvchilarga qiymatlarni bindParam() dan oldin bersa ham bo'ladi
$firstname = 'Bu-Ism';
$lastname = 'Bu-Familya';
$email = 'Bu-pochta';

// $stmt->bindParam(':email', 'email');     // bu xato:
// bindParam() da faqat o'zgaruvchi ishlatiladi, string emas!
$stmt->bindParam(':firstname', $firstname);
$stmt->bindParam(':lastname', $lastname);
$stmt->bindParam(':email', $email);

// o'zgaruvchilarga qiymatlarni bindParam() dan keyin bersa ham bo'ladi
$email = 'Bu-pochta2';      // 'Bu-pochta2' bajariladi, 'Bu-pochta' emas

try {
    $stmt->execute();
    echo 'bindParam orqali INSERT qilindi' . PHP_EOL;
} catch (EXCEPTION $e) {
    echo 'bindParam orqali INSERT qilishda xatolik: ' . $stmt->rowCount() . PHP_EOL;
}