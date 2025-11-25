<?php
/**
 * Foydalanuvchi: User
 * Loyiha nomi: PRAKTIKUM
 * Fayl nomi: 11_bindParam_UPDATE.php
 * Fayl yaratilgan: 20.11.2025 16:30
 * Maqsad:
 */

require_once '02_conn.php';

$sql_update = "UPDATE `talaba` SET `firstname` = :firstname
WHERE `id` = :id";

$prepare = $conn->prepare($sql_update);
$prepare->bindParam(':firstname', $firstname);
$prepare->bindParam(':id', $id);

$firstname = 'Odi';
$id = 5;

try {
    $prepare->execute();
    echo "Updated";
} catch (PDOException $e) {
    echo $e->getMessage();
}
