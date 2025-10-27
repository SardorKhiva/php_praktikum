<?php
// 1) 1 dan 100 gacha bo`lgan sonlarni yigindisini hisoblang
/*
$start = 0;     // agar start++ bo'lsa start = 0
$end = 100;
$sum = 0;

echo "While sikli orqali: \n";
while ($start++ < $end) {
    echo $start . "\t";
    $sum += $start;
    echo $sum . PHP_EOL;
//    $start++;         // agar start = 0 bo'lib sikl sharti start < end bo'lsa
}
echo $sum . PHP_EOL;
$sum = 0;

echo "\nFor sikli orqali: \n";
for ($start = 1; $start <= 100; $start++) {
    echo $start . "\t";
    $sum += $start;
    echo $sum . PHP_EOL;
}
echo "Yig'indi = ", $sum . PHP_EOL;

echo "\nDo while sikli orqali: \n";
$sum = 0;
$start = 1;
do {
    echo $start . "\t";
    $sum += $start;
    echo $sum . PHP_EOL;
} while ($start++ < $end);
echo "Yig'indi = ", $sum . PHP_EOL;
*/


// 2) * * * * * * * * * * * * * * * yuqoridagini hosil qiling
/*
$str = "* * * * * * * * * * * * * * *";
//echo $str . PHP_EOL;        // oddiy matn ko'rinishida
$str = str_replace(" ", "", $str);
// sikl orqali:
for ($i = 0; $i < strlen($str); $i++) {
    echo "* ";
}
*/


// 3) N son berilgan. 0 dan katta. N faktorialni hisoblang.
/*
echo "N faktorialni hisoblang: ";
$n = trim(fgets(STDIN));
$fact = 1;

echo "N faktorial for sikli orqali: \n";
for ($i = 1; $i <= $n; $i++) {
    $fact *= $i;
    echo "$i! = $fact \n";
}
echo PHP_EOL;

echo "N faktorial while sikli orqali: \n$n! = ";
$fact = 1;
while ($n > 1) {
    $fact *= $n--;
}
echo $fact;
echo PHP_EOL;
*/


// 4) Karra jadvalini hisoblab chiqaradigan funksiya hosil qiling.
// Masalan 5 kiritilsa 5 lar karrasi, 6 kiritilsa,
// 6 lar karrasi chiqsin 5x1=5 5x2=10 5x3=15 ...
/*
echo "Qaysi sonni karra jadvali kerak: ";
$n = trim(fgets(STDIN));
karraJadval($n);

function karraJadval(int $n): void
{
    for ($i = 1; $i <= 10; $i++) {
        echo "$n * $i = " . $n * $i . "\n";
    }
}
*/


// 5) Kiritilgan matndan sonlarni ajratadigan funksiya yozing.
// "Ushbu matn 26.11.2019 16:59 da yozildi. 1 minut kam 5" => 26112019165915
/*
echo "Matn: ";
$str = trim(fgets(STDIN));
$str_numeric = '';

// agar satrdagi belgilar son bo'lsa yangi o'zgaruvchiga qo'shib borilsin
for ($i = 0; $i < strlen($str); $i++) {
    if (is_numeric($str[$i])) {
        $str_numeric .= $str[$i];
    };
}
echo PHP_EOL . $str_numeric . PHP_EOL;
*/

// 6) M sonini N soniga bo’lgandagi qoldiqni va
// butun qismini bo’lish amallarini ishlatmasdan hisoblang.
/*
echo "M: ";
$M = trim(fgets(STDIN));
$M = intval($M);

echo "N: ";
$N = trim(fgets(STDIN));
$N = intval($N);

$butun_qismi = 0;

while ($N < $M) {
    $M -= $N;
    $butun_qismi++;
}
echo "\nButun qismi: $butun_qismi \n";
echo "Qoldiq qismi: $M \n";
*/

// 7) Shaxmat doskasini chizing. Html, css, php while dan foydalanib.
// include "shahmat_doskasi_2.php";


