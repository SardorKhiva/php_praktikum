<?php
/*
(PHP 4, PHP 5, PHP 7, PHP 8)
    empty — Проверяет, пуста ли переменная

Описание:
    empty(mixed $var): bool
    Проверяет, считается ли переменная пустой. Переменная считается пустой,
    если она не существует или её значение равно false.
    Языковая конструкция empty() не генерирует предупреждение,
    если переменная не существует.

var
    Проверяемая переменная.
    Если переменная не существует, предупреждение не генерируется.
    То есть конструкция empty() — это краткий эквивалент
    конструкции !isset($var) || $var == false.

Возвращаемые значения
    Возвращает true, если переданная в параметр var переменная не существует,
    содержит пустое значение или равно нулю, то есть ложно.
    В остальных случаях возвращает false.
 */

$var = 0;

// Принимает значение true, потому что переменная $var содержит пустое значение
if (empty($var)) {
    echo '$var или 0, или пусто, или вообще не определена';
}
echo PHP_EOL;

// Принимает значение true, потому что переменная $var определена
if (isset($var)) {
    echo '$var определена, даже если она пустая';
}
echo PHP_EOL;

# Пример #2 Конструкция empty() и строковые индексы
$expected_array_got_string = 'somestring';
var_dump(empty($expected_array_got_string['some_key']));
var_dump(empty($expected_array_got_string[0]));
var_dump(empty($expected_array_got_string['0']));
var_dump(empty($expected_array_got_string[0.5]));
var_dump(empty($expected_array_got_string['0.5']));
var_dump(empty($expected_array_got_string['0 Mostel']));

echo PHP_EOL;