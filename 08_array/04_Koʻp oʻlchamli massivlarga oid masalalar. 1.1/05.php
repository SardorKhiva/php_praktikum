<?php
// 5. M x N o'lchamda massiv berilgan.
// (rand(1,100); funksiyasi yordamida hosil qiling).
// Har bir USTUN da, shu USTUN o`rta arifmetigidan
// katta bo`lgan elementlari sonini toping.

/*
// O`rta arifmetik deb, N ta sonning yig`indisini
// N ga bo`lishdan hosil bo`ladigan
// natijaga aytiladi.
*/

// massiv satrlarini kiritish, vertical
do {
    echo "Massiv satrlari soni, m: ";
    $m = intval(trim(readline()));
} while ( !($m > 2) );

// massiv ustunlarini kiritish, horizontal
do{
    echo "Massiv ustunlari soni, n: ";
    $n = intval(trim(readline()));
} while ( !($n > 2));

$massiv = [];

getRandomArray($massiv, $m, $n);

echo "\n\tOriginal massiv: \n";
matrix_korsat($massiv, $m, $n);

$ustunOrtaArifmetiklari = [];
echo "\tBurilgan massiv: \n";
for ($i = 0; $i < $n; $i++)
{
    $sum = 0;
    for ($j = 0; $j < $m; $j++)
    {
        echo "  " . $massiv[$j][$i];
        $sum += intval($massiv[$j][$i]);
    }
    $ustunOrtaArifmetiklari[] = intval($sum / $n);
    echo "\n";
}

echo "\nOriginal massiv ustunlari \no'rta arifmetiklari: \n";
massiv_korsat($ustunOrtaArifmetiklari);







function getRandomArray(&$massiv, $satr, $ustun): void
{
    for ($i = 0; $i < $satr; $i++)
    {
        for ($j = 0; $j < $ustun; $j++)
        {
            $massiv[$i][$j] = rand(1, 100);
        }
    }
}

function matrix_korsat($massiv, $satr, $ustun): void
{
    for ($i = 0; $i < $satr; $i++)
    {
        for ($j = 0; $j < $ustun; $j++)
        {
            print "  " . $massiv[$i][$j];
        }
        print PHP_EOL;
    }
    print PHP_EOL;
}

function massiv_korsat($massiv): void
{
    foreach ($massiv as $value)
    {
        echo $value . "  ";
    }
}