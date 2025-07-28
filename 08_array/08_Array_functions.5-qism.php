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
$massiv = range(1, 15); // 1 dan 15 gacha bo'lgan sonlar massivini hosil qiladi
echo "Original massiv:\n";
print_r($massiv);

echo "\nAralashgan massiv:\n";
shuffle($massiv); // massivni aralashtirish
print_r($massiv);

echo "\nSaralangan massiv:\n";
sort($massiv); // massivni o'sib borish tartibida saralash
print_r($massiv);