<?php
$a = 10;
$b = 20;

echo ($a < $b) ?
    "$a $b dan kichik" :
    "$a $b dan katta" . PHP_EOL;
echo PHP_EOL;

echo ((true ? 'true' : false) ? 'rost' : 'yolgon');
echo PHP_EOL;

// php 7.X dan keyingi versiyalar uchun:
// agar $month ga qiymat berilmagan
// va null bo'lmasa 3 ni o'zlashtirsin
echo $month ?? 3;
//echo $month ? $month : 3;
