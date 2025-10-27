<?php

// array_push - massivga yangi element qo'shadi, massiv oxiriga qo'shadi
/*
$viloyatlar = [
    "Andijon",
    "Buxoro",
    "Farg'ona",
    "Jizzax",
    "Qashqadaryo",
    "Navoiy",
    "Namangan",
    "Samarqand",
    "Sirdaryo",
    "Surxondaryo",
    "Toshkent"
];
print_r($viloyatlar);
array_push($viloyatlar, 'Xorazm',
    "Qoraqalpog'iston Respublikasi"); // massiv oxiriga 2 ta viloyat qo'shildi
print_r($viloyatlar);
*/

// array_pop - massiv oxiridan elementni o'chiradi
/*
$oxirgi = array_pop($viloyatlar);
print($oxirgi) . PHP_EOL; // oxirgi element o'chirildi
print_r($viloyatlar);
*/

// array_diff - 1-massivdagi elementlarni 2-massivdagi elementlar bilan solishtiradi va
// 1-massivda mavjud bo'lgan, lekin keyingi massivlarda yo'q bo'lgan elementlarni qaytaradi.
/*
$array1 = array("a" => "green", "red", "blue", "red");
$array2 = array("b" => "green", "yellow", "red");
$result = array_diff($array1, $array2);
print_r($result);
*/

// array_flip - massivdagi kalit va qiymatlarni o'zgartiradi, ya'ni kalitlarni qiymat, qiymatlarni esa kalit qiladi.
/*
$massiv1 = [
    "a" => "green",
    "b" => "red",
    "c" => "blue",
    "d" => "yellow"
];
print_r($massiv1);
$massiv2 = array_flip($massiv1);
print_r($massiv2); // massivdagi kalit va qiymatlarni o'zgartirdi
*/

// array_merge - ikkita yoki undan ko'p massivlarni birlashtiradi, yangi massiv hosil qiladi.
/*
$massiv1 = [
    "a" => "green",
    "b" => "red",
    "c" => "blue"
];
echo "Massiv 1: \n";
print_r($massiv1);

$massiv2 = [
    "d" => "yellow",
    "e" => "purple",
    "f" => "orange"
];
echo "Massiv 2: \n";
print_r($massiv2);
echo "Birlashgan massiv: \n";
$yangi_massiv = array_merge($massiv1, $massiv2);
print_r($yangi_massiv); // ikkita massivni birlashtirdi
*/

// array_count_values - massivdagi har bir qiymatning necha marta takrorlanganini hisoblaydi.
/*
$array = [
    "a" => "green",
    "b" => "red",
    "c" => "blue",
    "d" => "green",
    "e" => "red"
];
print_r($array);
$hisob = array_count_values($array);
print_r($hisob); // massivdagi har bir qiymatning necha marta takrorlanganini hisoblaydi
*/