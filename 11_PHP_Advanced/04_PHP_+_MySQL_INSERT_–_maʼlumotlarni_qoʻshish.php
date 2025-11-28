<?php

// bazaga ulanish
require_once 'conn.php';

// Bazaga ma'lumot qo'shish (INSERT)

// MySQLi da
$sql_insert = "INSERT INTO `talaba`(`firstname`, `lastname`)
VALUES('dfg', 'azghf')";

if ($mysqli->query($sql_insert) === TRUE) {
    echo "mysqli orqali insert qilindi";
} else {
    echo "Jadval insert qilishda xatolik: " . $mysqli->error;
}
echo PHP_EOL;

// PDO da jadval INSERT qilish
$jadval = "INSERT INTO `talaba`(`firstname`, `lastname`)
           VALUES('16 firstname', '54 lastname')";

try {
    $pdo->exec($jadval);
    echo "PDO orqali INSERT qilindi\n";
} catch (PDOException $e) {
    echo "Jadval insert qilishda xatolik: " . $e->getMessage() . "\n";
}
echo PHP_EOL;

// Multi INSERT

$sql_insert = "INSERT INTO `talaba`(`firstname`, `lastname`)
               VALUES('multi', 'query1');";
$sql_insert .= "INSERT INTO `talaba`(`firstname`, `lastname`)
               VALUES('multi', 'query2');";
$sql_insert .= "INSERT INTO `talaba`(`firstname`, `lastname`)
               VALUES('multi', 'query3');";

// MySQLi da
try {
    $mysqli->multi_query($sql_insert);
    echo "MySQLi orqali Multi Insert qilindi\n";
} catch (Throwable $e) {
    echo "Jadval insert qilishda xatolik: " . $mysqli->error . "\n";
}
echo PHP_EOL;

// PDO da
try {
    $pdo->exec($sql_insert);
    echo "PDO orqali multi insert qilindi\n";
} catch (PDOException $e) {
    echo "PDO bilan jadval insert qilishda xatolik: " . $e->getMessage() . "\n";
}
echo PHP_EOL;

// lastInsertId()  -  oxirgi INSERT ID
$sql_insert = "INSERT INTO `talaba`(`firstname`, `lastname`)
               VALUES('last', 'insertID');";

try {
    $pdo->exec($sql_insert);
    echo "Oxirda INSERT qilingan ID: ";
    $pdo->lastInsertId();
} catch (PDOException $e) {
    echo "Oxirgi INSERT ID ni olishda xatolik: " . $e->getMessage() . "\n";
}
echo PHP_EOL;

// prepare() bilan INSERT
$sql_insert = "INSERT INTO `talaba`(`firstname`, `lastname`)
               VALUES(?, ?);";

$stmt = $pdo->prepare($sql_insert);
try {
    $stmt->execute(['Maqsad', 'Farhodov']);
    echo "prepare inserted";
} catch (PDOException $e) {
    echo $e->getMessage();
}
echo PHP_EOL;

// yoki
$data = [
    ":firstname" => "Farhodov",
    ":lastname" => "Farhod"
];

$insert = "INSERT INTO `talaba`(`firstname`, `lastname`)
           VALUES(:firstname, :lastname);";
$stmt = $pdo->prepare($insert);
try {
    $stmt->execute($data);
    echo "prepared \$data inserted";
} catch (PDOException $e) {
    echo $e->getMessage();
}
echo PHP_EOL;

// bindParam() bilan INSERT qilish
$stmt = $pdo->prepare("INSERT INTO `talaba`(`firstname`, `lastname`)
                            VALUES(:firstname, :lastname);");

$stmt->bindParam(':firstname', $firstname, PDO::PARAM_STR);
$stmt->bindParam(':lastname', $lastname, PDO::PARAM_STR);

// INSERT A ROW
$firstname = 'Laziz';
$lastname = 'Adhamov';
$stmt->execute();   // oldingi 2 qatordagi qiymatlarni bajarish

// bindValue() bilan INSERT qilish
$stmt = $pdo->prepare("INSERT INTO `talaba`(`firstname`, `lastname`)
                             VALUES (:firstname, :lastname);");


$lastname = 'Alisher';
$stmt->bindValue(':lastname', $lastname, PDO::PARAM_STR);
$stmt->bindValue(':firstname', 'Jalol', PDO::PARAM_STR);
$lastname = 'Navoiy'; // bu ishlamaydi

try {
    $stmt->execute();
    echo 'bindValue completed';
} catch (PDOException $e) {
    echo $e->getMessage();
}
