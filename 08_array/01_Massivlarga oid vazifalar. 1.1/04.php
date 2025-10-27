<?php
// 4-masala. 1 dan N gacha bo’lgan
// sonlardan tashkil topgan massivning
// toq indeks dagi elementlari yig’indisini hisoblang.

echo "\n1 dan qanchagacha massiv kerak: ";
$n = intval(readline());

$massiv = range(1, $n);
$sum = 0;

for ($i = 1; $i < count($massiv); $i += 2) {
    echo "massiv[$i] = $massiv[$i]\n";
    $sum += $massiv[$i];
}
echo "1 dan $n gacha toq indeksdagi sonlar yig'indisi: ";
echo $sum . PHP_EOL;