<?php
// 4. M x N o'lchamda massiv berilgan.
// (rand(1,100); funksiyasi yordamida hosil qiling).
// Elementlari yig`indisi eng katta bo`lgan satrning,
// eng kichik elementini toping.

echo "\nMassiv eni, m: ";
$m = intval(trim(readline()));

echo "Massiv bo'yi, n: ";
$n = intval(trim(readline()));
echo PHP_EOL;

$array = [];
randArr($array, $m, $n);
echo PHP_EOL;

echo "Dastlabki massiv:\n";
foreach ($array as $row) {  // har bir satrni ko'rish
    echo implode("\t", $row) . "\n";
}

// Шаг 2: Найдите сумму элементов каждой строки
// har bir qatordagi elementlar summasi massivi
$maxSum = PHP_INT_MIN; // maksimal summani saqlovchi o'zgaruvchiga minimal int ni beramiz
$maxRow = [];          // maksimal summa bor elementli qator massivi
$i = 0;
foreach ($array as $row) {
    $sum = array_sum($row); // $sum - har bir alohida qator elementlari summasi
// agar $sum joriy holatdagi maksimal elementdan katta bo'lsa
    if ($sum > $maxSum) {
        $maxSum = $sum;     // maksimal summani yangilash
        $maxRow = $row;     // maksimal summa bor qatorni saqlab qolish
        ++$i;
    }
}

// elementlari yig'indisi eng katta bo'lgan qator massividagi eng kichik element
$minElement = min($maxRow);

echo "\nElementlar summasi eng katta qator = $i\n";
echo "Shu qatordagi minimal element: $minElement\n";
echo "Shu qator elementlari summasi: $maxSum\n";


function randArr(array &$arr, $m, $n): void
{
    for ($i = 0; $i < $m; $i++)
    {
        for ($j = 0; $j < $n; $j++)
        {
            $arr[$i][$j] = rand(1, 100);
        }
    }
}