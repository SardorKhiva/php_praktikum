<?php
// Bazaga ma'lumot qo'shish (INSERT)
//                MySQLi da
// mysqli orqali mysql ga php dan ulanib olamiz
$conn = new mysqli('localhost', 'root', '1302', 'test');

// mysql ga php orqali so'rovni o'zgaruvchiga saqlab qo'yamiz
$sql_insert = "INSERT INTO test.talaba
(firstname, lastname, email)
VALUES ('Maxmud', 'Max', 'max@gmail.com');";

// PHP da MySQLi orqali mysql ga so'rov xatosiz yuborilgan bo'lsa :
if ($conn->query($sql_insert) === TRUE) {
    echo "New record created successfully";     // shu yozuv chiqsin
} else {     // aks holda,
    echo "Error: " . $sql_insert . "<br>" . $conn->error;   // sql so'rov va xato ko'rsatilsin
};
$conn->close();
echo PHP_EOL;

//                    PDO da
//  PDO orqali mysql ga ulanish
$conn_pdo = new PDO ("mysql:host=localhost; dbname=test", 'root', '1302');

// so'rov
$sql_insert2 = "INSERT INTO test.talaba
(firstname, lastname, email) 
VALUES ('Shoxzod', 'Ergashov', 'shoxzod@gmail.com');";

// PDO da
try {
    $conn_pdo->exec($sql_insert2);
    echo "Talaba jadvaliga yangi yozuv qo'shildi";
} catch (PDOException $e) {
    echo "Xatolik: " . $e->getMessage();
}
echo PHP_EOL;
echo "PDO orqali test.talaba ga ma'lumot qo'shildi" . PHP_EOL;
echo PHP_EOL;
