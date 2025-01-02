<?php
// 1-masala. $n = array(12, 5, 2, 66, 22, 56, 123, 7, 1, 67).
// Ushbu massivni elementlari kamayish tartibda saralang
// va hosil bo’lgan yangi
// massivni ekranga chiqaring.
// Natija : 123, 67, 66, 56, 22, 12, 7, 5, 2, 1

$n = array(12, 5, 2, 66, 22, 56, 123, 7, 1, 67);
print_r($n);

for ($i = 0; $i < count($n); $i++)
{
    $max = $n[$i];
    for ($j = $i + 1; $j < count($n); $j++)
    {
        if ($n[$j] > $max)
        {
            $max = $n[$j];
            $n[$j] = $n[$i];
            $n[$i] = $max;
        }
    }
}
print_r($n);