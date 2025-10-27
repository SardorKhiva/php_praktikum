<?php
/*
$num = 15;
function recursive($number)
{
    if ($number >= 10){
        echo $number . "\n";
        recursive($number - 1);
    }
}

recursive($num);
echo PHP_EOL . 'num = ' . $num;
*/

/*
function dekrement($son)
{
    if ($son > 0) {
        echo $son . PHP_EOL;
        dekrement($son - 1);
    }
}
dekrement(10);
*/

function factorial($n)
{
    if ($n <= 0) return 1;
    else {
        return $n * factorial($n - 1);
    }
}

$n = 5;
echo "$n! = " . factorial($n);