<?php
/**
 * Foydalanuvchi: User
 * Loyiha nomi: PRAKTIKUM
 * Fayl nomi: 07_PHP_+_MySQL_DELETE.php
 * Fayl yaratilgan: 29.11.2025 9:51
 * Maqsad: PHP orqali MySQL DELETE FROM
 */

// bazaga ulanish
require_once 'conn.php';

// delete sql query
$sql_delete = "DELETE FROM `talaba` 
               WHERE `id` = :id";

// sql_query ni tayyorlash
$prepare = $pdo->prepare($sql_delete);

// so'z bilan bind qilish
$data = [':id' => 10];

try {
    // bajarish
    $prepare->execute($data);
    echo "talaba jadvalidagi {$data[':id']}-yozuv o'chirildi<br>";
} catch (PDOException $e) {
    echo $e->getMessage();
}

// sql delete query
$delete = "DELETE FROM `talaba` 
           WHERE `id` = :id";

// tayyorlash
$pre = $pdo->prepare($delete);

// yopishtirish
$pre->bindParam(':id', $id, PDO::PARAM_INT);

// id ga qiymat berish
$id = 20;

try {
    // bajarish
    $pre->execute();
    echo "talaba jadvalidagi $id-yozuv o'chrilidi<br>";
} catch (PDOException $e) {
    echo $e->getMessage();
}

// agar WHERE orqali so'rov yozilmasa jadval butunlay o'chadi
// sql so'rov
$delete_table = "DELETE FROM `talaba`";

// tayyorlash
$prep = $pdo->prepare($delete_table);

// bajarish
$prep->execute();

// yoki execute siz bajarish
$pdo->exec($delete_table);