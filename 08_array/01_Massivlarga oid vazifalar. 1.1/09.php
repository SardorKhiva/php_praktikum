<?php
// 9-masala. N ta sondan tashkil topgan massivning
// 2- va 5 - indeksdagi elementlarini almashtiring
// va hosil bo’lgan massivni ekranga chiqaring.

echo "Nechta elementli massiv kerak: ";
$n = intval(readline());

$arr = [];

echo "Boshlang'ich massiv: \n";
for ($i = 0; $i < $n; $i++) {
    $arr[$i] = mt_rand(1, $n);
    if ($i == 2 || $i == 5) {
        echo "\t";
    }
    echo "arr[$i] = $arr[$i]\n";
}
echo PHP_EOL;


$temp = $arr[2];
$arr[2] = $arr[5];
$arr[5] = $temp;

echo "2- va 5-indekslar almashgan massiv:\n";
for ($i = 0; $i < $n; $i++) {
    if ($i == 2 || $i == 5) {
        echo "\t";
    }
    echo "arr[$i] = $arr[$i]\n";
}