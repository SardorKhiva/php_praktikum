<?php
/*      // SWITCH NI ICHIDA IF LAR ORQALI ONAT TILI QOIDALARIGA XOS QILIB ISHLAB CHIQISHIM KERAK,
        // ONA TILIMIZ QOIDALARIGA TO'LIQ MOS TUSHISHI UCHUN SWITCH LARNI ICHINI IF LAR BILAN TO'LDIRIB CHIQISHIM KERAK
        // VAQTDAN YUTQAZMASLIK UCHUN IF NI KEYINROQ YOZAMIZ...
 * 3-masala.
 * Berilgan son (1 dan 999 999 gacha bo`lgan sonlar) ni
 * so`zlarda ifodalang.
 */

$son = 0;


    // qo'lda kiritish:
/*
 do {
    echo "1 - 1 000 000 oraliqdagi sonni kiriting: ";
    $son = intval(trim(readline()));
} while ($son < 0 && $son > 1_000_000);
*/
    $son = rand(1, 1_000_000);
echo number_format($son, 0, '.', ' ') . PHP_EOL;
    $bir_str = $on_str = $yuz_str =
$ming_str = $onMing_str = $yuzMing_str = $mln_str = null;

/*
// matematik usulda har bir xona raqamini olish,
// qonuniyat orqali for sikl ochsa ham bo'ladi:
$bir = $son % 10;
$on = (int)($son / 10) % 10;
$yuz = (int)($son / 100) % 10;
$ming = (int)($son / 1_000) % 10;
$on_ming = (int)($son / 10_000) % 10;
$yuz_ming = (int)($son / 100_000) % 10;
$mln = (int)($son / 1_000_000) % 10;
*/

// massiv sikldan tashqarida ham ishlashi(ko'rinishi) uchun tashqarida e'lon qilib init qilamiz:
$xonalar[0] = 0;

for ($i = 1; $i <= strlen($son); $i++) {
    // sondan oxiridan boshlab bir xonadan raqmlarni alohida massiv elementlariga olib chiqamiz,
    // oxirdan, yani birlar xonasidan boshlaymiz, boshidan boshlamaymiz,
    // chunki chap tarafdan boshlasak ko'p xonali sonlarni xato o'qiydi
    $xonalar[$i] = substr($son, -$i, 1);
}

// 1-elementni o'chiramiz,
unset($xonalar[0]);

// xonadagi raqamlarni tekshirib ko'ramiz:
print_r(array_reverse($xonalar));

echo "\n So'zlarda:\n";

/*
for ($i = 0; $i < count($xonalar); $i++)
{
    if ($xonalar[$i] == 0) {
        unset($xonalar[$i]);
    }
    else {
        echo $xonalar[$i] . "\t";
    }
}
*/

/*
echo "1 = $bir\n";
echo "10 = $on\n";
echo "100 = $yuz\n";
echo "1 000 = $ming\n";
echo "10 000 = $on_ming\n";
echo "100 000 = $yuz_ming\n";
echo "1 000 000 = $mln\n";
*/

// 1 - 9
if (isset($xonalar[1])) {
    switch ($xonalar[1]) {
        case 1:
            $bir_str = 'bir';
            break;
        case 2:
            $bir_str = 'ikki';
            break;
        case 3:
            $bir_str = 'uch';
            break;
        case 4:
            $bir_str = 'to\'rt';
            break;
        case 5:
            $bir_str = 'besh';
            break;
        case 6:
            $bir_str = 'olti';
            break;
        case 7:
            $bir_str = 'yetti';
            break;
        case 8:
            $bir_str = 'sakkiz';
            break;
        case 9:
            $bir_str = 'to\'qqiz';
            break;
    }
}

// 10 - 90
if (isset($xonalar[2])) {
    switch ($xonalar[2]) {
        case 1:
            $on_str = 'o\'n';
            break;
        case 2:
            $on_str = 'yigirma';
            break;
        case 3:
            $on_str = 'o\'ttiz';
            break;
        case 4:
            $on_str = 'qirq';
            break;
        case 5:
            $on_str = 'ellik';
            break;
        case 6:
            $on_str = 'oltmish';
            break;
        case 7:
            $on_str = 'yetmish';
            break;
        case 8:
            $on_str = 'sakson';
            break;
        case 9:
            $on_str = 'to\'qson';
            break;
    }
}

