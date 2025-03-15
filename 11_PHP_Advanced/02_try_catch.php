<?php

function inverse(int $x)
{
    return 1 / $x;
}

echo inverse(2) . PHP_EOL;
echo "\n----Keyingi funksiya----\n";

function correctInverse($x)
{
    if ($x == 0) {
        throw new Exception("\n0 ga bo'lish mumkin emas!\n");
    }
    return 1 / $x;
}

try {
    echo correctInverse(0);
} catch (Exception $e) {
    echo "Sonni 0 ga bo'lib bo'lmaydi! \n";
}

echo correctInverse(0);

try {
    echo correctInverse(0);
} catch (Exception $r) {
    echo '0 ga bo\'lish mumkin emas!  '/* . $r->getMessage()*/;
}

echo 'lorem ipsum';