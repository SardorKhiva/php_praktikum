<?php

// mantiqiy ko'paytirish, && AND:
$a = 10;
echo ($a > 0) && ($a < 10) ?
    "$a soni 0 va 10 orasida " :
    "$a soni  0 va 10 orasida emas" . PHP_EOL;

// mantiqiy qo'shish, || OR:
$b = 1;
echo ($b > 10) || ($b < 0) ?
    "$b soni 0 va 10 orasida emas" :
    "$b soni 0 va 10 orasida " . PHP_EOL;

// mantiqiy inkor, !
if ( !($b > 10) )
{
    echo "$b soni 10 dan katta emas" . PHP_EOL;
}