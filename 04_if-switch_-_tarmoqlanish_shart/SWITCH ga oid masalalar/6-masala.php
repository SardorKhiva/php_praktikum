<?php

/*  6-masala.
Ikkita burj vaqtlarini aniqlovchi butun son berilgan.
D - kun. M - oy;
Misol: D=2; M=12; - bu degani 12->dekabr, 2->kun, 2-dekabr
Berilgan sana qaysi burjga kirishi aniqlansin.

BUZOQ BURJI (20.04-20.05)
EGIZAKLAR BURJI (21.05-21.06)
QISQICHBAQA BURJI (22.06-22.07)
ARSLON BURJI (23.07-23.08)
SUMBULA BURJI (24.08-23.09)
TAROZI BURJI (24.09-23.10)
CHAYON BURJI (24.10-22.11)
O’Q OTAR BURJI (23.11-22.12)
TOG’ ECHKISI BURJI (22.12-20.01)
QOVG’A BURJI (21.01-19.02)
BALIQ BURJI (20.02-20.03)
QO'Y BURJI ()21.03-19.04
 */

do {
    echo "Kunni kiriting: ";
    $d = intval(trim(readline()));
    echo "Oyni kiriting: ";
    $m = intval(trim(readline()));
} while (!($d > 0 && $d <= 31 && $m > 0 && $m <= 12));

$burj_nomi = null;

//BUZOQ BURJI (20.04-20.05)
$buzoq = ($m == 4 && $d >= 20) || ($m == 5 && $d <= 20);

//EGIZAKLAR BURJI (21.05-21.06)
$egizaklar = ($m == 5 && $d >= 21) || ($m == 6 && $d <= 21);

//QISQICHBAQA BURJI (22.06-22.07)
$qisqichbaqa = ($m == 6 && $d >= 22) || ($m == 7 && $d <= 22);

//ARSLON BURJI (23.07-23.08)
$arslon = ($m == 7 && $d >= 23) || ($m == 8 && $d <= 23);

//SUMBULA BURJI (24.08-23.09)
$sumbula = ($m == 8 && $d >= 24) || ($m == 9 && $d <= 23);

//TAROZI BURJI (24.09-23.10)
$tarozi = ($m == 9 && $d >= 24) || ($m == 10 && $d <= 23);

//CHAYON BURJI (24.10-22.11)
$chayon = ($m == 10 && $d >= 24) || ($m == 11 && $d <= 22);

//O’Q OTAR BURJI (23.11-22.12)
$oq_otar = ($m == 11 && $d >= 23) || ($m == 12 && $d <= 22);

//TOG’ ECHKISI BURJI (22.12-20.01)
$tog_echki = ($m == 12 && $d >= 22) || ($m == 1 && $d <= 20);

//QOVG’A BURJI (21.01-19.02)
$qovga = ($m == 1 && $d >= 21) || ($m == 2 && $d <= 19);

//BALIQ BURJI (20.02-20.03)
$baliq = ($m == 2 && $d >= 20) || ($d <= 20);

//QO'Y BURJI ()21.03-19.04
$qo_y = ($m == 3 && $d >= 21) || ($m == 4 && $d <= 19);

// kabisa yili ekanlikka tekshirish:
$kabisa = ($d == 29 && $m == 2);

switch ($m) {
    case 1: // dekabr-yanvar:
    {
        if ($tog_echki) $burj_nomi = "TOG' ECHKISI";
        if ($qovga) $burj_nomi = "QOVG'A";
        break;
    }
    case 2:
    {
        if ($d < 30 || $kabisa) {
            if ($baliq) $burj_nomi = "BALIQ";
        }
        if ($qovga) $burj_nomi = "QOVG'A";
        break;
    }
    case 3:
    {
        if ($d < 30 || $kabisa) {
            if ($baliq) $burj_nomi = "BALIQ";
        }
        if ($qo_y) $burj_nomi = "QO'Y";
        break;
    }
    case 4:
    {
        if ($d < 31) {
            if ($qo_y) $burj_nomi = "QO'Y";
            if ($buzoq) $burj_nomi = "BUZOQ";
        }
        break;
    }
    case 5:
    {
        if ($buzoq) $burj_nomi = "BUZOQ";
        if ($egizaklar) $burj_nomi = "EGIZAKLAR";
        break;
    }
    case 6:
    {
        if ($d < 31) {
            if ($egizaklar) $burj_nomi = "EGIZAKLAR";
            if ($qisqichbaqa) $burj_nomi = "QISQICHBAQA";
        }
        break;
    }
    case 7:
    {
        if ($qisqichbaqa) $burj_nomi = "QISQICHBAQA";
        if ($arslon) $burj_nomi = "ARSLON";
        break;
    }
    case 8:
    {
        if ($arslon) $burj_nomi = "ARSLON";
        if ($sumbula) $burj_nomi = "SUMBULA";
        break;
    }
    case 9:
    {
        if ($d < 31) {
            if ($sumbula) $burj_nomi = "SUMBULA";
            if ($tarozi) $burj_nomi = "TAROZI";
        }
        break;
    }
    case 10:
    {
        if ($tarozi) $burj_nomi = "TAROZI";
        if ($chayon) $burj_nomi = "CHAYON";
        break;
    }
    case 11:
    {
        if ($d < 31) {
            if ($chayon) $burj_nomi = "CHAYON";
            if ($oq_otar) $burj_nomi = "O'Q OTAR";
        }
        break;
    }
    case 12:
    {
        if ($oq_otar) $burj_nomi = "O'Q OTAR";
        if ($tog_echki) $burj_nomi = "TOG' ECHKISI";
        break;
    }
}

if ($burj_nomi != null) {
    echo "Burj nomi: ", strtolower($burj_nomi) . PHP_EOL;
}