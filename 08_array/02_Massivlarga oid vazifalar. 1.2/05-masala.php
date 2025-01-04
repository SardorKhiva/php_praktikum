<?php
// 5-masala. N ta elementdan tashkil topgan massiv
// va K butun son berilgan.
// (1<=K<=N, ya’ni K - 1 va N orasida yotuvchi butun son).
// Massiv elementlari orasidan, indeksi K ga
// karralilarini ekranga chiqaring.
// Shart operatorlari ishlatilmasin.

echo "Nechta element kerak: ";
$n = intval(readline());

do {
    echo "k butun sonini kiriting: ";
    $k = intval(readline());
} while (!($k >= 1 && $k <= $n));

$massiv = range(1, $n); // 1 dan n gacha sonlari bor massiv
shuffle($massiv);      // lementlarni aralashtirish

print_r($massiv);

echo "$k ga karrali indeksli elementlar: \n";
for ($i = $k; $i < count($massiv); $i += $k) {
    echo "massiv[$i] = " . $massiv[$i] . PHP_EOL;
}