<?php
// 0-masala. $n = array(12, 5, 2, 66, 22, 56, 123, 7, 1, 67).
// Ushbu massivni elementlari o’sish tartibda saralang va hosil bo’lgan yangi
// massivni ekranga chiqaring.
// Natija : 1, 2, 5, 7, 12, 22, 56, 66, 67, 123

$n = array(12, 5, 2, 66, 22, 56, 123, 7, 1, 67);
print_r($n);
sortArr($n);
print_r($n);

function sortArr(&$n): void
{
    for ($i = 0; $i < count($n); $i++)
    {
        $min = $n[$i];
        for ($j = $i + 1; $j < count($n); $j++)
        {
            if ($n[$j] < $min)
            {
                $min = $n[$j];
                $n[$j] = $n[$i];
                $n[$i] = $min;
            }
        }
    }
}