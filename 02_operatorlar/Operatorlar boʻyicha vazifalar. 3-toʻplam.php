<?php

/* Operatorlar boʻyicha vazifalar. 3-toʻplam.
1-masala.
Xonangizni oboyini almashtirmoqchisiz.
Xonaning balandligi 2.7m. Tomonlari 5m va 3 m.
1 ta rulon oboy 10 m, eni 1.15.
Bozordan faqat butun rulonli oboy olish mumkin.
Xonanin oboylash uchun: - nechta rulon oboy kerak;
- eni 1.15 bo'lgan oboydan qancha metr oboy ketadi.
*/
echo "\t1-masala:\n";
$xona_balandligi = 2.7;
$xona_x = 5;
$xona_y = 3;
$oboy_eni = 1.15;
$oboy_boyi = 10;
$xona_yuza = ($xona_balandligi * $xona_x * 2) + ($xona_balandligi * $xona_y * 2);
$bir_oboy_yuzasi = $oboy_eni * $oboy_boyi;
$rulon_soni = ceil($xona_yuza / $bir_oboy_yuzasi);
$metr_rulon = $rulon_soni * $oboy_boyi;

echo "Rulonlar soni = " . $rulon_soni . PHP_EOL;
echo "$metr_rulon metr rulon ketadi" . PHP_EOL;
echo PHP_EOL;

/* 2-masala.
Xonaning balandligi 2.7m. Xonaning tomonlari 5m va 3 m.
1 ta g`ishtning balandli 10 sm, uzunli 25sm, eni 12sm.
Oynasi va eshiki yo`q bo`lgan xonani,
faqat devorlarini g`ishtdan terish uchun
nechta g`isht kerak bo`ladi.
Devorning qalinligi : 25sm.
G`isht orasiga qo`yiladigan loyning o`lchamlari hisobga olinmasin. */
echo "\t2-masala:\n";
$xona_yuzasi = (2.7 * 5 * 2) + (2.7 * 3 * 2);
$karuch_yuza = 0.1 * 0.12; // 1 g'isht manglayi - bosh qismi yuzasi
$karuch_soni = $xona_yuza / $karuch_yuza;
echo "Xona jami yuzasi: " . $xona_yuzasi . PHP_EOL;
echo "G'ishtlar soni = " . $karuch_soni . PHP_EOL;


/* 3-masala.
Hafta kunlari quyidagicha tartibda berilgan:
0 - yakshanba   1 - dushanba    2 - seshanba    3 - chorshanba
4 - payshanba   5 - juma    6 - shanba
1-365  oraliqda yotuvchi K soni berilgan. Agar 1-yanvar dushanba bo`lsa,
berilgan K - kun, haftaning qaysi kuniga to`g`ri keladi. */
echo "\n\t3-masala:\n";
$yil_kuni = "";

do {
    echo "\nDasturni tugatish uchun 0 ni kiriting\n";
    echo "Yil kuni K ni kiriting: ";
    enter($yil_kuni);
} while ($yil_kuni !== "0");
function enter(&$yil_kuni)
{
    // ma'lumot kiritish:
    $yil_kuni = trim(fgets(STDIN));

    // agar yil kuni 0 bo'lsa funksiya sinsin, tugasin:
    if ($yil_kuni === 0) {
        return;
    }

    // yil kuni 1 - 365 oraliqda ekanligini aniqlash:
    if (is_numeric($yil_kuni)) {
        if ($yil_kuni > 0 && $yil_kuni < 366) {
            // yil kuni haftani qaysi kuniga to'g'ri kelishini aniqlash:
            $hafta_kuni = $yil_kuni % 7;


            switch ($hafta_kuni) {
                case 0:
                    echo "Yakshanba";
                    break;
                case 1:
                    echo "Dushanba";
                    break;
                case 2:
                    echo "Seshanba";
                    break;
                case 3:
                    echo "Chorshanba";
                    break;
                case 4:
                    echo "Payshanba";
                    break;
                case 5:
                    echo "Juma";
                    break;
                case 6:
                    echo "Shanba";
                    break;
            }
            echo PHP_EOL;
        }
    }
}