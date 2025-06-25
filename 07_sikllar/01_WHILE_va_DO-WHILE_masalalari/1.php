<?php
//1) 1 dan 100 gacha bo`lgan sonlarni yigindisini hisoblang
/* while orqali:
$summa = 0;
$iterator = 1;
$stop = 100;

while ($iterator <= 100) {
    echo "$iterator";
    if ($iterator < 100) {
        echo ' + ';
    }
    if ($iterator % 10 == 0) {
        echo PHP_EOL;
    }
    if ($iterator == 100) echo ' = ';

    $summa += $iterator;
    $iterator++;
}
echo $summa;
echo PHP_EOL;
*/

// do while orqali
$start = 1;
$end = 100;
$summa = 0;

do {
    $summa += $start;
    $start++;
} while ($start <= $end);

echo $summa;