<?php
/**
 * Foydalanuvchi: User
 * Loyiha nomi: PRAKTIKUM
 * Fayl nomi: 12_bindParam_DELETE.php
 * Fayl yaratilgan: 20.11.2025 16:45
 * Maqsad:
 */

require_once '02_conn.php';


$sql = "DELETE FROM `talaba` WHERE `id` = :id";
$prepare = $conn->prepare($sql);
$prepare->bindParam(':id', $id);
static $id = 10;

try {
    $prepare->execute();
    echo "{$id} -id li element o'chirildi";
} catch (PDOException $e) {
    echo $e->getMessage();
}


/*
CRUD - Create, Read, Update, Delete
       Insert, Select, Update, Delete
*/