<?php

// satr uzunligi:
$satr = "Assalomu Alaykum";
echo strlen($satr) . PHP_EOL;    // ASCII uchun
echo mb_strlen($satr) . PHP_EOL;    // utf-8 uchun

// satrdagi so'zlar soni:
echo str_word_count($satr) . PHP_EOL;   // ASCII uchun

// satrni teskari qilish, revers string, strrev:
echo strrev($satr) . PHP_EOL;
echo strrev($satr) . PHP_EOL;

// satrdan ma'lum bir satr(so'z) qidirish, indexini topadi, topilmasa false:
var_dump(strpos($satr, "Alaykum")) . PHP_EOL;
var_dump(strpos($satr, "d")) . PHP_EOL;

// satrdagi ma'lum bir so'zni o'zgartirish:
// Alaykum ni topib alaykum ga o'zgartiradi $satr dan:
echo str_replace('Alaykum', 'alaykum', $satr) . PHP_EOL;

// probellarsiz chiqarish:
$probelsiz_satr = mb_ereg_replace(' ', '', $satr) . PHP_EOL;
echo $probelsiz_satr . PHP_EOL;

// satrdagi so'zlar miqdori:
$text = 'Lorem Ipsum - is simply dummy!';
echo "\$text dagi so'zlar miqdori: " . str_word_count($text) . PHP_EOL; // 6

// utf-8 da xato ishlaydi:
$text = 'Съешь ещё - этих мягких французских булок, да выпей же чаю.';
echo '$text dagi so\'zlar miqdori: ' . str_word_count($text) . PHP_EOL; // 1

//utf-8 uchun:
$text = 'Съешь ещё - этих мягких французских булок, да выпей же чаю.';
$str = preg_replace("/[[:punct:]]/", '', $text);
echo "$str" . PHP_EOL;
$str = mb_ereg_replace('[\s]+', ' ', $str);
echo "$str" . PHP_EOL;
$words = explode(' ', $str);
echo count($words) . PHP_EOL; // 10


// so'zdagi yangiqatorlar sonini ko'rsatish:
echo substr_count()