<?php

$integer_1 = 10;

$float_1 = 3.14;
$double_1 = 3.1415;

$bool_1 = true;

$null_1 = null;

$string_1 = "matn 1";
$string_2 = 'matn 2';

//var_dump - o'zgaruvchi turi va qiymatini ko'rsatadi: tur(qiymat)
var_dump($integer_1);
var_dump($float_1);
var_dump($double_1);
var_dump($bool_1);
var_dump($null_1);
var_dump($string_1);
var_dump($string_2);
echo PHP_EOL;

// gettype - o'zgaruvchi turini satr qilib oladi, misol: string(6) "string"
$number = 5;
$type = gettype($number);
var_dump($type);
$type2 = gettype(gettype($number + 0.0));
var_dump($type2);

/*
| Sardor   | $1000  |
---------------------
| Eshmat   | $1200  |
---------------------
| Toshmat  | $1500  |
*/

$ism_1 = 'Sardor';
$oylik_1 = 1000;

$ism_2 = 'Eshmat';
$oylik_2 = 1200;

$ism_3 = 'Toshmat';
$oylik_3 = 1500;