// 8) 1 kg konfetning narxi berilgan(haqiqiy son).
//  0.1, 0.2, 0.3 … 1 kg kofetning narxini ekranga chiqaring.
/*
echo "1 kg konfetning narxi: ";
$konfet_narh = trim(fgets(STDIN));
$konfet_narh = floatval($konfet_narh);

for ($i = 0.1; $i <= 1; $i += 0.1) {
    echo "$i kg konfetning narxi: " . $konfet_narh * $i . PHP_EOL;
}
echo PHP_EOL;
*/

// 9) 100 litrlik bochka bor. 3 va 4 litrlik chelaklar yordamida suv bilan to’ldirish kerak.
// 3 litrlik 3 sekundda to’ladi. 4litrlik chelak 4 sekundda to’ladi.
// Bochka nechi sekundda to’ladi?
// 3 va 4 litrlik chelaklardan nechtadan quyilganini ham aniqlansin. jo'mrak 2 ta
/*
// ketgan vaqtni hisoblash
function calculateFillingTime($bochkaVolume, $chelak1Volume, $chelak1Time, $chelak2Volume, $chelak2Time): array
{
    // umumiy siklda to'ldiriladigan suv hajmi
    $cycleTime = lcm($chelak1Time, $chelak2Time); // umumiy sikl vaqti
    $waterInCycle = ($cycleTime / $chelak1Time) * $chelak1Volume + ($cycleTime / $chelak2Time) * $chelak2Volume;

    // To'liq sikl
    $fullCycles = floor($bochkaVolume / $waterInCycle);
    $totalWater = $fullCycles * $waterInCycle;
    $totalTime = $fullCycles * $cycleTime;

    // yana to'ldirish kerak bo'lgan qoldiq hajmi
    $remainingWater = $bochkaVolume - $totalWater;

    // Qo'shimcha to'ldirish
    $chelak1Count = $fullCycles * ($cycleTime / $chelak1Time);
    $chelak2Count = $fullCycles * ($cycleTime / $chelak2Time);

    while ($remainingWater > 0) {
        if ($remainingWater >= $chelak1Volume && ($chelak1Time <= $chelak2Time || $remainingWater < $chelak2Volume)) {
            $remainingWater -= $chelak1Volume;
            $chelak1Count++;
            $totalTime += $chelak1Time;
        } else {
            $remainingWater -= $chelak2Volume;
            $chelak2Count++;
            $totalTime += $chelak2Time;
        }
    }

    return [
        'total_time' => $totalTime,
        'chelak1_count' => $chelak1Count,
        'chelak2_count' => $chelak2Count
    ];
}

// eng kichik umumiy karralini topish:
function lcm($a, $b): float|int
{
    return ($a * $b) / gcd($a, $b);
}

// eng katta umumiy bo'luvchini topish (ekub)
function gcd($a, $b)
{
    return $b ? gcd($b, $a % $b) : $a;
}

// Kiruvchi ma'lumotlar
$bochkaHajmi = 100; // boshka hajmi
$chelak1Hajmi = 3; // 1-chelak hajmi 3 litr
$chelak1Vaqti = 3; // 3 litrlik chelakning to'lish vaqti
$chelak2Hajmi = 4; // 2-chelak hajmi 4 litr
$chelak2Vaqti = 4; // 4 litrlik chelakning to'lish vaqti

$natija = calculateFillingTime($bochkaHajmi, $chelak1Hajmi, $chelak1Vaqti, $chelak2Hajmi, $chelak2Vaqti);

echo "Umumiy ketgan vaqt: " . $natija['total_time'] . " soniya\n";
echo "3-litrli chelak " . $natija['chelak1_count'] . " marta ishlatildi\n";
echo "4-litrli chelak " . $natija['chelak2_count'] . " marta ishlatildi\n";
*/

