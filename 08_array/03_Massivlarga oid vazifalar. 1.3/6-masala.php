<?php
// 6-masala. Selection sort yordamida massivni
// osib borish tartiribda saralang.
// Algoritm: Har bir element o`zidan keyin
// turgan elementlarning eng kichigi
// bilan almashtiriladi.

$arr = [];
$n = null;

getRandomArrToN($arr);
print_r($arr);

selectionSort($arr);
print_r($arr);


function getRandomArrToN(&$arr): void
{
    echo "Nechta element kerak: ";
    $n = intval(trim(readline()));
    $arr = range(1, $n);
    shuffle($arr);
}

function selectionSort(array &$arr): void
{
    for ($i = 0; $i < count($arr)-1; $i++)
    {
        // kichik element indexi = i-element
        $minValueIndex = $i;
        for ($j = $i + 1; $j < count($arr); $j++)
        {
//            agar o'ngda turgan element kichik bo'lsa
//            chapda turgan elementdan
            if ($arr[$j] < $arr[$minValueIndex])
            {
                // o'ngda turgan kichik element indexi
                // chapda turgan katta element indexi
                // bilan almashtirilsin
                $minValueIndex = $j;
            }
        }
        // agar i-index minimal element indexidan farqli bo'lsa
        if ($i != $minValueIndex)
        {
            // chapda turgan kichik element
            // o'ngda turgan katta element bilan
            // qiymatlari almashtirilsin
            swap($arr[$minValueIndex], $arr[$i]);
        }
    }
}

function swap(&$x, &$y): void
{
//    1-usul
//    list($x, $y) = [$y, $x];

    // 2-usul:
     $x = $x ^ $y;
     $y = $x ^ $y;
     $x = $x ^ $y;
}