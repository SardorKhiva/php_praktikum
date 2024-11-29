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

function masala_01()
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
        echo "Son kiriting\n";
    }
    echo PHP_EOL;
}

function masala_02()
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
        echo "Son kiriting!\n";
    }
    echo PHP_EOL;
}

function masala_03()
{
    /*  3-masala.
    A va B sonlar berilgan.
    Jumlani rostlikka tekshiring: "A va B sonlarining yig`indisi 100 dan katta";
    Masalan:
    A = 43, B = 55; Natija: A va B sonlarining yig`indisi 100 dan katta emas
    A = 53, B = 55; Natija: A va B sonlarining yig`indisi 100 dan katta */


}

function masala_04()
{
    /*  4-masala.
    A, B, C sonlari berilgan. Jumlani rostlikka tekshiring:
    "C soni A va B sonlari orasida yotadi".
    Masalan:
    A = 4, B = 3, C = 6;  Natija: C soni A va B sonlari orasida yotmaydi
    A =2, B = 13, C = 6;  Natija: C soni A va B sonlari orasida yotadi. */

}

function masala_05()
{
    /*  5-masala.
    Ikkita A va B soni berilgan. Jumlani rostlikka tekshiring:
    "A va B sonlarining hech bo'lmaganda 1 tasi toq". */

}

function masala_06()
{
    /*  6-masala.
    Musbat butun son berilgan. Jumlani rostlikka tekshiring:
    "Berilgan son ikki xonali juft son"
    Masalan: A = 14 Natija: "Berilgan son ikki xonali juft son"
    A = 17 Natija: "Berilgan son ikki xonali juft son emas"
    A = 4 Natija: "Berilgan son ikki xonali juft son emas" */

}

function masala_07()
{
    /*  7-masala.
    Shaxmat doskasining X va Y koordinatalari berilgan.
    1-8 oraliqda yotuvchi sonlar. Doskaning chap pastki maydoni (1, 1) qora rang
    ekanligini bilgan holda, jumlani rostlikka tekshiring:
    "Berilgan (X, Y) maydon OQ rangda" */

}

function masala_08()
{
    /*  8-masala.
    Shaxmat doskasining ikkita turli (x1, y1) (x2, y2) koordinatalari berilgan.
    (1-8 oraliqda yotuvchi butun sonlar). Jumlani rostlikka tekshiring: 
    "Shoh bir yurishda bir maydondan ikkinchisiga o’ta oladi".  */

}

function masala_09()
{
    /*  9-masala.
    Shaxmat doskasining ikkita turli (x1, y1) (x2, y2) koordinatalari berilgan.
    (1-8 oraliqda yotuvchi butun sonlar). Jumlani rostlikka tekshiring:
    "Ot bir yurishda bir maydondan ikkinchisiga o’ta oladi".    */

}

function masala_10()
{
    /*  10-masala.
    Svetafor har soatning boshlanishida 3 minut yashil yonadi. Keyin 2 minut qizil
    yonadi. Keyin 3 minut sariq yonadi. Soatning N - daqiqasida svetafor qanday rangda?
        Misol: 44-daqiqada qizil, 56-daqiqada sariq. */

}