// 10) N son berilgan. Shu sonning raqamlari yig'indisini toping.
// N=12345 Natija:15
/*
echo "Natural son kiriting: ";
$n = intval(fgets(STDIN));

$sum = 0;

// birma-bir belgini funksiya orqali ajratib olish orqali
for ($i = 0; $i < strlen($n); $i++) {
    $temp = intval(substr($n, $i, 1));
    $sum += $temp;
//    echo substr($n, $i, 1) . PHP_EOL;
}
echo "1-Natija: $sum \n";
$sum = 0;

// universalroq usul:
while ($n) {
    // oxirgi raqamni olamiz:
    $tmp = $n % 10;

    // natijalarni tekshirib ko'rish uchun
//    echo "n = $n \t";
//    echo "tmp = $tmp \n";

    // keyin 1 xona oxirdan kamaytiramiz
    $n = $n / 10;

    // sonni butun qismini olamiz
    $n = intval($n);

    // yig'indiga qo'shib boramiz
    $sum += $tmp;
}
echo "2-Natija: $sum \n";
*/

//11) N son berilgan. Shuni teskarisini chiqaring. N=12345 Natija:54321
/*
echo "N: ";
$N = intval(fgets(STDIN));

echo "revers funksiya: " . intval(strrev($N)) . PHP_EOL;

echo "algoritmik usul: ";
while ($N) {
    $tmp = $N % 10;
    $N = intval($N / 10);
    echo $tmp;
}
echo PHP_EOL;
*/


// 12) 9 dan katta bo'lgan N soni berilgan.
// Sonning 1 - va oxirgi raqamlarini yigindisini aniqlang

/*
// fursatdan foydalanib adres olish & dan ham foydalanaylik
//$N = null;    bo'lsin/bo'lmasin baribir
kattaToqqiz($N);
//echo $N . PHP_EOL;  // tekshirib ko'rish

// 1-raqami:
$birinchi = birinchiRaqam($N);

// oxirgi raqami:
$oxirgi = oxirgiRaqam($N);

//echo "Birinchi raqam= $birinchi \n";
//echo "Oxirgi raqam= $oxirgi \n";

$sum = $birinchi + $oxirgi;

echo "1- va oxirgi raqamlar yig'indisi = $sum " . PHP_EOL;

function kattaToqqiz(&$N): void
{
    do {
        echo "9 dan katta son kiriting: ";
        $N = intval(fgets(STDIN));
    } while ($N < 10);
}

function birinchiRaqam($N): int
{
//    return $N[0];     // satrlar massivining 0-indexli elementi birinchi raqam
//  boshidan 1-raqamni qaytarish
    return intval(substr($N, 0, 1));

    // va yana sikl orqali ham xohlagan o'rindagi raqamni olish mumkin
}

function oxirgiRaqam($N): int
{
    return $N % 10;
}
*/

// 13) N son berilgan.
// Sonni raqamlarini so'zlarda yozing
// N=2345 Natija: ikki uch to'rt besh

// manfiy sonlarni ko'rsatmaydi!
/*
// raqam qabul qilish
enterNum($number);  // echo $number;

// so'zga o'tgan raqamlar nomini natijaga saqlaymiz
$natija = number_str($number);

echo $natija . PHP_EOL;

// faqat sonni qabul qiluvchi funksiya:
function enterNum(&$number): void
{
    do {
        echo "N sonini kiriting: ";
        $number = fgets(STDIN);
    } while (!is_numeric($number));
}

function number_str($number): string
{
    $str_ok = '';
    // indexlar noldan boshlab $number-1 da tugaydi!
    for ($i = 0; $i < strlen($number) - 1; $i++) {
        $str_ok .= raqamSatrda($number[$i]) . " ";
    }
    return $str_ok;
}

function raqamSatrda($number): string
{
    $sonlar = ["nol", "bir", "ikki", "uch", "tort",
        "besh", "olti", "yetti", "sakkiz", "toqqiz"
    ];
    return $sonlar[$number];
}
*/