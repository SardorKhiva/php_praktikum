<?php
// 5. Mamlakat massividan foydalanib jadval yarating. (<table> dan foydalaning).
// Aholi soni bo'yicha o'sib borish tartibda saralangan holda chiqsin

$mamlakatlar = [
    [
        "nomi"=>"O'zbekiston",
        "aholi_soni"=>"32979000",
        "maydoni"=>"448978",
        "poytaxti"=>"Toshkent",
        "pul_birligi"=>"So'm",
    ],
    [
        "nomi"=>"Qozog'iston",
        "aholi_soni"=>"18157078",
        "maydoni"=>"2724902",
        "poytaxti"=>"Nursulton",
        "pul_birligi"=>"Tanga",
    ],
    [
        "nomi"=>"Turkmaniston",
        "aholi_soni"=>"5125693",
        "maydoni"=>"488100",
        "poytaxti"=>"Ashxobod",
        "pul_birligi"=>"Manat",
    ],
    [
        "nomi"=>"Turkiya",
        "aholi_soni"=>"80121000",
        "maydoni"=>"783000",
        "poytaxti"=>"Ankara",
        "pul_birligi"=>"Turk lira",
    ],
    [
        "nomi"=>"Rossiya",
        "aholi_soni"=>"143000000",
        "maydoni"=>"17340000",
        "poytaxti"=>"Mosva",
        "pul_birligi"=>"Rubl",
    ],
    [
        "nomi"=>"Xitoy",
        "aholi_soni"=>"1347374000",
        "maydoni"=>"9596000",
        "poytaxti"=>"Pekin",
        "pul_birligi"=>"Yuan",
    ],
    [
        "nomi"=>"AQSH",
        "aholi_soni"=>"327000000",
        "maydoni"=>"9631000",
        "poytaxti"=>"Washington",
        "pul_birligi"=>"Dollar",
    ],
];

echo "<body style='background-color:green'>";

echo "<p><strong>Saralanmagan ro'yhat: </strong></p>";
massivKorsat($mamlakatlar);

$mamlakat_adadi = count($mamlakatlar) - 1;
for ($i = 0; $i < $mamlakat_adadi; $i++) 
{
    foreach ($mamlakatlar as $kalit => $mamlakat) 
    {
        // keyingi element bor yo'qligini tekshirish
        if (isset($mamlakatlar[$kalit + 1])) 
        {
            // 'aholi_soni' kalitidagi elementni keyingi
            // 'aholi_soni' kalitidagi elementlar bilan solishtirish 
            if ( intval($mamlakatlar[$kalit]['aholi_soni']) > intval($mamlakatlar[$kalit + 1]['aholi_soni']) ) 
            {
                // 1-usulda saralash:
                // agar keyingi 'aholi-soni kalitidagi element kichik bo'lsa
                $temp = $mamlakatlar[$kalit];
                $mamlakatlar[$kalit] = $mamlakatlar[$kalit + 1];
                $mamlakatlar[$kalit + 1] = $temp;
                
                // 2-usulda saralash:
                // oldingi 'aholi_soni' va keyingi kichik bo'lgan
                // shu nomli kalit joylashgan massivlar o'rin almashsin
//                list($mamlakatlar[$kalit], $mamlakatlar[$kalit + 1]) = [ $mamlakatlar[$kalit + 1], $mamlakatlar[$kalit] ];
            }
        }
    }
}

echo "<p><strong>Aholi soni ko'payish tartibida joylashgan ro'yhat: </strong></p>";
massivKorsat($mamlakatlar);

function massivKorsat($massiv): void
{
    foreach ($massiv as $mamlakat)
    {
       
            echo "Davlat nomi: " . $mamlakat['nomi'] . "<br>";
            echo "Aholi soni: " . number_format($mamlakat['aholi_soni'], 0, '.', ' ') . " kishi <br>";
            echo "Maydoni: " . number_format($mamlakat['maydoni'], 0, '.', ' ') . " km<sup>2</sup> <br>";
            echo "Poytaxti: " . $mamlakat['poytaxti'] . "<br>";
            echo "Pul birligi: " . $mamlakat['pul_birligi'] . "<br>";
            echo "<br>";
    }
        echo "<hr>";
}