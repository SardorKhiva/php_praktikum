<?php
require_once "01_connect.php";

//talaba jadvalini tozalash
$conn->exec("TRUNCATE TABLE test.talaba");    // talaba jadvalini tozalash
echo "Talaba jadvali tozalandi!\n\n";
/*
$talaba_truncate = "TRUNCATE TABLE test.talaba";

if ($mysqli_conn->query($talaba_truncate) === TRUE) {
    echo "Talaba jadvali ma'lumotlari o'chirildi\n";
} else {
    echo "Talaba jadvali ma'lumotlari o'chirilmadi\n";
}
*/

$sql_insert = "INSERT INTO test.talaba (firstname, lastname, email)
VALUES('Sardor', 'Ruslanov', 'uzb@mail.uz')";

// mysqli orqali insert
// $conn->query($sql_insert);   // shunchaki mysqli orqali INSERT qilish

if ($mysqli_conn->query($sql_insert) === TRUE) {
    echo 'Talaba jadvaliga mysqli orqali INSERT qilindi' . PHP_EOL;
} else {
    echo 'Talaba jadvaliga mysqli orqali INSERT qilishda xatolik: ' . $mysqli_conn->error . PHP_EOL;
}

// PDO orqali INSERT
try {
    $conn->exec($sql_insert);
    echo "Talaba jadvaliga PDO orqali INSERT qilindi\n";
} catch (PDOException $e) {
    echo "Talaba jadvaliga PDO orqali INSERT qilishda xatolik sodir bo'ldi: " . $e->getMessage();
}

$multi = "INSERT INTO test.talaba(firstname, lastname, email)
VALUES ( 'Alisher', 'Navoiy', 'navoiy@mail.uz' );";
$multi .= "INSERT INTO test.talaba(firstname, lastname, email)
VALUES ( 'Bahouddin', 'Naqshbandiy', 'shohinaqshband@mail.uz');";

// mysqli da multi INSERT
if ($mysqli_conn->multi_query($multi) === TRUE) {
    echo "mysqli orqali multi_query INSERT qilindi\n";
} else {
    echo "mysqli orqali multi_query INSERT qilishda xatolik bo'ldi: " . $mysqli_conn->error . PHP_EOL;
}

// PDO multi query
try {
    $conn->exec($multi);
    echo "So'nggi kiritilgan qator yoki ketma-ketlik ID si: " . $conn->lastInsertId() . PHP_EOL;
    echo "PDO orqali multi query INSERT qilindi" . PHP_EOL;
} catch (PDOException $e) {
    echo "PDO orqali multi query INSERT qilishda xatolik: " . $e->getMessage() . PHP_EOL;
}

