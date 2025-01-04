<?php
// 8-masala. N ta elementdan tashkil
// topgan massiv berilgan.
// Massiv elementlari orasida
// aniq 2 ta bir xil qiymatli element bor.
// Birinchi topilgan bir xil qiymatli
// elementlar indeksini chiqaring.
$n = null;

do {
    echo "Nechta element kerak, n: ";
    $n = intval(readline());
} while (!($n > 2));

$arr = getTwoDuplicates($n);
print_r($arr);

$last_dup_index = $first_dup_index = 0;

for ($i = 0; $i < $n; $i++) {
    $temp = $i;
    for ($j = $i + 1; $j < $n; $j++) {
        if ($arr[$j] == $arr[$i]) {
            $first_dup_index = $temp;
            $last_dup_index = $j;

        }

    }
}

echo "Birinchi uchragan bir xil element indeksi: ";
echo $first_dup_index . PHP_EOL;

echo "Oxirgi uchragan bir xil element indeksi: ";
echo $last_dup_index . PHP_EOL;

// n gacha bo'lgan 2 ta bir xil elementli massiv qaytaradi
function getTwoDuplicates(int $n): array
{
    $arr = range(1, $n - 1);
    $arr[] = $arr[array_rand($arr)];

    // sonlarni tekshirish uchun comment qilindi:
    shuffle($arr);            // massivni aralashtiramiz
    return $arr;
}