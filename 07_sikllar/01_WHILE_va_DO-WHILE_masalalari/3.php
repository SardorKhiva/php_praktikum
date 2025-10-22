<?php
// 3) N son berilgan. 0 dan katta. N faktorialni hisoblang.

function factorial(int $n)
{
    if ($n <= 0) {
        return 1;
    }
    return $n * factorial($n - 1);
}

echo "Qaysi sonni faktoriali kerak: ";
$n = trim(fgets(STDIN));

echo $n . "! = " . factorial($n);