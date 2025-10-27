<?php
// assotsiativ massiv - index (key)larini stringlar orqali nomlashdan tashkil topgan massiv

// indexli massiv:
$index_array = [
    "Yanvar",
    "Fevral",
    "Mart",
    "Aprel",
    "May",
    "Iyun",
    "Iyul",
    "Avgust",
    "Sentyabr",
    "Oktyabr",
    "Noyabr",
    "Dekabr"
];
//var_dump($index_array);
print_r($index_array);
echo PHP_EOL;

// assotsiativ massiv:
$assoc_arr = [
    "Yanvar" => 31,
    "Fevral" => 28,
    "Mart" => 31,
    "Aprel" => 30,
    "May" => 31,
    "Iyun" => 30,
    "Iyul" => 31,
    "Avgust" => 31,
    "Sentyabr" => 30,
    "Oktyabr" => 31,
    "Noyabr" => 30,
    "Dekabr" => 31
];
//var_dump($assoc_arr);
print_r($assoc_arr);
echo PHP_EOL;

// yangi element qo'shish
$assoc_arr['yil'] = 2024;
print_r($assoc_arr);
echo PHP_EOL;

// indexsiz qo'shish
$assoc_arr[] = "Yosh";
print_r($assoc_arr);
echo PHP_EOL;

// o'zgaruvchini kalit index qilib berish
$yil = "yil2";      // yil2 index
$assoc_arr[$yil] = 2025;
print_r($assoc_arr);

// aralash tipli indexli massiv
$aralash = [
    0 => 'zero',
    false => 'nol',
    1 => 'a',       // standart 1-index berish
    true => 'b',    // true 1 false 0
    1.5 => 'c',     // butun qismi 1 qoladi
    '1' => 'e',     // int tipiga o'tkaziladi
];
print_r($aralash);