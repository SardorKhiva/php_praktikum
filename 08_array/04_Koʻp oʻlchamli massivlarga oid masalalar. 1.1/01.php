<?php
// 1. M x N o`lchamda, random sonlar yordamida
// massiv hosil qiling va ekranga
// jadval ko'rinishida chiqaring.
// rand($min, $max)-random sonlarni hosil
// qilish uchun ushbu funksiyadan foydalaning.
// https://www.php.net/manual/en/function.rand.php

echo "Massiv satrlari soni, eni, m: ";
$m = intval(trim(readline()));

echo "Massiv ustunlari soni, bo'yi, n: ";
$n = intval(trim(readline()));

$arr = [];
for ($i = 0; $i < $m; $i++)
{
    for ($j = 0; $j < $n; $j++)
    {
        $arr[$i][$j] = rand(1, $n * $m);
    }
}
// massiv initsializatsiya jadvali
printArr($arr);
echo PHP_EOL . PHP_EOL;

jadval($arr);   // karra jadvaliga o'xshash jadval

function printArr($arr): void
{
    foreach ($arr as $i => $element)
    {
        echo "$i => [\n";
        foreach ($element as $key => $value )
        {
            echo "\t$key => " . $value . ",\n";
        }
        echo "],\n";
    }
}

function jadval($arr): void
{
    foreach ($arr as $i => $element)
    {
        foreach ($element as $key => $value )
        {
            echo "\t$key => " . $value . ",\n";
        }
        echo "\n";
    }
}