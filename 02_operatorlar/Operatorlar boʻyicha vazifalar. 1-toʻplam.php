<?php

// 1-masala.
// $son nomli o`zgaruvchi hosil qiling va unga o`zingiz istagan sonni qiymat sifatida bering. O'zgaruvchini qiymatini ekranga chiqaring.
echo "1-masala: " . PHP_EOL;
$son = 571;
echo $son . PHP_EOL;
echo PHP_EOL;

//2-masala.
//$x va $y nomli o`zgaruvchilarni hosil qiling va ularga, 10, 15 qiymatlarini bering. Ekranga x=10 y=15 ko`rinishida chiqaring.
echo "2-masala: " . PHP_EOL;
$x = 10;
$y = 15;
echo 'x=' . $x . PHP_EOL;
echo 'x=' . $y . PHP_EOL;
echo PHP_EOL;

// 3-masala.
// $x, $y, nomli o`zgaruvchi hosil qiling va 10, 15 qiymatlarini bering.
// $z nomli o`zgaruvchi hosil qiling.
// Unga $x va $y larning yig`indisi qiymat qilib bering.
// Ekranga $z qiymatini ni chiqaring.
echo "3-masala: " . PHP_EOL;
$x = 10;
$y = 15;
$z = $x + $y;
echo $z . PHP_EOL;
echo PHP_EOL;

// 4-masala.
// $a va $b sonlari berilgan. Ularning yig`indisini, ayirmasini,
// ko`paytmasini va bo`linmasini ekranga chiqaring.
echo "4-masala: " . PHP_EOL;
$a = 10;
$b = 5;

echo "$a + $b" . " = " . $a + $b . PHP_EOL;
echo "$a - $b" . " = " . $a - $b . PHP_EOL;
echo "$a * $b" . " = " . $a * $b . PHP_EOL;
echo "$a / $b" . " = " . $a / $b . PHP_EOL;
echo PHP_EOL;

// 5-masala.
// $a, $b, $c o`zgaruvchilar hosil qiling. Ularga, 10,15, 20 qiymatlarni bering.
// Ularning yig`indisini, ayirmasini, ko`paytmasini aniqlang va ekranga chiqaring.
echo "5-masala: " . PHP_EOL;
$a = 10;
$b = 15;
$c = 20;
echo "$a + $b + $c" . " = " . $a + $b + $c . PHP_EOL;
echo "$a - $b - $c" . " = " . $a - $b - $c . PHP_EOL;
echo "$a * $b * $c" . " = " . $a * $b * $c . PHP_EOL;
echo PHP_EOL;

// 6-masala.
// Ikkita son berilgan. 1-sonni, 2- songa bo`lgandagi qoldiqni aniqlang.
// Natijani ekranga chiqaring.
echo "6-masala: " . PHP_EOL;
$a = 10;
$b = 15;
echo "$b % $a = " . $b % $a . PHP_EOL;
echo PHP_EOL;

// 7-masala.
// Ikkita son berilgan. 1-sonni 2-songa bo`lgandagi qoldiqqa,
// 1-sonni qo`shib natijani ekranga chiqaring.
echo "7-masala: " . PHP_EOL;
$a = 10;
$b = 15;
$natija = $b % $a + $a;
echo "$b % $a + $a = ";
echo $natija . PHP_EOL;