<?php
// 2. M x N o'lchamda massiv berilgan.
// (rand(1,100); funksiyasi yordamida hosil qiling).
// Massivning har bir SATR elementlari
// yig`indisi topilsin va massiv elementlari
// bilan ekranga chiqarilsin.
// Misol:
// 1   4   5   6   7   - bu satrning yig`indisi: 23
// 3   34  12  12  1   - bu satrning yig`indisi: 62
// 6   41  23  3   12  ...
// 23  2   32  55  65

echo "Massiv eni, m: ";
$m = intval(trim(readline()));

echo "Massiv bo'yi, n: ";
$n = intval(trim(readline()));

$arr = [];                        // bo'sh konteyner massiv uchun

getRandomArray($arr, $m, $n);   // random massiv hosil qilish
printArr($arr);                   // ko'rsatish
echo PHP_EOL;                     // 1 qayot bo'sh joy tashash
sumOfRows($arr, $m, $n);          // har bir satrdagi sonlar yig'indisi

function getRandomArray(&$arr, $m, $n): void
{
    $max_rand = $n * $m;
    for ($i = 0; $i < $m; $i++)
    {
        for ($j = 0; $j < $n; $j++)
        {
            $arr[$i][$j] = rand(0, $max_rand);
        }
    }
}

// soddaroq ko'rinishdagi jadval
function printArr($arr): void
{
    foreach ($arr as $element)
    {
        foreach ($element as $value )
        {
            echo "$value \t";
        }
        echo "\n";
    }
}

// soddaroq ko'rinishda ko'rsatish
function sumOfCols(array $arr, int $m, int $n): void
{
    // massiv assotsiativ emasligi uchun for ishlatildi
    // for parametrli siklini o'qish qulay
    for ($i = 0; $i < $m; $i++)
    {
        $sum = 0;   // har qatorni yig'indisi
        for ($j = 0; $j < $n; $j++)
        {
            echo $arr[$i][$j];  // har elementni chiqarish
            if ($j < $n-1)      // oxirgi son oldigacha + chiqarish
            {
                echo " + ";
            }
            $sum += $arr[$i][$j];   // yig'ib borish
        }
        echo " = $sum \n";
    }
}