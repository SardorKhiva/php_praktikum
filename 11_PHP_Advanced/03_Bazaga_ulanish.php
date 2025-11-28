<?php
// MySQLi bilan ulanish, eski usul
$servername = 'localhost';  // 127.0.0.1
$username = 'root';
$password = '1302';
$dbname = 'test';

// bazaga ulanish
$mysqli_conn = new mysqli($servername, $username, $password, $dbname);

// bazaga ulanganini tekshirish
if ($mysqli_conn->connect_error) {
    die("Connection failed: " . $mysqli_conn->connect_error);
}
echo "Connected successfully<br>\n";

/* Barcha so'rovlar bajarilganidan keyin
   PHP avtomat tarzda ulanishni yopadi.
   Agar o'zimiz ulanishni yopishni xohlasak
   quyidagi ko'rinishda yopamiz
 */
//$conn->close();

// PDO bilan ulanish
$host = "localhost";
$user = 'root';
$password = '1302';
$dbname = 'test';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    echo "PDO bilan ulandi!\n";
} catch (PDOException $e) {
    echo "PDO bilan ulanmadi: " . $e->getMessage();
}

// Jadval tuzilishi
$sql = "CREATE TABLE IF NOT EXISTS `talaba` (
        `id` INT PRIMARY KEY AUTO_INCREMENT,
        `firstname` VARCHAR(30) NOT NULL,
        `lastname` VARCHAR(30) NOT NULL,
        `email` VARCHAR(50) NOT NULL,
        `registered_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )";

// MySQLi da jadval hosil qilish
if ($mysqli_conn->query($sql) === TRUE) {
    echo "Table talaba created!\n";
} else {
    echo "Jadval hosil qilishda xatolik: " . $mysqli_conn->error;
}
// query() - SQL so'rovlarni bajarishga buyruq beradi
//$mysqli_conn->close(); // mysqli ulanishni yopish

// PDO da jadval hosil qilish
try {
    $conn->exec($sql);
    echo "Table talaba created!\n";
} catch (PDOException $e) {
    echo "Jadval hosil qilishda xatolik: " . $e->getMessage();
}
// exec() - PDO da SQL so'rovni bajaruvchi funksiya