<?php
// is_null - o'zgaruvchi null yoki NULL
// bo'lsa true aks holda false
/*
$a = null;      // true
$b = NULL;      // true, boshqa barcha holatda falsa
$c = '';
$d = "";
$e = ' ';
$f = " ";
$g = 1;
$h = 1.1;
$i = '1.1';
$j = "1.1";
$k = true;
$l = false;
$m = 0;
$n = 'null';
$p = "NULL";

print 'is_null(' . $a . ') = ';
var_dump(is_null($a)) . PHP_EOL;

print 'is_null(' . $b . ') = ';
var_dump(is_null($b)) . PHP_EOL;

print 'is_null(' . $c . ') = ';
var_dump(is_null($c)) . PHP_EOL;

print 'is_null(' . $d . ') = ';
var_dump(is_null($d)) . PHP_EOL;

print 'is_null(' . $e . ') = ';
var_dump(is_null($e)) . PHP_EOL;

print 'is_null(' . $f . ') = ';
var_dump(is_null($f)) . PHP_EOL;

print 'is_null(' . $g . ') = ';
var_dump(is_null($g)) . PHP_EOL;

print 'is_null(' . $h . ') = ';
var_dump(is_null($h)) . PHP_EOL;

print 'is_null(' . $i . ') = ';
var_dump(is_null($i)) . PHP_EOL;


print 'is_null(' . $j . ') = ';
var_dump(is_null($j)) . PHP_EOL;

print 'is_null(' . $k . ') = ';
var_dump(is_null($k)) . PHP_EOL;

print 'is_null(' . $l . ') = ';
var_dump(is_null($l)) . PHP_EOL;

print 'is_null(' . $m . ') = ';
var_dump(is_null($m)) . PHP_EOL;

print 'is_null(' . $n . ') = ';
var_dump(is_null($n)) . PHP_EOL;

print 'is_null(' . $p . ') = ';
var_dump(is_null($p)) . PHP_EOL;
*/

// empty - o'zgaruvchi qiymati bo'sh/emaslikka tekshiradi
// Возвращает true, если переданная в параметр var
// переменная не существует,
// содержит пустое значение или равно нулю,
// то есть ложно.
// В остальных случаях возвращает false.
// empty() — это краткий эквивалент конструкции
// !isset($var) || $var == false.
/*
echo 'empty(null) = ';
var_dump(empty(null)) . PHP_EOL;    // true

echo 'empty(NULL) = ';
var_dump(empty(NULL)) . PHP_EOL;    // true

// empty('')
echo 'empty(\'\') = ';
var_dump(empty('')) . PHP_EOL;      // false

echo 'empty("") = ';
var_dump(empty("")) . PHP_EOL;      // true

// empty(' ') = false
echo 'empty(\' \') = ';
var_dump(empty(' ')) . PHP_EOL;     // false

echo 'empty(" ") = ';
var_dump(empty(" ")) . PHP_EOL;     // false

echo 'empty(1) = ';
var_dump(empty(1)) . PHP_EOL;       // false

// empty('1')
echo 'empty(\'1\') = ';
var_dump(empty('1')) . PHP_EOL;     // false

echo 'empty(1.1) = ';
var_dump(empty(1.1)) . PHP_EOL;

echo 'empty(true) = ';
var_dump(empty(true)) . PHP_EOL;

echo 'empty(false) = ';
var_dump(empty(false)) . PHP_EOL;

echo 'empty(0) = ';
var_dump(empty(0)) . PHP_EOL;

// empty('0') = true
echo 'empty(\'0\') = ';
var_dump(empty('0')) . PHP_EOL;

// empty("0") = true
echo 'empty(\"0\") = ';
var_dump(empty("0")) . PHP_EOL;
*/

// isset - Языковая конструкция возвращает true,
// если переменная var существует и
// её значение отличается от null.
// В остальных случаях конструкция возвращает false.
/*
$a = null;
$b = NULL;
$c = '';
$d = "";
$e = ' ';
$f = " ";
$g = 1;
$h = 1.1;
$i = '1.1';
$j = "1.1";
$k = true;
$l = false;
$m = 0;
$n = 'null';
$p = "NULL";
$q = '0';
$r = "0";

echo 'isset(null) = ';
var_dump(isset($a)) . PHP_EOL;

echo 'isset(NULL) = ';
var_dump(isset($b)) . PHP_EOL;

echo "isset('') = ";
var_dump(isset($c)) . PHP_EOL;

echo "isset(\"\") = ";
var_dump(isset($d)) . PHP_EOL;

echo "isset(' ') = ";
var_dump(isset($e)) . PHP_EOL;

echo "isset(\" \") = ";
var_dump(isset($f)) . PHP_EOL;

echo "isset(1) = ";
var_dump(isset($g)) . PHP_EOL;

echo "isset(1.1) = ";
var_dump(isset($h)) . PHP_EOL;

echo "isset('1.1') = ";
var_dump(isset($i)) . PHP_EOL;

echo "isset(\"1.1\") = ";
var_dump(isset($j)) . PHP_EOL;

echo "isset(true) = ";
var_dump(isset($k)) . PHP_EOL;

echo "isset(false) = ";
var_dump(isset($l)) . PHP_EOL;

echo "isset(0) = ";
var_dump(isset($m)) . PHP_EOL;

echo "isset('0') = ";
var_dump(isset($q)) . PHP_EOL;

echo "isset(\"0\") = ";
var_dump(isset($r)) . PHP_EOL;

echo "isset('null') = ";
var_dump(isset($n)) . PHP_EOL;

echo "isset(\"null\") = ";
var_dump(isset($p)) . PHP_EOL;
*/