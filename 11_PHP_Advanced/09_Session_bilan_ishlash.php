<?php
/**
 * Foydalanuvchi: User
 * Loyiha nomi: PRAKTIKUM
 * Fayl nomi: 09_Session_bilan_ishlash.php
 * Fayl yaratilgan: 29.11.2025 17:33
 * Maqsad: Session  -  sessiyalar bilan ishlash
 */

/*
 * Sessiya (seans) - 1 nechta sahifalarda ishlatiladigan ma'lumot saqlash usuli.
 * Sessiya - user web ilova bilan aloqada bo'lgan vaqti.
 */

session_start();  // senasni boshlash, skript boshida yoziladi
// server har bir yangi seans uchun o'ziga alohida hash code yaratadi.

echo session_id();  // sessiya id sini olish

// Session hosil qilish
// hamma sessiyalar $_SESSION super globalida
$user_id = $_SESSION['logged_in_user_id'] = '1';
$user_name = $_SESSION['logged_in_user_name'] = 'Sardor';

echo $user_id . PHP_EOL;
echo $user_name . PHP_EOL;

// Session variable delete
unset($_SESSION['logged_in_user_id']);    // user id saqlovchi o'zgaruvchini o'chirish
unset($_SESSION['logged_in_user_name']);  // user name saqlovchi o'zgaruvchini o'chirish
//echo $_SESSION['logged_in_user_id'] . PHP_EOL;  //  xato, bunday kalit aniqlangmagan
//echo $_SESSION['logged_in_user_name'] . PHP_EOL; // bu ham xato

// Session ni o'chirish
session_destroy();  // sessiyadagi barcha var larni o'chiradi

/**
 * COOKIE - USER
 * SESSION - SERVER
 */