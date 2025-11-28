<?php

function inverse($son)
{
    return 1 / $son;
}

echo inverse(5); // 0.2
echo PHP_EOL;

//echo inverse(0); // PHP Fatal error:  Uncaught DivisionByZeroError: Division by zero in ...

function inverse2($son)
{
    if ($son == 0) {
        throw new Exception("0 ga bo'lish mumkin emas!");
    }
    return 1 / $son;
}

echo inverse2(5);  // Unhandled \Exception
echo PHP_EOL;

//echo inverse2(0); // Fatal error: Uncaught Exception: 0 ga bo'lish mumkin emas! in ...
echo PHP_EOL;

//try catc orqali xatolikni ushlash
try {
//    xatolik bo'lishi mumkin bo'lgan code qismi
    echo inverse2(0);
} catch (Exception $e) {
//    print_r($e);             // xatolik haqida batafsil massiv ma'lumot
    echo PHP_EOL;
    print $e->getMessage();  // xatolik haqida qisqa ma'lumot
}