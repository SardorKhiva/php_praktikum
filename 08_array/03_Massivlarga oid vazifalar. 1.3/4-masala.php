<?php
// 4-masala. N ta elementdan tashkil
// topgan massiv berilgan. Massiv elementlari
// orasidan 2 martadan kop uchraganlarini
// o'chiruvchi funksiya yozing.
// Hosil bolgan massiv elementlari soni
// va elementlari chiqarilsin.

$n = null;  // elementlar umumiy soni
$n2 = null; // dublikat elementlar bo'lishi uchun n2 = n/3
$arr = [];  // massiv

// keraklicha n ni qabul qilish:
do {
    echo "Nechta massiv elementi kerak: ";
    $n = intval(readline());
    $n2 = intval($n / 3);
} while (!($n2 > 1));

// keraklicha element generatsiya qilish:
for ($i = 0; $i < $n; $i++) {
    $arr[$i] = rand(1, $n2);
}

// nima necha marta takrorlanganini ko'rish uchun saralash:
sort($arr);

// saralangan massivni ko'rish:
echo "Dastlabki random $n ta elementli massiv\n";
print_r($arr);

// elementlar necha marta takrorlanganini saqlovchi massiv
// [element] => [takrorlanishlar soni]
$counts = array_count_values($arr);

echo "\nTakrorlanuvchilar massivi:\n";
//print_r($counts);
foreach ($counts as $key => $value) {
    echo "$key elementi $value marta takrorlangan\n";
}
echo "\n";

// agar takrorlanishlar soni 2 dan ko'p bo'lgan elem
foreach ($counts as $key => $value) {
    if ($value > 2) unset($counts[$key]);
}

if (count($counts) > 0) {
    echo "Qaysi element necha marta takrorlangan: \n";
//print_r($counts);
    foreach ($counts as $key => $value) {
        echo "$key elementi $value marta takrorlangan\n";
    }
}
