<?php
$x = 1;

do {
    echo "x = $x" . PHP_EOL;
    $x++;
} while ($x < 7);

echo $x . PHP_EOL . PHP_EOL;

echo "1 dan 100 gacha sonlar yig'indisi:\n";

$s = 0;
$i = 1;
$last = 100;

do {
    $s = $s + $i;
    $i++;
} while ($i <= 100);
echo $s . PHP_EOL;