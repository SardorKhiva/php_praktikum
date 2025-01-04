<?php
// 3-masala. 1 dan N gacha bo’lgan sonlardan
// tashkil topgan massivning
// elementlarini ko’paytmasini hisoblang.

echo "\n1 dan qanchagacha \nmassiv hosil qilasiz: ";
$n = intval(readline());

$k = 1;

$arr = range(1, $n);
foreach ($arr as $value) {
    $k *= $value;
}
echo "\n1 dan $n gacha bo'lgan massiv \nelementlari ko'paytmasi: ";
echo $k . PHP_EOL;