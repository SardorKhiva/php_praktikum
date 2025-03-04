<?php
// 2. Mamlakatlar massividan,
// Poytaxti "Ankara"
// bo`lgan Davlatni aniqlang

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
            "poytaxti" => "Mosva",
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

// 2 o'lchamli massivigi uchun
// $mamlakatlar massividan har bir $mamlakat ni alohida massiv deb olamiz
foreach($mamlakatlar as $mamlakat)
{
    // har bir $mamlakat massivini tekshiramiz
    foreach ($mamlakat as $value)
    {
        // agar biror $mamlakatni ichidagi elementlaridan
        // birisining qiymati Ankara (Anqara) bo'lsa
        if ($value == "Ankara")
        {
            // qaysi davlatligi chiqaramiz
            echo $mamlakat['nomi'];
        }
    }
}