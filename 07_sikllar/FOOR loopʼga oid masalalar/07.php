<?php
// 7-masala.
// M dan N gacha nechta juft son borligini hisoblang.

echo "m: ";     $m = readline();
echo "n: ";     $n = readline();

$juft_sanoq = 0;

for ($i = $m; $i <= $n; $i++) {
    if ($i % 2 == 0) {
        $juft_sanoq++;
    }
}
echo "$m dan $n gacha $juft_sanoq dona juft son bor";