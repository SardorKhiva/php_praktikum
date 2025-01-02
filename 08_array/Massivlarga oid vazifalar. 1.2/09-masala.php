<?php
// 9-masala. ”2019-12-03 12:35:43”
// - Ushbu matnni quyidagi ko’rinishda yozing:
// “3-dekabr, 2019-yil, soat 12 dan 35 daqiqayu, 43 soniya o’tdi”

$yil = $oy = $kun = null;
$soat = $daqiqa = $soniya = null;

$correct_month = $correct_day = false;
$oy_nomi = null;
$currentYear = intval(date("Y"));
/*
$currentMonth = intval(date("n"));
$currentDay = intval(date("j"));

$currentHour = intval(date("H")) + 5;   // GMT +5 bizni vaqt
$currentMinute = intval(date("i"));
$currentSecond = intval(date("s"));

//echo $currentYear . '-' . $currentMonth . '-' . $currentDay;
echo $currentHour . ":" . $currentMinute . ":" . $currentSecond . PHP_EOL;
*/

do {
    echo "Yil: ";
    $yil = intval(trim(readline()));
} while ((is_numeric($yil) && ($yil <= 0)));


do {
    echo "Oy: ";
    $oy = trim(intval(readline()));
} while (!(is_numeric($oy) && $oy >= 1 && $oy <= 12));
$oy_nomi = getMonthName($oy);

// 28 va 31 kunlik oy deb yozilgan, 29, 30 kunlar reliz versiyada bo'ladi
do {
    echo "Kun: ";
    $kun = trim(intval(readline()));
    if ($oy !== 2) {
        if ($kun >= 1 && $kun <= 31) {
            $correct_day = true;
        }
    } else {
        if ($kun >= 1 && $kun <= 28) {
            $correct_day = true;
        }
    }
} while (!(is_numeric($kun) && $correct_day));

do {
    echo "Soat: ";
    $soat = trim(intval(readline()));
} while (is_numeric($soat) && !($soat >= 0 && $soat <= 23));

do {
    echo "Daqiqa: ";
    $daqiqa = trim(intval(readline()));
} while (is_numeric($daqiqa) && !($daqiqa >= 0 && $daqiqa <= 59));

do {
    echo "Soniya: ";
    $soniya = trim(intval(readline()));
} while (is_numeric($soniya) && !($soniya >= 0 && $soniya <= 59));

// “3-dekabr, 2019-yil, soat 12 dan 35 daqiqayu, 43 soniya o’tdi”
$vaqt = "$oy-$oy_nomi, $yil-yil, soat $soat dan $daqiqa daqiqayu, $soniya soniya o'tdi \n";

echo $vaqt;


function getMonthName(int $oy): string
{
    return match ($oy) {
        1 => "yanvar",
        2 => "fevral",
        3 => "mart",
        4 => "aprel",
        5 => "may",
        6 => "iyun",
        7 => "iyul",
        8 => "avgust",
        9 => "sentyabr",
        10 => "oktyabr",
        11 => "noyabr",
        12 => "dekabr",
        default => ""
    };
}
