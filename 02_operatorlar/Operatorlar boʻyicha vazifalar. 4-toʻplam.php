<?php

echo "1 - 10 oraliqdagi masalalardan birini tanlang: ";
$num = trim(fgets(STDIN));
switch ($num) {
    case 1:
    {
        masala_01();
        break;
    }
    case 2:
    {
        masala_02();
        break;
    }
    case 3:
    {
        masala_03();
        break;
    }
    case 4:
    {
        masala_04();
        break;
    }
    case 5:
    {
        masala_05();
        break;
    }
    case 6:
    {
        masala_06();
        break;
    }
    case 7:
    {
        masala_07();
        break;
    }
    case 8:
    {
        masala_08();
        break;
    }
    case 9:
    {
        masala_09();
        break;
    }
    case 10:
    {
        masala_10();
        break;
    }

    default:
    {
        echo "Bunday masala yo'q!\n";
    }
}

function masala_01(): void
{
    /*  1-masala.
    A butun son. Jumlani rostlikka tekshiring. "A toq son";
    Masalan:
    A = 15; Natija: "A toq son";
    A = 14; Natija: "A toq son emas"; */
    echo "\t1-masala:\n";
    echo "Son kiriting: ";
    $a = trim(fgets(STDIN));
    if (is_numeric($a)) {
        echo ($a % 2 == 1) ? "$a toq son" : "$a juft son";
    } else {
        echo "Son kiriting!\n\n";
        masala_01();
    }
    echo PHP_EOL;
}

function masala_02(): void
{
    /*  2-masala.
    A va B sonlar berilgan. Jumlani rostlikka tekshiring: "A son B sondan katta"
    Masalan:
    A = 13, B = 14 Natija: A son B sondan katta emas
    A = 23, B = 14 Natija: A son B sondan katta */

    echo "\t2-masala:\n";
    echo "2 ta son kiriting: ";
    $a = trim(fgets(STDIN));
    $b = trim(fgets(STDIN));

    if (is_numeric($a) && is_numeric($b)) {
        echo ($a > $b) ? "$a katta $b dan" : "$b katta $a dan";
    } else {
        echo "Son kiriting!\n\n";
        masala_02();
    }
    echo PHP_EOL;
}

function masala_03(): void
{
    /*  3-masala.
    A va B sonlar berilgan.
    Jumlani rostlikka tekshiring: "A va B sonlarining yig`indisi 100 dan katta";
    Masalan:
    A = 43, B = 55; Natija: A va B sonlarining yig`indisi 100 dan katta emas
    A = 53, B = 55; Natija: A va B sonlarining yig`indisi 100 dan katta */
    echo "\t3-masala:\n";
    echo "2 ta son kiriting: ";
    $a = trim(fgets(STDIN));
    $b = trim(fgets(STDIN));

    if (is_numeric($a) && is_numeric($b)) {
        echo ($a + $b > 100) ?
            "$a + $b 100 dan katta" :
            "$a + $b 100 dan katta emas";
    } else {
        echo "Son kiriting!\n\n";
        masala_03();
    }
    echo PHP_EOL;
}

function masala_04(): void
{
    /*  4-masala.
    A, B, C sonlari berilgan. Jumlani rostlikka tekshiring:
    "C soni A va B sonlari orasida yotadi".
    Masalan:
    A = 4, B = 3, C = 6; Natija: C soni A va B sonlari orasida yotmaydi
    A =2, B = 13, C = 6; Natija: C soni A va B sonlari orasida yotadi. */
    echo "\t4-masala:\n";
    echo "3 ta son kiriting: \n";
    $a = trim(fgets(STDIN));
    $b = trim(fgets(STDIN));
    $c = trim(fgets(STDIN));
    if (is_numeric($a) && is_numeric($b) && is_numeric($c)) {
        echo ($a < $c && $c < $b) ?
            "$c soni $a va $b orasida yotadi" :
            "$c soni $a va $b orasida yotamaydi";
    } else {
        echo "Son kiriting!\n\n";
        masala_04();
    }
    echo PHP_EOL;
}