// 100 - 900
if (isset($xonalar[3])) {
    switch ($xonalar[3]) {
        case 1:
            $yuz_str = 'yuz';
            break;
        case 2:
            $yuz_str = 'ikki yuz';
            break;
        case 3:
            $yuz_str = 'uch yuz';
            break;
        case 4:
            $yuz_str = 'to\'rt yuz';
            break;
        case 5:
            $yuz_str = 'besh yuz';
            break;
        case 6:
            $yuz_str = 'olti yuz';
            break;
        case 7:
            $yuz_str = 'yetti yuz';
            break;
        case 8:
            $yuz_str = 'sakkiz yuz';
            break;
        case 9:
            $yuz_str = 'to\'qqiz yuz';
            break;
    }
}

// 1 000 - 9 000
if (isset($xonalar[4])) {
    switch ($xonalar[4]) {
        case 1:
            $ming_str = 'ming';
            break;
        case 2:
            $ming_str = 'ikki ming';
            break;
        case 3:
            $ming_str = 'uch ming';
            break;
        case 4:
            $ming_str = 'to\'rt ming';
            break;
        case 5:
            $ming_str = 'besh ming';
            break;
        case 6:
            $ming_str = 'olti ming';
            break;
        case 7:
            $ming_str = 'yetti ming';
            break;
        case 8:
            $ming_str = 'sakkiz ming';
            break;
        case 9:
            $ming_str = 'to\'qqiz ming';
            break;
    }
}

// 10 000 - 90 000
if (isset($xonalar[5])) {
    switch ($xonalar[5]) {
        case 1:
            $onMing_str = "o'n ming";
            break;
        case 2:
            $onMing_str = "yigirma ming";
            break;
        case 3:
            $onMing_str = "o'ttiz ming";
            break;
        case 4:
            $onMing_str = "qirq ming";
            break;
        case 5:
            $onMing_str = "ellik ming";
            break;
        case 6:
            $onMing_str = "oltmish ming";
            break;
        case 7:
            $onMing_str = "yetmish ming";
            break;
        case 8:
            $onMing_str = "sakson ming";
            break;
        case 9:
            $onMing_str = "to'qson ming";
            break;
    }
}

// 100 000 - 900 000
if (isset($xonalar[6])) {
    switch ($xonalar[6]) {
        case 1:
            if ($xonalar[6] == 10 ** 5) { $yuzMing_str = "yuz ming"; }
            else { $yuzMing_str = "bir yuz ming"; }
            break;
        case 2:
            $yuzMing_str = "ikki yuz ming";
            break;
        case 3:
            $yuzMing_str = "uch yuz ming";
            break;
        case 4:
            $yuzMing_str = "to'rt yuz ming";
            break;
        case 5:
            $yuzMing_str = "besh yuz ming";
            break;
        case 6:
            $yuzMing_str = "olti yuz ming";
            break;
        case 7:
            $yuzMing_str = "yetti yuz ming";
            break;
        case 8:
            $yuzMing_str = "sakkiz yuz ming";
            break;
        case 9:
            $yuzMing_str = "to'qqiz yuz ming";
            break;
    }
}

// 1 000 000 - 9 000 000
if (isset($xonalar[7])) {
    switch ($xonalar[7]) {
        case 1:
            $mln_str = "bir million";
            break;
        case 2:
            $mln_str = "ikki million";
            break;
        case 3:
            $mln_str = "uch million";
            break;
        case 4:
            $mln_str = "to'rt million";
            break;
        case 5:
            $mln_str = "besh million";
            break;
        case 6:
            $mln_str = "olti million";
            break;
        case 7:
            $mln_str = "yetti million";
            break;
        case 8:
            $mln_str = "sakkiz million";
            break;
        case 9:
            $mln_str = "to'qqiz million";
            break;
    }
}


if (isset($mln_str)) {
    echo $mln_str . ' ';
}
if (isset($yuzMing_str)) {
    echo $yuzMing_str . ' ';
}
if (isset($onMing_str)) {
    echo $onMing_str . ' ';
}
if (isset($ming_str)) {
    echo $ming_str . ' ';
}

if (isset($yuz_str)) {
    echo $yuz_str . ' ';
}
if (isset($on_str)) {
    echo $on_str . ' ';
}
if (isset($bir_str)) {
    echo $bir_str . ' ';
}

echo PHP_EOL;