<?php
/*
 * Berilgan son (1 dan 10 gacha bolgan sonlar) ni so`zlar yordamida ifodalang.
 * 7 - yetti;
 */

echo "Son kiriting: ";
$son = intval(trim(readline()));

$son_satrda = match ($son) {
    1 => "bir",
    2 => "ikki",
    3 => "uch",
    4 => "to'rt",
    5 => "besh",
    6 => "olti",
    7 => "yetti",
    8 => "sakkiz",
    9 => "to'qqiz",
    10 => "o'n",
    default => "bunday qiymat masala shartida yo'q\n"
};

echo "$son = $son_satrda" . PHP_EOL;