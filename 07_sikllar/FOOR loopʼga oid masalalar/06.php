<?php
// 6-masala.
// N dan M gacha bo’lgan sonlarning faqat
// 4 ga karralilarini yigindisini hisoblang.

echo "n: ";
$n = intval(readline());

echo "m: ";
$m = intval(readline());

$s = 0;

for ($i = $n; $i <= $m; $i++) {
    if ($i % 4 == 0) {
        $s += $i;
    }
}
echo "$n dan $m gacha faqat 4 ga karrali sonlar yig'indisi $s \n";