<?php
// 5-masala.
// N dan M gacha bo’lgan sonlarning yig’indisini hisoblang.

echo "n dan m gacha sonlar yig'indisini hisoblash\n";
echo "n: ";     $n = intval(readline());
echo "m: ";     $m = intval(readline());
$s = 0;

for ($i = $n; $i <= $m; $i++) {
    $s += $i;
}
echo "$n dan $m gacha sonlar yig'indisi $s \n";