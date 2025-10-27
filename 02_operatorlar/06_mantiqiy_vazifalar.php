<?php

// 1-masala:
$a = 2;
echo ($a % 2 != 0) ? "toq" : "juft" . PHP_EOL;
echo PHP_EOL;

// 2-masala:
$a = 5;
$b = 3;
echo ($a > $b) ? "$a $b dan katta" : "$a $b dan kichik" . PHP_EOL;
echo PHP_EOL;

// 3-masala:
$a = 95;
$b = 13;
echo ($a + $b) ? "$a + $b ning yig'indisi 100 dan katta " : "$a + $b ning yig'indisi 100 dan kichik" . PHP_EOL;
echo PHP_EOL;

// 4-masala:
// && - AND - VA - mantiqiy ko'paytirish:
// true && true = true
// false && true = false
// true && false = false
// false || false = false

// || - OR - YOKI - mantiqiy qo'shish:
// true || true = true
// true || false = true
// false || true = true
// false || false = false
$A = true;
$B = false;
$C = true;
$D = false;
var_dump(($A && $B) || ($C && $D) && ($A || $B));
//             (1 && 0 ) || ( 1 && 0 ) && ( 1 || 0 )
//                0      ||     0      &&     1
//                              0

$a = 2 > 1;     // true
$b = 3 < 1;     // false
$c = 5 > 3;     // true
$d = 10 > 20;   // false
// false   || false      &&    true
var_dump($a && $b) || ($c && $d) && ($a || $b);
var_dump(false || false && true);
// false

// 5-masala:
$A = 1;
$C = 2;
$B = 3;
// 1 < 2 && 2 < 3
echo ($A < $C && $C < $B) ?
    "$C soni $A va $B ning orasidaligi rost" :
    "$C soni $A va $B ning orasidaligi yolg'on" . PHP_EOL;
echo PHP_EOL;
echo PHP_EOL;


// 6-masala:
$A = 2;
$B = 2;
echo ($A % 2 == 1 || $B % 2 == 1) ?
    "Hech bo'lmaganda 1 tasi toq" :
    "Hammasi juft";
echo PHP_EOL;
echo PHP_EOL;

// 7-misol:
$son = 98;
echo ($son > 9 && $son < 100 && $son % 2 == 0) ?
    "$son soni 2 xonali juft son" :
    "$son soni 2 xonali juft son emas";
echo PHP_EOL;
echo PHP_EOL;

