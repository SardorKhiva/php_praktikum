<?php

// list - massiv elementlari qiymatlarini list parametridagi o'zgaruvchilarga beradi
/*
$web_massiv = [
    'html', 'css', 'js', 'php'      // shu elementlarni pastdagi list funksiya parametridagi o'zgaruvchilarga beradi
];

list($HTML, $CSS, $JS, $PHP) = $web_massiv; // massiv elementlarini o'zgaruvchilarga beradi
echo "Web dasturlash tillari: \n";
echo "HTML: $HTML\n";
echo "CSS: $CSS\n";
echo "JS: $JS\n";
echo "PHP: $PHP\n";
*/

// range() - berilgan qiymatlar oralig'idagi massiv hosil qiladi
/*
$range_demo = range(1, 10); // 1 dan 10 gacha bo'lgan sonlar massivini hosil qiladi
echo "1 dan 10 gacha bo'lgan sonlar: \n";
print_r($range_demo); // 1 dan 10 gacha bo'lgan sonlar massivini chiqaradi

$range_demo_2 = range(1, 10, 2); // 1 dan 10 gacha 2 qadam bilan sonlar massivini hosil qiladi
print_r($range_demo_2);
*/

// shuffle(&array) - massiv elementlarini (kalitlarinimas) aralashtiradi - asosiy massivni o'zgartiradi
/*
$range_demo = range(1, 15); // 1 dan 10 gacha bo'lgan sonlar massivini hosil qiladi
echo "Aralashmagan massiv:\n";
print_r($range_demo);

// Aralashmagan massivni aralashtirish
shuffle($range_demo);
echo "Aralashgan massiv:\n";
print_r($range_demo);
*/

// sort(&array) - massivni o'sib borish tartibida saralaydi - asosiy massivni o'zgartiradi
/*
$massiv = range(1, 15); // 1 dan 15 gacha bo'lgan sonlar massivini hosil qiladi
echo "Original massiv:\n";
print_r($massiv);

echo "\nAralashgan massiv:\n";
shuffle($massiv); // massivni aralashtirish
print_r($massiv);

echo "\nSaralangan massiv:\n";
sort($massiv); // massivni o'sib borish tartibida saralash
print_r($massiv);
*/

// rsort(&array) - revert sort, massivni kamayib borish tartibida saralaydi - asosiy massivni o'zgartiradi
/*
$massiv = range(1, 15);
shuffle($massiv);
echo "Aralashgan massiv:\n";
print_r($massiv);

echo "\nKamayib borish tartibida saralangan massiv:\n";
rsort($massiv);
print_r($massiv); // massivni kamayib borish tartibida saralash
*/

// asort(&array) - assotsiativ massivni qiymatlari bo'yicha
// o'sib borish tartibida saralaydi - asosiy massivni o'zgartiradi
/*
$massiv = range(1, 15);
shuffle($massiv);
echo "Aralashgan massiv:\n";
print_r($massiv);

asort($massiv); // oldingi kalitlarni saqlab qoladi!
echo "\nAssotsiativ massiv qiymatlarini o'sib borish tartibida saralangani:\n";
print_r($massiv); // massivni qiymatlari bo'yicha o'sib borish tartibida saralash
*/

// arsort(&array) - oldingi funksiyani teskarisi,
/*
// assotsiativ massivni kalitlarini saqlab,
// qiymatlari bo'yicha
// kamayish tartibida saralaydi - asosiy massivni o'zgartiradi
$massiv = range(1, 15);
shuffle($massiv);
echo "Aralashgan massiv:\n";
print_r($massiv);

arsort($massiv); // oldingi kalitlarni saqlab qoladi!
echo "\nAssotsiativ massiv qiymatlarini kamayish tartibida saralangani:\n";
print_r($massiv);
*/

// ksort(&array) - assotsiativ massivni kalitlari bo'yicha
/*
// o'sib borish tartibida saralaydi - asosiy massivni o'zgartiradi,
// bunda kalit o'z elementidan ajralmaydi!
$massiv = [
    "b" => "red",
    "c" => "blue",
    "a" => "green",
];

ksort($massiv);
echo "Assotsiativ massiv kalitlarini o'sib borish tartibida saralangani:\n";
print_r($massiv); // massivni kalitlari bo'yicha o'sib borish tartibida saralash
*/

// krsort(&array) - assotsiativ massivni kalitlari bo'yicha
/*
// kamayish tartibida saralaydi - asosiy massivni o'zgartiradi,
// bunda kalit o'z elementidan ajralmaydi!

$colors = [
    "b" => "red",
    "c" => "blue",
    "a" => "green",
];
echo "Original assotsiativ massiv:\n";
print_r($colors);

echo "Kalitlari kamayish tartibida saralangan assotsiativ massiv:\n";
krsort($colors);
print_r($colors);
*/

