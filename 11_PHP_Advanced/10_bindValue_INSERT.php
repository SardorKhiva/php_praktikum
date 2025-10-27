<?php
require '02_conn.php';

$stmt = $conn->prepare("INSERT INTO test.talaba (firstname, lastname, email)
        VALUES (:firstname, :lastname, :email);");

$firstname = 'bu-ism';
$lastname = 'bu-familya';

$stmt->bindValue(':firstname', $firstname);
$stmt->bindValue(':lastname', $lastname);
$stmt->bindValue(':email', 'bu-email'); // bindValue() da string bersa ham bo'ladi
$stmt->bindValue(':email', '$email');
$firstname = 'bu-ismm';     // bu qator ta'sir qilmaydi, bindParam() da ta'sir qiladi
execut($stmt);


function execut(&$stmt)
{
    try {
        $stmt->execute();
        echo 'bindValue orqali INSERT qilindi' . PHP_EOL;
    } catch (Exception $e) {
//    echo $e->getMessage();
        print_r($e);
    }
}