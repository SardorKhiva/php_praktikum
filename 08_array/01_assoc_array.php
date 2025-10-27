<?php

// eng katta qiymatli element indeksini topish
$students = [
    'Mahmud' => 27,
    'Anvar' => 24,
    'Sardor' => 42,
    'Alisher' => 40,
    'Dilshod' => 43
];

$temp = 0;
$temp_index = null;

foreach ($students as $key => $value) {
    if ($temp < $value) {
        $temp = $value;
        $temp_index = $key;
    }
}
echo $temp_index;