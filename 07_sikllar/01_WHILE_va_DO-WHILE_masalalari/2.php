<?php
/*
2)
*
* *
* * *
* * * *
* * * * *
yuqoridagini hosil qiling
*/

echo "\nwhile orqali" . PHP_EOL;
$i = 1;
$uzunligi = 5;

while ($i <= $uzunligi) {
    $j = 1;     // while da ichki while siklidagi o'zgaruvchilarni qiymatini oldingi holatga keltirib qo'yish kerak
    while ($j <= $i) {
        echo '* ';
        $j++;
    }
    echo "\n";
    $i++;
}
echo "\ndo while orqali" . PHP_EOL;

$i = 1;

do {
    $j = 1;
    do {
        echo '* ';
        $j++;
    } while ($j <= $i);
    $i++;
    echo "\n";
} while ($j <= $uzunligi);