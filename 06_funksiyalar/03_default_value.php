<?php

function foo($a = 10): void
{
    echo $a . PHP_EOL;
}

// qiymat berilmasa default value - a = 10 bo'ladi
foo();

// aks holda a = 5;
foo(5);
echo PHP_EOL . PHP_EOL;
//function sms1($a = 10, $b = 20, $c)
//{
//    echo $a . PHP_EOL;
//    echo $b . PHP_EOL;
//    echo $c . PHP_EOL;
//}
// default value ni oxirda qo'yish kerak, chunki,
// o'zgaruvchi chapdan initsializatsiya bo'lib keladi
// bu yerda a = 6 deb o'ylaydi interpretator:
// sms(6);

//function sms2($a, $b = 20, $c = 30)
// bu usul ham ishlaydi, lekin tavsiya qilinmaydi:
function sms2($a, $b = 20, $c)
{
    echo "sms2(): " . PHP_EOL;
    echo $a . PHP_EOL;
    echo $b . PHP_EOL;
    echo $c . PHP_EOL;
}
sms2(7, 3, 4);