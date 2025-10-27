<?php
// 3-masala.
// 1 dan N gacha bo’lgan sonlarni ko’paymasini ekranga chiqaring.

echo "n: ";
$n = intval(readline());

$k = 1;

for ($i = 1; $i <= $n; $i++) {
    echo "$i! = ";
    $k *= $i;
    echo $k . PHP_EOL;
}
echo "\n1 dan $n gacha sonlar ko'paytmasi $k \n";