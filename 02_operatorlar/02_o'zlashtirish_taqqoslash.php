<?php
// =
// o'zlashtirish:
echo ' = ' . PHP_EOL;
$a = 10;
$b = $a;
echo '$a = ' . $a . PHP_EOL;
echo '$b = ' . $b . PHP_EOL;
$b = 25;
echo PHP_EOL;

// &
// adresdagini nusxalash:
echo ' & ' . PHP_EOL;
$c = &$b;
echo '$c = ' . $b . PHP_EOL . PHP_EOL;

// ==
// turlarni keltirib tenglikka taqqoslash,
// turlar har xil bo'lishi mumkin:
echo ' == ' . PHP_EOL;
$d = 15;
$e = 16;
$f = '15';
$g = "15";
$h = 15;
var_dump($d == $e);
var_dump($d == $f);
var_dump($d == $g);
var_dump($d == $h);
echo PHP_EOL;

// ===
// tur-tipi ham qiymati ham bir xillikka tekshirish:
echo ' === ' . PHP_EOL;
var_dump($d === $e);
var_dump($d === $f);
var_dump($d === $g);
var_dump($d === $h);
echo PHP_EOL;

// >
// a > b
// a katta b likka tekshirish:
echo ' > ' . PHP_EOL;
$a = 5;
$b = 5;
$c = 6;
$d = 4;
var_dump($a > $b);
var_dump($a > $c);
var_dump($a > $d);
echo PHP_EOL;

// <
// a < b
// a kichik b likka tekshirish:
echo ' < ' . PHP_EOL;
var_dump($a < $b);
var_dump($a < $c);
var_dump($a < $d);
echo PHP_EOL;

// <=
// kichik yoki teng:
echo ' <= ' . PHP_EOL;
$a = 1;
$b = 2;
$c = 0;
var_dump($a <= $b);
var_dump($a <= $c);
var_dump($a <= $d);
echo PHP_EOL;

// >=
// katta yoki teng:
echo ' >= ' . PHP_EOL;
$a = 1;
$b = 2;
$c = 0;
var_dump($a >= $b);
var_dump($a >= $c);
var_dump($a >= $d);
echo PHP_EOL;

// !=
// turlarga keltirib teng emaslikka tekshiradi:
echo ' != ' . PHP_EOL;
$a = 7;
$b = 8;
$c = '7';
$d = "7";
$e = '9';
$f = "9";
$g = 7;
var_dump($a != $b);
var_dump($a != $c);
var_dump($a != $d);
var_dump($a != $e);
var_dump($a != $f);
var_dump($a != $g);
echo PHP_EOL;

// !==
// turlar va qiymatlar bir xil emasligini tekshiradi:
echo ' !== ' . PHP_EOL;
$a = 7;
$b = 8;
$c = '7';
$d = "7";
$e = '9';
$f = "9";
$g = 7;

var_dump($a !== $b);
var_dump($a !== $c);
var_dump($a !== $d);
var_dump($a !== $e);
var_dump($a !== $f);
var_dump($a !== $g);
echo PHP_EOL;

// <=>
// Spaceship Operator
// (оператор "космического корабля")
// -1, agar 1-son kichik bo'lsa:
echo '<=>' . PHP_EOL;
echo (1 <=> 2) . PHP_EOL;

// 0, agar sonlar teng bo'lsa:
echo (1 <=> 1) . PHP_EOL;

// 1, agar 1-son 2-sondan katta bo'lsa:
echo (1 <=> 0) . PHP_EOL;
echo PHP_EOL;

$a = $b = $c = $d = $e = $f = NULL;
echo 'matn: ' . PHP_EOL;
echo "abc" <=> "def" . PHP_EOL; // -1 ("abc" меньше "def" в лексикографическом порядке)
echo PHP_EOL;
echo "0 => abc" <=> "abc" . PHP_EOL; // 0  (строки равны)
echo PHP_EOL;
echo "def" <=> "abc" . PHP_EOL; // 1  ("def" больше "abc")
echo PHP_EOL;
echo PHP_EOL;

echo 'massiv <=> massiv' . PHP_EOL;
// bu yerda echo massivni satrga bevosita o'tkaza olmaydi:
echo [1, 2, 3] <=> [1, 2, 4] . PHP_EOL; // -1 (различие на третьем элементе)
echo [1, 2, 3] <=> [1, 2, 3] . PHP_EOL; // 0  (оба массива равны)
echo [1, 2, 4] <=> [1, 2, 3] . PHP_EOL; // 1  (различие на третьем элементе)
echo PHP_EOL;
echo PHP_EOL;


// shuning uchun qavsga olaman:
echo([1, 2, 3] <=> [1, 2, 4]) . PHP_EOL;
echo([1, 2, 3] <=> [1, 2, 3]) . PHP_EOL;
echo([1, 2, 4] <=> [1, 2, 3]) . PHP_EOL;
echo PHP_EOL;
