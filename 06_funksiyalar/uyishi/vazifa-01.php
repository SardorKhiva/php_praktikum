<?php
/*
 * 1. Musbat N soni berilgan.
 * N faktorialni qiymatini toping.
 * 3! - 3 faktorial deyiladi.
 * 1 * 2 * 3 => 6
 */

global $harakat1;
global $harakat2;

$harakat1 = 0;
$harakat2 = 0;

echo 'Qaysi sonni faktoriali kerak: ';
$n = doubleval(trim(readline()));
$factorial_1 = faktorial($n);
$factorial_2 = fact_recur($n);

echo "For sikl orqali: ";
echo number_format($factorial_1, 2, '.', ' ') . PHP_EOL;
echo "Harakatlar soni: " . ($harakat1) . PHP_EOL;
echo "-----------------------------------" . PHP_EOL;
echo "Rekursiya orqali: ";
echo number_format($factorial_2, 2, '.', ' ') . PHP_EOL;
echo "Harakatlar soni: " . ($harakat1) . PHP_EOL;


// paramatrli for sikli orqali factorialni topish:
function faktorial(float $n): float
{
    global $harakat1;
    $result = 1;
    for ($i = 1; $i <= $n; $i++) {
        $result *= $i;
        if ($i < $n) {
            echo $i . ' * ';
        } else {
            echo ' => ';
        }
//        echo $result . ' * ';
        ++$harakat1;
    }
    return $result;
}

// rekursiya orqali factorialni topish:
function fact_recur(float $n): float
{
    global $harakat2;
    if ($n <= 1) {
        return 1;
    }
    ++$harakat2;
    return $n * fact_recur($n - 1);
}