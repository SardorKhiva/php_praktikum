<?php

// qizarib turmasligi uchun
global $conn;

// bazaga ulanish uchun ulovchi php faylni qo'shamiz
require_once '01_connect.php';

// ma'lumotlar massivini hosil qilamiz:
$data = [
    ':firstname' => 'sfd',
    ':lastname' => 'savg',
    ':email' => 'SAsdfv'
];

// sql so'rovni string o'zgaruvchi qilib olamiz:
$insert = "INSERT INTO test.talaba(firstname, lastname, email)
VALUES (:firstname, :lastname, :email);";

// sql so'rovni tayyorlaymiz:
$stmt = $conn->prepare($insert);

// so'rovni ishga tushuramiz
try {
    // Ma'lumotlarni tayyorlangan so‘rovga joylab, bajarish
    $stmt->execute($data);
    echo 'massiv insert qilindi';
} catch (PDOException $e) {
    // Agar xatolik yuz bersa, xatolik haqidagi xabarni chiqaramiz
    echo 'massiv insert qilinmadi' . $e->getMessage();
}
echo PHP_EOL . PHP_EOL;

////////////////////////////////////////

$massiv = [
    ':firstname' => 'Sardor',
    ':lastname' => 'asgdbg',
    ":email" => 'asgvb'
];

$insert = "INSERT INTO test.talaba (firstname, lastname, email)
VALUES (:firstname, :lastname, :email);";

$stmt = $conn->prepare($insert);

try {
    $stmt->execute($massiv);
    echo '2-massiv insert qilindi';
} catch (PDOException $e) {
    echo 'm2-massiv insert qilinmadi' . $e->getMessage();
}
echo PHP_EOL . PHP_EOL;
//////////////////////////////////////////////////////////////////////////


$massiv2 = [
    ':firstname' => 'Sardor',
    ':lastname' => 'asgdbg',
    ":email" => 'asgvbas'
];

$insert = "INSERT INTO test.talaba (firstname, lastname, email)
VALUES (:firstname, :lastname, :email);";

$stmt2 = $conn->prepare($insert);

try {
    $stmt2->execute($massiv2);
    echo '3-massiv insert qilindi';
} catch (Exception $e) {
    echo '3-massiv insert qilinmadi' . $e->getMessage();
}