<?php

function login()
{
    $x = 20;    // local variable
    echo $x , PHP_EOL;
}

login();
$x = 25; // global variable
echo $x , PHP_EOL;

function login2()
{
    global $y;  // global o'zgaruvchidan funksiya ichida foydalanish
    $y += 10;   // tashqarida ham o'zgaradi
    echo $y , PHP_EOL;
}

$y = 18;
login2();
echo PHP_EOL;

// static o'zgaruvchilar

function login3()
{
    $z = 10;
    $z += 15;
    echo $z, PHP_EOL;
}
login3();   // 25
login3();   // 25
echo PHP_EOL;

function login4()
{
    static $w = 25;  // static o'zgaruvchi - php skript ishlash davomida o'chmay turadi
    echo $w, PHP_EOL;
    $w *= 2;
}
login4();  // 25
login4();  // 50