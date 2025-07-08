<?php

// implode - massiv elementlarini birlashtirib, bitta satrga aylantiradi.
/*
$array = [
    "Assalomu",
    "alaykum"
];
$natija1 = implode($array);
echo $natija1 . PHP_EOL; // massiv elementlarini bitta satrga aylantirdi

$natija2 = implode(", ", $array);   // 1) ajratuvchi belgi - separator, 2) massiv nomi
echo $natija2 . PHP_EOL; // massiv elementlarini bitta satrga aylantirdi, elementlar orasiga vergul qo'ydi
*/

// explode - satrni ajratib, massivga aylantiradi.
/*
$str = "Assalomu alaykum, aziz do'stlar!";

$natija1 = explode(" ", $str); // ajratish belgilari - bo'shliq
print_r($natija1); // satrni bo'shliqlar bo'yicha ajratib, massivga aylantirdi

$natija2 = explode(", ", $str); // ajratish belgilari - vergul va bo'shliq
print_r($natija2); // satrni vergul va bo'shliqlar bo'yicha ajratib, massivga aylantirdi
*/

// array_combine - ikkita massivni birlashtirib, kalit-qiymat juftliklarini hosil qiladi.
/*
$massiv1 = [
    "a" => "green", "b" => "red", "c" => "blue"
];
$massiv2 = [
    "d" => "yellow", "e" => "purple", "f" => "orange"
];
$natija1 = array_combine(array_keys($massiv1), array_values($massiv2));
$natija2 = array_combine($massiv1, $massiv2);
echo "massiv1 ning kalitlari va massiv2 ning 
qiymatlari bo'yicha yangi massiv hosil qildi: \n";
print_r($natija1);

echo "massiv1 ning qiymatlari va massiv2 ning 
qiymatlari bo'yicha yangi massiv hosil qildi: \n";
print_r($natija2);
*/

// array_slice - massivning bir qismini kesib olish uchun ishlatiladi.
/*
$massiv = [
    "a" => "green", "b" => "red", "c" => "blue",
    "d" => "yellow", "e" => "purple", "f" => "orange"
];
$natija1 = array_slice($massiv, 2); // 2-indeksdan boshlab oxirigacha
$natija2 = array_slice($massiv, 2, 3); // 2-indeksdan boshlab 3 ta element
$natija3 = array_slice($massiv, -3, 2); // oxiridan 3 ta elementdan 2 ta
$natija4 = array_slice($massiv, -3, 2, true); // oxiridan 3 ta elementdan 2 ta
// true - kalitlarni saqlaydi, aks holda yangi kalitlar hosil bo'ladi
echo "Massiv: \n";

echo "2-indeksdan boshlab oxirigacha: \n";
print_r($natija1);
echo "2-indeksdan boshlab 3 ta element: \n";
print_r($natija2);
echo "oxiridan 3 ta elementdan 2 ta: \n";
print_r($natija3);
echo "oxiridan 3 ta elementdan 2 ta, kalitlarni saqlaydi: \n";
print_r($natija4);
*/

// array_splice - massivning bir qismini o'chiradi
// yoki boshqa elementga almashtiradi,
// yangi elementlar qo'shadi.
// Asosiy massivni o'zgartiradi !

// 1-holat:
/*
$massiv = [
    "a" => "green", "b" => "red", "c" => "blue",
    "d" => "yellow", "e" => "purple", "f" => "orange"
];
echo "Asosiy massiv: \n";
print_r($massiv);

echo "\n2-indeksdan boshlab oxirigacha o'chiradi
va ularni yangi massivga yozadi: \n";
$natija1 = array_splice($massiv, 2);
print_r($natija1);

echo "\nO'zgargan asosiy massiv: \n";
print_r($massiv);
// 1-holatdan keyin asosiy massiv o'zgardi,
// 2-indeksdan boshlab oxirigacha elementlar o'chirildi va
// ularni yangi massivga yozdi
*/

// 2-holat:
/*
$massiv1 = [
    'sut', 'tuz', 'shakar', 'non', 'go\'sht'
];
$massiv2 = [
    'sariq', 'qizil', 'yashil'
];
echo "\nAsosiy massiv: \n";
print_r($massiv1);

// 2-indeksdan boshlab 3 ta elementni o'chirib, massiv2 elementlarini massiv1 ga qo'shadi
array_splice($massiv1, 2, 3, $massiv2);
echo "\n2-indeksdan boshlab 3 ta elementni o'chirib,
yangi massiv elementlarini qo'shadi: \n";
print_r($massiv1); // 2-indeksdan boshlab 3 ta elementni o'chirib, yangi massiv elementlarini qo'shdi
*/

// 3-holat:
// 1-massivdan hech narsa o'chirmasdan, 2-massiv elementlarini qo'shadi
/*
$web_dasturlash = [
    'HTML', 'CSS', 'JavaScript', 'PHP', 'MySQL'
];
$yangi_dasturlash = [
    'Python', 'Django', 'Flask'
];
echo "\nAsosiy massiv: \n";
print_r($web_dasturlash);

// web_dasturlash massivining 1-indeksidan boshlab 0 tani o'chirib yangi_dasturlash massivini qo'shadi
array_splice($web_dasturlash, 1, 0, $yangi_dasturlash);
echo "\n1-indeksdan boshlab yangi massiv elementlarini qo'shdi: \n";
print_r($web_dasturlash); // 1-indeksdan boshlab yangi massiv elementlarini qo'shdi
*/