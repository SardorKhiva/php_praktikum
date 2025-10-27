<?php
// 2-masala. 1 dan N gacha bo’lgan sonlardan
// tashkil topgan massivning
// elementlarini yig’indisini hisoblang.

echo "\n1 dan qanchagacha \nmassiv hosil qilasiz: ";
$n = intval(readline());

$suma = 0;
$arr = range(1, $n);
foreach ($arr as $value) {
    $suma += $value;
}
echo "\n1 dan $n gacha bo'lgan massiv \nelementlari yig'indisi: ";
echo $suma . PHP_EOL;