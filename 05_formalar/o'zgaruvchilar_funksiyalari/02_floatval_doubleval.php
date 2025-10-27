<?php
/*
    floatval
    (PHP 4 >= 4.2.0, PHP 5, PHP 7, PHP 8)
    floatval — Возвращает значение переменной в виде числа с плавающей точкой
 */

// floatval:
$var = '122.34343The';
$float_value_of_var = floatval($var);
echo $float_value_of_var; // 122.34343
echo PHP_EOL;

//$var = '122.34343The';
$float_value_of_var = floatval($var);
echo $float_value_of_var; // 122.34343
echo PHP_EOL;

// doubleval:
$var_double = '122.34343The';
$double_value_of_var = doubleval($var_double);
echo $double_value_of_var; // 122.34343
echo PHP_EOL;

$double_value_of_var = doubleval($var_double);
echo $double_value_of_var; // 122.34343