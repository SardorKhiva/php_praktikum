<?php
/**
 * Foydalanuvchi: User
 * Loyiha nomi: PRAKTIKUM
 * Fayl nomi: 06_PHP_+_MySQL_UPDATE.php
 * Fayl yaratilgan: 28.11.2025 22:32
 * Maqsad: MySQL da PHP orqali UPDATE qilish
 */

// bazaga ulanish
require_once 'conn.php';

// UPDATE qilivchi MySQL so'rov matnini php string o'zgaruvchiga olinadi
$sql_update = "UPDATE `talaba` 
               SET `firstname` = :ism 
               WHERE `id` = :id";

// prepare qilib qayta ishlaniladi
$prepare = $pdo->prepare($sql_update);

// tashqaridan kelgan o'zgaruvchilar bildParam yoki bindValue qilib bir marta "yopishtiriladi"
$prepare->bindParam(':ism', $firstname, PDO::PARAM_STR);
$prepare->bindParam(':id', $id, PDO::PARAM_INT);

// endi bazadagi jadval ustuniga mavjud bo'lgan o'zgaruvchilarni qiymatlari kiritiladi
$firstname = 'Muhammad';  // $firstname ustunidagi yozuv qanday qiymatga yangilanyapti
$id = '1';                // va bu qaysi qatorga tegishli?

// endi bajaramiz
try {
    $prepare->execute();
    echo "UPDATE qilindi! <br>";
} catch (PDOException $e) {
    echo 'update qilishda xatolik: ' . $e->getMessage();
}