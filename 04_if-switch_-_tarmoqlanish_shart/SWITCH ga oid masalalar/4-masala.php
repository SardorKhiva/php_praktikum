<?php
/*  4-masala.
Eshmatda N so`m puli bor.
Bankomatga borib uni boshqa valyutaga almashtirmoqchi.
Eshmat ni puli valyutalar kursi bo`yicha hisoblansin.
Agar Eshmat Dollar ni tanlasa, dollar kursi bo`yicha, yevroni tanlasa yevro
kursi bo`yicha hisoblasin.
Dollar, Rubl, Euro, Tanga lardan bittasi bo`lishi mumkin.    */

/* 11.12.2024 holatiga:
USD / UZS
12 869,97

EUR / UZS
13547,48

RUB / UZS
128.21

KZT / UZS
25,33

CNY / UZS
1775,81

TRY / UZS
369,14

AED / UZS
3503,94

UAH / UZS
308,84

BYN / UZS
3933,88

THB / UZS
380,61

JPY / UZS
84,94

GEL / UZS
4588,23

GBP / UZS
16432,13

AZN / UZS
7570,57

KGS / UZS
148,27

TJS / UZS
1181,10
 */

    echo "Eshmatni so`mni kiriting: ";
    $pul = floatval(readline());

    echo "Eshmatni qaysi valyutani tanladi: \n";
    echo "1-dollar \t";
    echo "2-rubl \t";
    echo "3-euro \t";
    echo "4-tanga \n";
    $valyuta = intval(readline());

    $valyuta_nomi = null;
    $almashdi = null;       // almashgan valyuta qiymati

    switch ($valyuta) {
        case 1:    $valyuta_nomi = "dollar";  break;
        case 2:    $valyuta_nomi = "rubl";    break;
        case 3:    $valyuta_nomi = "yevro";   break;
        case 4:    $valyuta_nomi = "tanga";   break;
//        default:   $valyuta_nomi = "Bunday valyuta masala shartida yo'q, qaytdan urinib ko'ring\n";
    }

    if ($valyuta_nomi != null) {
        echo "Tanlangan valyuta: $valyuta_nomi\n";
    }
    switch ( $valyuta){
        case 1: $almashdi = $pul / 12_869.97; break;
        case 2: $almashdi = $pul / 128.21; break;
        case 3: $almashdi = $pul / 13_547.48; break;
        case 4: $almashdi = $pul / 25.33; break;
    }


    echo "Eshmatning dastlabki puli, so'mda: ";
    echo number_format($pul, 0, '.', ' ') . PHP_EOL;
    echo "Almashgan valyuta qiymati, {$valyuta_nomi}da: ";
    echo round($almashdi, 2);

echo $valyuta . PHP_EOL;