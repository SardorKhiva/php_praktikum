<?php
require '02_conn.php';

$firstname = 'Sardor';
$lastname = 'Uzbek';
$sth = $conn->prepare("SELECT * FROM test.talaba
    WHERE firstname = :firstname"); // ismi $firstname = 'Sardor' bo'lganlarni chiqarsin

// SardorY ismli talaba jadvaldan qidirilsa, yo'q
$firstname = 'SardorY';     // bindParam() da bu qator amal qiladi, bindValue() da yo'q!
try {
    $sth->bindParam(':firstname', $firstname);
    $sth->execute();
    echo '<pre>';
    print_r($sth->fetchAll(PDO::FETCH_ASSOC));
} catch (Exception $e) {
    echo $firstname . ' ismli talaba yo\'q' . PHP_EOL;
    echo $e->getMessage();
}