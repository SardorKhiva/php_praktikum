<?php
// 9-masala. Berilgan matnda ‘r’ harfi nechta marta ishlatilganini hisoblang.
// For, while yordamida.

echo "Matn: ";
$matn = strval(readline());

$r = 0;

for ($i = 0; $i < strlen($matn); $i++) {
    if ($matn[$i] == "r") {
        $r++;
    }
}
echo "'$matn' da $r dona r bor \n";