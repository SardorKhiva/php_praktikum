<?php

// PDO va mysqli larni yoqish
/*
  php -m : barcha yoqilgan modullarni ko'rsatadi
  Agar PDO yoqilmagan bo'lsa, uni php.ini fayli orqali yoqish kerak.
  ;extension=php_pdo_mysql.dll      ni
  extension=php_pdo_mysql.dll       ga o'zgartiring
  yoki extension  = pdo_mysql

  mysqli ni yoqish:
  extension = mysqli

   postgresql uchun:
   extension = pdo_pgsql
 */

//        mysqli bialn ulanish qolipi:
$servername = 'localhost';    // server nomi
$username = 'root';        // foydalanuvchi nomi, odatda root
$password = '1302';         // baza paroli
$dbname = 'test';      // baza nomi

// bazaga ulanish
$conn = new mysqli($servername, $username, $password, $dbname);

// bazaga ulanganligini tekshirish
if ($conn->connect_error) {
    die('Bazaga ulanolmadi: ' . $conn->connect_error);
} else {
    echo "mysqli orqali bazaga ulandi.";
}
echo PHP_EOL;

// Pastda jadval hosil qilmaydi, agar close qilinsa:
//$conn->close();     // ulanishni yopish
echo 'mysqli orqali bazaga ulanish yakunlandi.';
echo PHP_EOL;

//            PDO bilan ulanish
$server_name = 'localhost';
$user_name = 'root';
$pass = '1302';
$db_name = 'test';

try {
    $connect = new PDO("mysql:host=$server_name; dbname = $db_name", $user_name, $pass);
    echo "PDO orqali bazaga ulandi";
} catch (PDOException $e) {
    echo "PDO bazaga ulana olmadi: " . $e->getMessage();
}
echo PHP_EOL;

//            Jadval hosil qilish
/*
 * PHP kod orqali MySQL da jadval hosil qilamiz.
 * Buning uchun jadval hosil qilish so'rovini php
 * da biror o'zgaruvchiga qiymat qilib beramiz:
 */

$sql = "CREATE TABLE IF NOT EXISTS talabalar(
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    email VARCHAR(30), 
    registrated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)";

if ($conn->query($sql) === TRUE) {
    echo "Table talabalar created successfully";
} else {
    echo "Error creating table: " . $conn->error;
}
$conn->close();