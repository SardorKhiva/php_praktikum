<?php

$massiv = [
    false, 1, 2, 3, "to'rt", '5', true, null
];
$var = 12;

// is_array - massiv yoki massiv emasligini tekshiradi, return boolean
/*
var_dump(is_array($massiv)) . PHP_EOL;
var_dump(is_array($var)) . PHP_EOL;
echo PHP_EOL;
*/

// in_array - massivda shu qiymatli element borligini tekshiradi: boolean
/*
var_dump(in_array(false, $massiv)) . PHP_EOL;  //true, $massiv ni ichida false bor
var_dump(in_array(5, $massiv)) . PHP_EOL;      // true tipni e'tiborga olmay qidiradi
var_dump(in_array(5, $massiv, true)) . PHP_EOL; // false, tipni e'tiborga olib qidiradi
echo PHP_EOL;
*/

// array_search - massiv ichida mavjud bo'lgan element index ini qaytaradi, aks holda false
/*
echo array_search(true, $massiv) . PHP_EOL;     // 1-indexli elementni oldi, int ni boolean deb oldi
echo array_search(true, $massiv, true) . PHP_EOL; // tiplarni qat'iy tekshirdi
*/


// array_column - ko'p o'lchamli massivlardagi ichki massiv key laridagi har bir elementlarni alohida massivga oladi:
$davlatlar = [
    [
        'id' => 1,
        'name' => 'Uzbekistan',
        'poytaht' => "Toshkent"
    ],
    [
        'id' => 2,
        'name' => 'Japan',
    ]
];
/*
print_r(array_column($davlatlar, 'name'));  // davlatlar nomlari chiqadi
*/

// count - massiv elementlari soni
/*
echo 'count($massiv): ' . count($massiv) . "\n";
echo 'count($davlatlar): ' . count($davlatlar) . "\n";  // multidimension array larda ichki massivlarni sanamaydi
echo 'count($davlatlar, 1): ' . count($davlatlar, 1) . PHP_EOL;
echo PHP_EOL;

// sizeof = count , massiv elementlari soni
echo sizeof($massiv) . "\n";
echo sizeof($davlatlar, 1) . PHP_EOL;
*/

// array_push - massivga yangi element qo'shadi, massiv oxiriga qo'shadi
array_push($davlatlar, "Korea", "China");   // massiv oxiriga 2 ta davlat nomi qo'shildi
print_r($davlatlar);