<?php

// array_intersect() - 1-massivdagi elementlarni
// 2-massivdagi elementlar bilan solishtiradi va
// 1-massivda mavjud bo'lgan,
// lekin keyingi massivlarda ham mavjud bo'lgan elementlarni qaytaradi.
/*
$massiv1 = [
    "a" => "green", "b" => "red", "c" => "blue"
];
$massiv2 = [
    "d" => "yellow", "e" => "purple", "f" => "orange",
    "a" => "green", "b" => "red"    // index farqli bo'lsa ham, qiymatlari bir xil bo'lgan elementlar olinadi
];
$natija = array_intersect($massiv1, $massiv2);
echo "Massiv 1: \n";
print_r($massiv1);
echo "Massiv 2: \n";
print_r($massiv2);
echo "1-va 2-massivda ham mavjud bo'lgan elementlar: \n";
// massivdagi elementlarni solishtirib, 1-massivda mavjud bo'lgan,
// lekin 2-massivda ham mavjud bo'lgan elementlarni qaytaradi
print_r($natija);
*/

// array_unique() - massivdagi takroriy elementlarni olib tashlaydi
// va yangi massiv qaytaradi.
/*
$takroriy_massiv = [
    "a" => "green", "b" => "red", "c" =>
        "blue", "d" => "green", "e" => "red"
];
echo "Takroriy massiv: \n";
print_r($takroriy_massiv);
$unikal_massiv = array_unique($takroriy_massiv);
echo "Takroriy elementlar olib tashlangan massiv: \n";
print_r($unikal_massiv); // massivdagi takroriy elementlarni olib tashlaydi
*/

// extract() - massivdagi string kalitlarni shu nomli o'zgaruvchilarga
// aylantiradi va qiymatlarini o'zgaruvchilarga beradi.
/*
$massiv = [
    "a" => "green", "b" => "red", "c" => "blue"
];
echo "Massiv: \n";
print_r($massiv);
extract($massiv); // massivdagi string kalitlarni o'zgaruvchilarga aylantiradi
echo "O'zgaruvchilar: \n";
echo "a = $a\n"; // $a o'zgaruvchisi massivdagi "a" kalitining qiymatini oldi
echo "b = $b\n"; // $b o'zgaruvchisi massivdagi "b" kalitining qiymatini oldi
echo "c = $c\n"; // $c o'zgaruvchisi massivdagi "c" kalitining qiymatini oldi
*/

// compact() - o'zgaruvchilarni massivga aylantiradi.
// O'zgaruvchilar nomlarini massiv kalitlari, qiymatlarini esa qiymatlarini oladi.
/*
$yashil = "green";
$qizil = "red";
$qora = "black";
$ranglar = compact("yashil", "qizil", 'qora');
echo "O'zgaruvchilardan hosil bo'lgan massiv: \n";
print_r($ranglar); // o'zgaruvchilar nomlarini massiv kalitlari,
*/

// array_values() - massivdagi qiymatlarni oladi
// va yangi indeksli massiv qaytaradi.
/*
$dasturlash = [
    "PHP" => "PHP",
    "JavaScript" => "JavaScript",
    "Python" => "Python",
    7 => "Java"
];
echo "Dasturlash tillari: \n";
print_r($dasturlash);
echo "Index li yangi massiv: \n";
print_r(array_values($dasturlash));
*/

// array_keys() - massivdagi kalitlarni oladi
// va yangi indeksli massiv qaytaradi.
/*
// 1-holat:
$dasturlash = [
    "P" => "PHP",
    "JS" => "JavaScript",
    "Py" => "Python",
    7 => "Java",
    9 => "PHP",
    'son' => 8,
    'satr' => '8'
];
echo "Dasturlash tillari: \n";
print_r($dasturlash);
echo "Kalitlar: \n";
// 1-holat:
// massivdagi kalitlarni oladi va
// yangi indeksli massiv qaytaradi
print_r(array_keys($dasturlash));

// 2-holat:
// massivdagi ma'lum qiymatlarni oladi va
// shu qiymat indexlaridan yangi indeksli massiv qaytaradi
$tanlangan_element = array_keys($dasturlash, 'PHP'); // massivdagi qiymatlarni oladi va yangi indeksli massiv qaytaradi
print_r($tanlangan_element);

// 3-holat:
// massivdagi ma'lum qiymatlarni oladi va
// shu qiymat indexlaridan yangi
// indeksli massiv qaytaradi,
// tiplarini ham tekshiradi
$tanlangan_elementlar = array_keys($dasturlash, 'PHP', true);
// massivdagi qiymatlarni oladi va
// yangi indeksli massiv qaytaradi,
// tiplarini ham tekshiradi
*/

// array_key_exists() - massivda ma'lum kalit mavjudligini tekshiradi
/*
$massiv = [
    "P" => "PHP",
    "JS" => "JavaScript",
    "Py" => "Python",
    7 => "Java",
    9 => "PHP",
    'son' => 8,
    'satr' => '8'
];

echo array_key_exists('P', $massiv) ?
    "Kalit 'P' mavjud\n" : "Kalit 'P' mavjud emas\n"; // true)
*/

// array_rand() - massivdan tasodifiy elementlarni oladi
/*
$massiv = [
    'talaba1' => 'Ali',
    'talaba2' => 'Dinora',
    'talaba3' => 'Mahmud'
];

$element = array_rand($massiv);
echo "Tasodifiy element: " . $massiv[$element] . "\n"; // tasodifiy elementni oladi

// 2 ta element kalitini random tanlash
$elementlar = array_rand($massiv, 2);
print_r($elementlar);
*/

