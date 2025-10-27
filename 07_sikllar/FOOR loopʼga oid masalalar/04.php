<?php
// 4-masala.
// 1 dan N gacha bo’lgan faqat juft sonlarning yigindisini ekranga chiqaring.

echo "n: ";
$n = intval(readline());

$s = 0;

for ($i = 1; $i <= $n; $i++) {
    if ($i % 2 == 0) {
        $s += $i;
    }
}

echo "1 dan $n gacha faqat juft sonlar yig'indisi $s \n";