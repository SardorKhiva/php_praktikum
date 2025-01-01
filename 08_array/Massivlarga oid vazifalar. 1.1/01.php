<?php
// 1-masala. 1 dan N ga bo’lgan sonlardan tashkil
// topgan massiv hosil qiling

echo "1 dan nechagacha bo'lgan \nmassiv hosil qilasiz: ";
$n = intval(fgets(STDIN));

$massiv = range(1, $n);
echo "\n1 dan $n gacha bo'lgan massiv: \n";
foreach ($massiv as $value) {
    echo $value . " ";
}