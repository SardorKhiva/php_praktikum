<?php
$chelak = 3;
$bochka = 100;
$suv = 0;
$i = 0;

while ($suv < $bochka) {
    $suv += $chelak;
    $i++;
}
echo $i . PHP_EOL . PHP_EOL;

$i = 1;
while ($i <= 3) {
    $j = 1;
    while ($j <= 3) {
        echo "i = $i \t j = $j" . PHP_EOL;
        $j++;
    }
    $i++;
}

echo "\n1 dan 100 gacha sonlar yig'indisi:\n";
$summa = 0;
$i = 1;
$last = 100;

while ($i <= $last) {
    $summa = $summa + $i;
    $i++;
}
echo $summa . PHP_EOL . PHP_EOL;