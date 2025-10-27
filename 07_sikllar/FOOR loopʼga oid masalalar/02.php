<?php
// 2-masala.
// 1 dan N gacha bo’lgan sonlarni yigindisini ekranga chiqaring;

echo "n: ";
$n = intval(readline());

$s = 0;

for ($i = 1; $i <= $n; $i++) {
    $s += $i;
}
echo "1 dan $n gacha sonlar yig'indisi $s \n";