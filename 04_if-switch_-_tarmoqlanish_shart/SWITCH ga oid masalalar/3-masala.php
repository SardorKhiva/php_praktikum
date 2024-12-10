<?php
/*
 * 3-masala.
 * Berilgan son (1 dan 999 999 gacha bo`lgan sonlar) ni
 * so`zlarda ifodalang.
 */

$son = 0;

do {
echo "1-1_000_000 oraliqdagi sonni kiiriting: ";
$son = intval(trim(readline()));
} while($son > 0 && $son < 1_000_000);

echo $son;