function masala_05(): void
{
    /*  5-masala.
    Ikkita A va B soni berilgan. Jumlani rostlikka tekshiring:
    "A va B sonlarining hech bo'lmaganda 1 tasi toq". */
    echo "\t5-masala:\n";
    echo "2 ta son kiriting: ";
    $a = trim(fgets(STDIN));
    $b = trim(fgets(STDIN));

    if (is_numeric($a) && is_numeric($b)) {
        echo ($a % 2 == 1 || $b % 2 == 1) ?
            "$a va $b sonlarning hech bo'lmaganda birisi toq" :
            "$a va $b sonlarning birisi ham toq emas";
    } else {
        echo "Son kiriting!\n\n";
        masala_05();
    }
    echo PHP_EOL;
}

function masala_06(): void
{
    /*  6-masala.
    Musbat butun son berilgan. Jumlani rostlikka tekshiring:
    "Berilgan son ikki xonali juft son"
    Masalan: A = 14 Natija: "Berilgan son ikki xonali juft son"
    A = 17 Natija: "Berilgan son ikki xonali juft son emas"
    A = 4 Natija: "Berilgan son ikki xonali juft son emas" */

    echo "\n6-masala:\n";
    echo "Son kiriting: ";
    $a = trim(fgets(STDIN));
    if (is_numeric($a)) {
        echo ($a > 9 && $a < 100 && $a % 2 == 0) ?
            "$a soni 2 xonali juft son" :
            "$a soni 2 xonali juft son emas";
    } else {
        echo "Son kiriting!\n\n";
    }
    echo PHP_EOL . PHP_EOL;
    masala_06();
    echo PHP_EOL . PHP_EOL;
}

function masala_07(): void
{
    /*  7-masala.
    Shaxmat doskasining X va Y koordinatalari berilgan.
    1-8 oraliqda yotuvchi sonlar.
    Doskaning chap pastki maydoni (1, 1) qora rang
    ekanligini bilgan holda, jumlani rostlikka tekshiring:
    "Berilgan (X, Y) maydon OQ rangda" */
    echo "\n\t7-masala:\n";

    // shaxmat doskasini qo'shib ko'rmoqchi edim,
    // trim(fgets(STDIN)) funksiyalari brauzerda emas console da ishlagani uchun html bilan birga ishlamadi:
    // html forma qo'shsa ham bo'lardi lekin ish ko'payib ketardi.
    //require "shahmat_doskasi.php";
    echo "Shaxmat doskasi figurasi x:y koordinatasini kiriting: ";
    $x = trim(fgets(STDIN));
    $y = trim(fgets(STDIN));

    // agar son kiritilgan bo'lsa:
    if (is_numeric($x) && is_numeric($y)) {
        // x y dan bittasi 0 bo'lsa:
        if ($x == 0 || $y == 0) {
            return;     // funksiya qytsin, tugasin.
        }
    }

    // figura to'g'ri joydaligini tekshirish:
    if ($x > 0 && $y > 0 && $x < 9 && $y < 9) {
        echo (($x + $y) % 2 == 0) ?
            "Berilgan ($x, $y) maydon QORA rangda" :
            "Berilgan ($x, $y) maydon OQ rangda";
    } else {
        echo "Siz shaxmat doskasidan chiqib ketdinggiz, qaytadan boshlang!\n\n";
    }
    echo PHP_EOL . PHP_EOL;
    masala_07();
}

function masala_08(): void
{
    /*  8-masala.
    Shaxmat doskasining ikkita turli (x1, y1) (x2, y2) koordinatalari berilgan.
    (1-8 oraliqda yotuvchi butun sonlar). Jumlani rostlikka tekshiring:
    "Shoh bir yurishda bir maydondan ikkinchisiga o’ta oladi".  */

    echo "\n\t8-masala:\n";

    echo "X1 koordinatani kiriting: ";
    $x1 = trim(fgets(STDIN));

    echo "Y1 koordinatani kiriting: ";
    $y1 = trim(fgets(STDIN));

    echo "X2 koordinatani kiriting: ";
    $x2 = trim(fgets(STDIN));

    echo "Y2 koordinatani kiriting: ";
    $y2 = trim(fgets(STDIN));

    // raqam ekanligiga tekshirish:
    if (is_numeric($x1) && is_numeric($x2) &&
        is_numeric($y1) && is_numeric($y2)) {

        // figura 0 va 9 orasidaligini tekshirish:
        if ($x1 > 0 && $y1 > 0 &&
            $y1 < 9 && $y2 < 9) {
            // bu yerda figura yurmasligi ham mumkin shuning uchun <= 1 agar yursa == 1:
            if (abs($x1 - $x2) <= 1 && abs($y1 - $y2) <= 1) {
                echo "Shoh 1 yurishda 1 maydondan 2-siga o’ta oladi";
            } else {
                echo "Shoh 1 yurishda 1 maydondan 2-siga o’ta olmaydi";
            }
        }
    }
    echo PHP_EOL . PHP_EOL;
    masala_08();
}

