<?php

$massiv1 = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10
];

$massiv2 = [
    "dushanba" => 1,
    "seshanba" => 2,
    "chorshanba" => 3,
    "payshanba" => 4,
    "juma" => 5,
    "shanba" => 6,
    "yakshanba" => 7
];
for ($i = 0; $i < count($massiv1); $i++) {
    echo $massiv1[$i] . "\n";
}
echo PHP_EOL;

// assotsiativ massivlarda for ishlatib bo'lmaydi
// foreach ishlatiladi
//for ($i = 0; $i < count($massiv2); $i++) {
//    echo $massiv2[$i] . "\n";
//}

// faqat elementlarni chiqarish
foreach ($massiv2 as $value) {
    echo $value . "\n";
}
echo PHP_EOL;

// keylar va valuelar ni chiqarish
foreach ($massiv2 as $key => $value) {
    echo $key . " => " . $value . "\n";
}