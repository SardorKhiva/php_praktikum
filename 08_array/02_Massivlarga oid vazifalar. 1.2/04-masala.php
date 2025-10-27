<?php
// 4-masala. N butun son berilgan.
// 2 sonining dastlabki N ta darajasidan
// tashkil topgan massiv hosil qiling
// va ekranga chiqaring.

echo "Qanchagacha 2 ning darajasi kerak: ";
$n = intval(readline());

$arr = [];

for ($i = 0, $j = 1; $j <= $n; $i++, $j++) {
    $arr[$i] = pow(2, $j);
    echo "arr[$i] = 2^$j = ";
    echo number_format($arr[$i], 0, '.', ' ');
    echo PHP_EOL;
}