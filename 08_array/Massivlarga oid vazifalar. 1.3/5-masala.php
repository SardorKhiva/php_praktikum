<?php
// 5-masala. Bubble sort yordamida
// massivni o'sib borish tartiribda saralang.
// Algoritm: Har bir element o'zidan keyin
// turgan elementlar bilan solishtiriladi.
// Agar o'zidan keyin turgan element undan
// kichik bo'lsa ularni qiymati almashadi.

echo "Nechta element kerak: ";
$n = intval(trim(readline()));

// yangi bo'sh massiv
$arr = [];

// massivni random qiymatlar bilan to'ldirish
getRandArr($arr, $n);
print_r($arr);

// ko'pik usulida o'sib borish tartibida saralash
bubbleSort($arr);
print_r($arr);

// n ta elementli n gacha bo'lgan aralashtirilgan massiv:
function getRandArr(&$arr, $n): void
{
    $arr = range(1, $n);
    shuffle($arr);
}

function bubbleSort(array &$arr): void
{
    for ($i = 0; $i < count($arr); $i++) {
        for ($j = $i + 1; $j < count($arr); $j++) {
            if ($arr[$i] > $arr[$j]) {
//                bu 1-usul:
//                $temp = $arr[$i];
//                $arr[$i] = $arr[$j];
//                $arr[$j] = $temp;
                swap($arr[$i], $arr[$j]);   // bu 2-usul
            }
        }
    }

    /* klassiv bubble sort:
    for ($j = 0; $j < count($arr) - $i - 1; $j++) {
        if ($arr[$j] > $arr[$j + 1]) {
            swap($arr[$j], $arr[$j + 1]);
        }
    }
    */
}

// php ni imkoniyatidan foydalanib 2 ta
// element qiymatini almashitiruvchi funksiya
function swap(&$x, &$y): void
{
    list($x, $y) = [$y, $x];
}