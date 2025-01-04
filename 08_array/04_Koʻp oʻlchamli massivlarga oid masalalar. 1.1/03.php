<?php
// 3. 2-masalada SATR elementlari
// yig`indisini aniqlagan edik.
// Endi USTUN elementlari yig`indisini toping.

echo "Massiv eni, m: ";
$m = intval(trim(readline()));

echo "Massiv bo'yi, n: ";
$n = intval(trim(readline()));

$arr = [];                        // bo'sh konteyner massiv uchun

getRandomArray($arr, $m, $n);   // random massiv hosil qilish
printArr($arr, $m, $n);            // ko'rsatish
echo PHP_EOL;                      // 1 qayot bo'sh joy tashash
sumOfRows($arr, $m, $n);           // har bir qatordagi sonlar yig'indisi

function getRandomArray(&$arr, $m, $n): void
{
    // maksimal random element qiymati = massiv eni * bo'yi
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
function printArr($arr, $m, $n): void
{
    for ($i = 0; $i < $m; $i++)
    {
        for ($j = 0; $j < $n; $j++)
        {
            echo $arr[$i][$j] . " ";
        }
        echo "\n";
    }
}

// soddaroq ko'rinishda ko'rsatish
function sumOfRows(array $arr, int $m, int $n): void
{
    $sumArr = [];
    for ($i = 0; $i < $n; $i++)
    {
        $sum = 0;   // har qatorni yig'indisi
        for ($j = 0; $j < $m; $j++)
        {
            $sum += $arr[$j][$i];     // yig'ib borish
        }
            $sumArr[] = $sum;
    }
        massivKorsat($sumArr);
        echo PHP_EOL;
}

function massivKorsat(array $massiv): void
{
    echo "Ustundagi sonlar yig'indilari: \n";
    for ($i = 0; $i < count($massiv); $i++)
    {
        echo $massiv[$i] . " ";
    }
}