<?php
/**
 * //  8. $kitoblar massividan quyidagi ko'rinishda massiv hosil qiling.
 * Array
 * (
 * [tragediya] => Array
 * (
 * [0] => Array
 * (
 * 'nomi' => O'tgan kunlar
 * 'janr' => tragediya
 * 'bet' => 200
 * ]
 * [1] => Array
 * (
 * 'nomi' => Stiv Jobs
 * 'janr' => tragediya
 * 'bet' => 200
 * ]
 * [2] => Array
 * (
 * 'nomi' => Hamsa
 * 'janr' => tragediya
 * 'bet' => 580
 * ]
 * ]
 * [komediya] => Array
 * (
 * [0] => Array
 * (
 * 'nomi' => Molxona
 * 'janr' => komediya
 * 'bet' => 150
 * ]
 * [1] => Array
 * (
 * 'nomi' => Daftar hoshiyasidan bitiklar
 * 'janr' => komediya
 * 'bet' => 140
 * ]
 * ]
 * ]
 */
$kitoblar =
    [
        'tragediya' =>
            [
                [
                    'nomi' => "O'tgan kunlar",
                    'janr' => "tragediya",
                    'bet' => 200
                ],
                [
                    'nomi' => "Stiv Jobs",
                    'janr' => "tragediya",
                    'bet' => 200
                ],
                [
                    'nomi' => "Hamsa",
                    'janr' => "tragediya",
                    'bet' => 580
                ]
            ],
        'komediya' =>
            [
                [
                    'nomi' => "Molxona",
                    'janr' => "komediya",
                    'bet' => 150
                ],
                [
                    'nomi' => "Daftar hoshiyasidan bitiklar",
                    'janr' => "komediya",
                    'bet' => 140
                ]
            ]
    ];

print_r($kitoblar);


foreach ($kitoblar as $nomi => $janr)
{
    echo "\tJanr: $nomi\n";
    foreach ($janr as $kalit => $ism)
    {
        foreach ($ism as $key => $value)
            echo $key . ": " . $value . "\n";
    echo PHP_EOL;
    }

}
