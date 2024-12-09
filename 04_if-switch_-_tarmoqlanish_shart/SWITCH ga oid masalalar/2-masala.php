<?php
/*
 * 2-masala.
 * Berilgan son (1 dan 100 gacha bo`lgan sonlar) ni sozlar yordamida ifodalang:
 * 67 - oltmish yetti
 */


echo '1 dan 1000 gacha butun son kiriting: ';
$son = intval(trim(readline()));

// manfiy sonlarni ham so'zda ifodalash uchun,
// kiritilgan sondan nusxa olamiz:
$son2 = $son;

// va 1-kiritilgan sonni modulini olamiz:
$son = abs($son);


$bir = $son % 10;
$on = intval($son % 100 / 10);
$yuz = intval($son / 100);

$bir_str = match ($bir) {
    1 => "bir",
    2 => "ikki",
    3 => "uch",
    4 => "to'rt",
    5 => "besh",
    6 => "olti",
    7 => "yetti",
    8 => "sakkiz",
    9 => "to'qqiz",
    default => ''
};

$on_str = match ($on) {
    1 => "o'n",
    2 => "yigirma",
    3 => "o'ttiz",
    4 => "qirq",
    5 => "ellik",
    6 => "oltmish",
    7 => "yetmish",
    8 => "sakson",
    9 => "to'qson",
    default => "o'n"
};

$yuz_str = match ($yuz) {
    1 => "yuz",
    2 => "ikki yuz",
    3 => "uch yuz",
    4 => "to'rt yuz",
    5 => "besh yuz",
    6 => "olti yuz",
    7 => "yetti yuz",
    8 => "sakkiz yuz",
    9 => "to'qqiz yuz",
    default => "yuz"
};

echo $son2 . " - ";

if ($son2 < 0) {
    echo "minus ";
}

if ($yuz > 0) {
    echo $yuz_str . ' ';
}

if ($on > 0) {
    echo $on_str . ' ';
} elseif ($yuz > 0) {
    echo '';
}

if ($bir > 0) {
    echo $bir_str . ' ';
}

echo PHP_EOL;