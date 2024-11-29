<?php

// 1-masala.
// A va B sonlarning qiymatlarini almashtiring.
// A va B ning yangi qiymatlari ekranga chiqsin.
// Boshqa yangi o'zgaruvchi ishlatmasdan qiymatlarini almashtiring.
echo "\n\t1-masala: " . PHP_EOL;
$qiymat_1 = 5;
$qiymat_2 = 15;
echo "1-o'zgaruvchi = " . $qiymat_1 . PHP_EOL;
echo "2-o'zgaruvchi = " . $qiymat_2 . PHP_EOL;
$qiymat_1 = $qiymat_1 ^ $qiymat_2;
$qiymat_2 = $qiymat_1 ^ $qiymat_2;
$qiymat_1 = $qiymat_1 ^ $qiymat_2;
echo 'almashtiramiz:' . PHP_EOL;
echo "1-o'zgaruvchi = " . $qiymat_1 . PHP_EOL;
echo "2-o'zgaruvchi = " . $qiymat_2 . PHP_EOL;
echo PHP_EOL;

// 2-masala.
// Ikki xonali son berilgan. Uning raqamlar yig’indisini aniqlang.
echo "\t2-masala: " . PHP_EOL;
$a = 12;
$natija = ($a % 10) * 10 + (int)($a / 10);
echo $natija . PHP_EOL;
echo PHP_EOL;

// 3-masala.
// 3 xonali son berilgan. Uning yuzlar xonasidagi raqamini aniqlang.
echo "\t3-masala: " . PHP_EOL;
$son = 786;
// bo'lib butun qismini olib qolish orqali:
echo (int)($son / 100) . PHP_EOL;
// kam tomonga yaxlitlash orqali:
echo floor($son / 100) . PHP_EOL;
echo PHP_EOL;

// 4-masala.
// 3 xonali son berilgan. Uning raqamlarini teskari tartibda
// yozilishidan hosil bo’lgan raqamni aniqlang.
echo "\t4-masala: " . PHP_EOL;
$x = 786;
$yuz = $x % 10 * 100;
$on = (int)($x / 10) % 10 * 10;
$bir = (int)($x / 100);
$natija = $yuz + $on + $bir;
echo $natija . PHP_EOL;
echo PHP_EOL;

// 5-masala.
// Kun boshidan boshlab N sekund vaqt o’tdi.
// Kun boshidan boshlab qancha soat, minut,
// sekund o’tganini aniqlash. Masalan: N = 86295;
// Natija: Kun boshidan 23 soat, 58 daqiqa, 15 seconds o'tdi.
echo "\t 5-masala: " . PHP_EOL;

echo "Soniyalarni kiriting: ";
// console da kirtiish uchun:
// $s = trim(fgets(STDIN));
$s = 90061;

// kunni hisoblash:
$kun = floor($s / (24 * 60 * 60));
$qolgan_soniya = $s % (24 * 60 * 60);

// soatni hisoblash:
$soat = floor($qolgan_soniya / (60 * 60));
$qolgan_soniya = floor($qolgan_soniya % (60 * 60));

// daqiqani hisoblash:
$daqiqa = floor($qolgan_soniya / 60);
$qolgan_soniya = floor($qolgan_soniya % 60);

echo $s . " soniyadan boshlab ";
echo $kun . " kun " . PHP_EOL;
echo $soat . " soat " . PHP_EOL;
echo $daqiqa . " daqiqa " . PHP_EOL;
echo $qolgan_soniya . " soniya o'tdi\n" . PHP_EOL;
echo PHP_EOL;

// 6-masala.
// Tomonlari 17 metr va 25 metr ga teng bo`lgan xonaga,
// tomonlari 100sm bo`lgan kafeldan, nechtasi kerak bo`ladi.
echo "\t6-masala: " . PHP_EOL;
$xona_eni = 17;
$xona_boyi = 25;
$kafel_olchami = 1;
$kafel_soni = $xona_eni * $xona_boyi / $kafel_olchami;
echo "$xona_eni m^2 x $xona_boyi m^2 xonaga $kafel_soni ta kafel kerak\n";
echo PHP_EOL;

// console test input in php:
//$a = trim(fgets(STDIN));

// 7-masala.
// Tomonlari 17 m va 24 m ga teng bo`lgan xonaga,
// tomonlari 80sm bo`lgan kafeldan, nechtasi kerak bo`ladi.
// Faqat butun kafel ishlatilganlarni sonini aniqlang.
echo "\t7-masala: " . PHP_EOL;
$xona_eni = 17;
$xona_boyi = 24;
$kafel_olchami = 0.8 * 0.8;
$kafel_soni = $xona_boyi * $xona_eni / $kafel_olchami;
$kafel_soni = floor($kafel_soni);
echo "($xona_eni x $xona_boyi) sm^2 xona uchun $kafel_soni ta kafel kerak\n";
echo PHP_EOL;

// 8-masala.
// Tomonlari 17 m va 24 m ga teng bo`lgan xonaga,
// tomonlari 80sm bo`lgan kafeldan yotqizildi.
// Butun kafel ishlatilmaydigan qismini yuzini aniqlang.
echo "\t8-masala: " . PHP_EOL;
$kafel_olchami = 0.8 * 0.8;
$xona_eni = 17.0;
$xona_boyi = 24.0;

$umumiy_yuza = $xona_eni * $xona_boyi;
// do'konda butun kafel sotilgani uchun biz kafel sonini yuqoriga yaxlitlaymiz:
$kafel_soni = ceil($umumiy_yuza / $kafel_olchami);
$kafelli_yuza = $kafel_soni * $kafel_olchami;
// ishlatilmay qolgan kafel yuzasi:
$qoldiq_yuza = $kafelli_yuza - $umumiy_yuza;

echo "Umumiy yuza = " . $umumiy_yuza . " m^2" . PHP_EOL;
echo "Kafelli yuza = " . $kafelli_yuza . " m^2" . PHP_EOL;
echo "Ishlatiladigan kafellar soni = " . $kafel_soni . PHP_EOL;
echo "Kafel ishlatilmay qolgan qismi yuzasi = " . $qoldiq_yuza . PHP_EOL;
echo PHP_EOL;