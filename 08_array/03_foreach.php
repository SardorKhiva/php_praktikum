<?php

$monthDays = [
    'January' => 31,
    'February' => 28,
    'March' => 31,
    'April' => 30,
    'May' => 31,
    'June' => 31,
    'July' => 30,
    'August' => 31,
    'September' => 30,
    'October' => 31,
    'November' => 30,
    'December' => 31
];

// oddiy for orqali indexli massiv elementlarini sikl orqali o'tib chiqsa bo'ladi
// lekin assotsiativ massivlarda for ishlatilmaydi :
/*
for ($j = 0; $j < count($monthDays); $j++) {
    echo $monthDays[$monthDays[$j]] . '<br>';
}
*/

// Assostiativ massivlarda foreach ishlatiladi, to'liq qolip:
/*
foreach ($massivMomi, as $key => $value) {
    // statements
}

// qisqa qolip:
foreach ($massivNomi as $element) {
    // statements
    echo $element;
}
*/

foreach ($monthDays as $key => $value) {    //
    echo $key . ' - ' . $value . "\n";
}
echo "\n";

// if dagi kabi sintaksis:
foreach ($monthDays as $key => $value):
    echo $key . ' - ' . $value . "\n";
endforeach;