function masala_09(): void
{
    /*  9-masala.
    Shaxmat doskasining ikkita turli (x1, y1) (x2, y2) koordinatalari berilgan.
    (1-8 oraliqda yotuvchi butun sonlar). Jumlani rostlikka tekshiring:
    "Ot bir yurishda bir maydondan ikkinchisiga o’ta oladi".    */

    echo "\n\t9-masala:\n";
    // dastlabki, oldingi joylashuvi:
    echo "Otning dastlabki gorizontal joylashgan o'rnini(1 - 8) kiriting: ";
    $x1 = trim(fgets(STDIN));
    echo "Otning dastlabki vertikal joylashgan o'rnini(1 - 8) kiriting: ";
    $y1 = trim(fgets(STDIN));

    // keyingi, yurgandan keyingi joylashuvi:
    echo "Otning keyingi gorizontal joylashgan o'rnini(1 - 8) kiriting: ";
    $x2 = trim(fgets(STDIN));
    echo "Otning keyingi vertikal joylashgan o'rnini(1 - 8) kiriting: ";
    $y2 = trim(fgets(STDIN));

    // son ekanligini tekshirish:
    if (is_numeric($x1) && is_numeric($x2) && is_numeric($y1) && is_numeric($y2)) {
        // console bo\lgani uchun 1 - 8 chegarada ekanligini tekshirish:
        // yoki abs() orqali chegarasiz shaxmat doskasi qilsak ham bo'lardi...
        if (($x1 > 0 && $y1 > 0 && $x2 > 0 && $y2 > 0) &&
            ($x1 < 9 && $x2 < 9 && $y1 < 9 && $y2 < 9)) {
            if (abs($x1 - $x2) === 2 && abs($y1 - $y2) === 1 ||
                abs($x1 - $x2) === 1 && abs($y1 - $y2) === 2) {
                echo "Ot 1 yurishda 1 maydondan 2-siga o’ta oladi";
            } else {
                echo "Ot 1 yurishda 1 maydondan 2-siga o’ta olmaydi";
            }
        }
    }
    masala_09();
    echo PHP_EOL . PHP_EOL;
}

function masala_10(): void
{
    /*  10-masala.
    Svetafor har soatning boshlanishida 3 minut yashil yonadi. Keyin 2 minut qizil
    yonadi. Keyin 3 minut sariq yonadi. Soatning N - daqiqasida svetafor qanday rangda?
    Misol: 44-daqiqada qizil, 56-daqiqada sariq. */
    echo "\n\t10-masala:\n";

//    $yashil = 3;    $qizil = 2;    $sariq = 3; 3 + 2 + 3 = 8

    echo "Soatning N-daqiqasini kiriting: ";
    $N = trim(fgets(STDIN));

    echo match ($N % 8) {
        1, 2, 3 => "Svetofor yashil rangda",
        4, 5 => "Svetofor qizil rangda",
        default => "Svetofor sariq rangda",
    };

    echo PHP_EOL . PHP_EOL;
    masala_10();

    /* juda sodda jadval, tekshirish juda oson bo'lishi uchun:
    1 - 2 - 3    : yashil
    4 - 5        : qizil
    6 - 7 - 8    : sariq

    9 - 10 - 11  : yashil
    12 - 13      : qizil
    14 - 15 - 16 : sariq

    17 - 18 - 19 : yashil
    20 - 21      : qizil
    22 - 23 - 24 : sariq

    25 - 26 - 27 : yashil
    28 - 29      : qizil
    30 - 31 - 32 : sariq

    33 - 34 - 35 : yashil
    36 - 37      : qizil
    38 - 39 - 40 : sariq

    41 - 42 - 43 : yashil
    44 - 45      : qizil
    46 - 47 - 48 : sariq

    49 - 50 - 51 : yashil
    52 - 53      : qizil
    54 - 55 - 56 : sariq

    57 - 58 - 59 : yashil
    1 - 2        : qizil
    2 - 3 - 4    : sariq
    */
}