<?php

$massiv = [10];

for ($i = 0; $i < 10; $i++) {
    $massiv[$i] = rand(1, 100);
}

print_r($massiv);

/*
for ($k = count($massiv) - 1; $k > 0; $k--){
    for ($i = 0; $i <$k; $i++) {
        if ($massiv[$i] > $massiv[$i + 1]) {
            $tmp = $massiv[$i];
            $massiv[$i] = $massiv[$i + 1];
            $massiv[$i + 1] = $tmp;
        }
    }
}
*/

for ($i = 0; $i < count($massiv) - 1; $i++) {

    for ($j = $i + 1; $j < count($massiv); $j++) {
        if ($massiv[$i] > $massiv[$j]) {
            $tmp = $massiv[$i];
            $massiv[$i] = $massiv[$j];
            $massiv[$j] = $tmp;
        }
    }
}

print_r($massiv);