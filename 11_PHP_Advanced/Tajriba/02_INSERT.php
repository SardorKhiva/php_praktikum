<?php
/**
 * Foydalanuvchi: User
 * Loyiha nomi: PRAKTIKUM
 * Fayl nomi: 02_INSERT.php
 * Fayl yaratilgan: 14.11.2025 22:43
 * Maqsad: mysqli va pdo orqali mysql ga insert qilish
 * @var object $pdo
 */

require_once '01_ulanish.php';

$query = "INSERT INTO `talaba`(`name`)
           VALUES('mysqli')";
/* // mysqli orqali insert
if($mysqli->query($query) === TRUE) {
    echo "Talaba jadvaliga ynagi yozuv yozildi!\n";
} else {
    $mysqli->error;
}
*/

// exec() orqali INSERT qilish
try {
    $pdo->exec($query);
    echo "PDO INSERT";
} catch (Throwable $e) {
    print $e->getMessage() . PHP_EOL;
}

