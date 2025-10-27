<?php
// 6-masala. N ta elementdan tashkil topgan massiv berilgan.
// Dastlab massiv elementlari orasidan,
// juft indekslilarini ekranga chiqaring,
// keyin toq indekslilarini ekranga chiqaring.
// Shart operatorini ishlatmasdan.

echo "Qancha element kerak: ";
$n = intval(readline());

//$massiv_toq = range(1, $n, 2);      // toq elementli massiv
//$massiv_juft = range(2, $n, 2);     // juft elementli massiv

$arr = range(1, $n);
shuffle($arr);

echo "Juft indekslilar: \n";
for ($i = 0; $i < count($arr); $i += 2) {
    echo "arr[$i] = $arr[$i] " . PHP_EOL;
}

echo "\nToq indekslilar: \n";
for ($i = 1; $i < count($arr); $i += 2) {
    echo "arr[$i] = $arr[$i] " . PHP_EOL;
}