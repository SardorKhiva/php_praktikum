<?php

// 3. Mamlakatlar massividan eng katta
// Maydonga ega bo'lgan Davlatni aniqlang

$mamlakatlar =
    [
        [
            "nomi" => "O'zbekiston",
            "aholi_soni" => "32979000",
            "maydoni" => "448978",
            "poytaxti" => "Toshkent",
            "pul_birligi" => "So'm",
        ],
        [
            "nomi" => "Qozog'iston",
            "aholi_soni" => "18157078",
            "maydoni" => "2724902",
            "poytaxti" => "Nursulton",
            "pul_birligi" => "Tanga",
        ],
        [
            "nomi" => "Turkmaniston",
            "aholi_soni" => "5125693",
            "maydoni" => "488100",
            "poytaxti" => "Ashxobod",
            "pul_birligi" => "Manat",
        ],
        [
            "nomi" => "Turkiya",
            "aholi_soni" => "80121000",
            "maydoni" => "783000",
            "poytaxti" => "Ankara",
            "pul_birligi" => "Turk lira",
        ],
        [
            "nomi" => "Rossiya",
            "aholi_soni" => "143000000",
            "maydoni" => "17340000",
            "poytaxti" => "Moskva",
            "pul_birligi" => "Rubl",
        ],
        [
            "nomi" => "Xitoy",
            "aholi_soni" => "1347374000",
            "maydoni" => "9596000",
            "poytaxti" => "Pekin",
            "pul_birligi" => "Yuan",
        ],
        [
            "nomi" => "AQSH",
            "aholi_soni" => "327000000",
            "maydoni" => "9631000",
            "poytaxti" => "Washington",
            "pul_birligi" => "Dollar",
        ]
    ];


$katta_maydon = 0;     // maydoni katta davlat
$katta_maydonli_davlat = '';

//echo "Eng katta maydonli mamlakat: \n";


foreach ($mamlakatlar as $mamlakat)
{
    if (intval($katta_maydon) < intval($mamlakat['maydoni'])) {
        $katta_maydon = $mamlakat['maydoni'];
        $katta_maydonli_davlat = $mamlakat['nomi'];
    }
}

echo "Massivdagi eng katta maydonli davlat:  " . $katta_maydonli_davlat . PHP_EOL;
echo "Bu davlatning maydoni: ";
echo number_format($katta_maydon, 0, '.', ' ') . " km^2\n";