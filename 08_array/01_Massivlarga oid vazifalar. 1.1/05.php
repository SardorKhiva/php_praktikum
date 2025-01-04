<?php
// 5-masala. 1 dan N gacha bo’lgan
// sonlardan tashkil topgan massivning
// 3 ga karrali bo’lgan indeksdagi
// elementlarini yig’indisini hisoblang.

echo "\n1 dan qanchagacha sonlar kerak: ";
$n = intval(readline());

$arr = range(1, $n);
$sum = 0;

for ($i = 3; $i < $n; $i += 3) {
    echo "arr[$i] => $arr[$i]\n";
    $sum += $arr[$i];
}

echo "1 dan $n gacha bo'lgan 3 ga karrali 
indeksdagi elementlarning yig'indisi: $sum";