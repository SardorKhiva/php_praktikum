<?php

echo 'Hafta kuni tartib raqamini kiriting: ';
$kun = intval(trim(fgets(STDIN)));
$return_value = '';

$return_value = match ($kun) {
    1 => 'Dushanba',
    2 => 'Seshanba',
    3 => 'Chorshanba',
    4 => 'Payshanba',
    5 => 'Juma',
    6 => 'Shanba',
    7 => 'Yakshanba',
    default => 'Hafta kuni tartib raqami yanglishdir',
};

var_dump($return_value);
echo PHP_EOL;

$a = 2;
switch ($a) {
    case 1:
        $operation = "qo'shish";
        break;
    case 2:
        $operation = "ayirish";
        break;
    case 3:
        $operation = "ko'paytirish";
        break;
    case 4:
        $operation = "bo'lish";
        break;
    default:
        $operation = "действие по умолчанию";
}
echo $operation . PHP_EOL;

$amal = match ($a) {
    1 => "qo'shish",
    2 => "ayirish",
    3 => "ko'paytirish",
    4 => "bo'lish",
    default => "bunday amal yo'q"
};
echo $amal;