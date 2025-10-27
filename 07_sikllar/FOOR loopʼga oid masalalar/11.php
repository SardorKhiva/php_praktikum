<?php
// 11. Yig'indini toping. 1 + 11 + 111 + 1111 + ... N ta 1.

echo "n: ";
$n = doubleval(readline());

$summa = 0;
$daraja = 1;
$s = 0;

for ($i = 0; $i < $n; $i++) {
    // asosiy mantiq
    $summa += pow(10, $i);
    $s += $summa;

    // har 5 ta sondan keyin yangi qatorga o'tsin
    if ($i % 5 == 0) {
        echo "\n";
    }

    // misol ko'rinishida chiqarish
    echo $summa;

    if ($i < $n - 1) {
        echo " + ";
    } else {
        echo " = ";
    }

}
//echo "1 dan $summa gacha sonlar yig'indisi $s \n";
echo "$s \n";