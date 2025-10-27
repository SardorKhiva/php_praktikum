<?php
/*
// 1 dan n gacha sonar ko'paytmasi
$sonlar = [1, 2, 3, 4];
$k = 1;
$sum = 0;

for ($i = 0; $i < count($sonlar); $i++) {
    $sum += $sonlar[$i];
    $k = $sonlar[$i] * $k;
}
echo "Ko'paytmasi = ", $k . PHP_EOL;
echo "Summasi = ", $sum . PHP_EOL;
//print_r($sonlar);

// 3 ga karrali indexli 1 dan n gacha bo'lgan elementlarning yig'indisi
$sonlar2 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
$sum = 0;

// yoki 3 odimdan qo'shib boramiz if siz
//for ($i = 0; $i < count($sonlar2); $i+=3)

for ($i = 0; $i < count($sonlar2); $i++) {
    if ($i % 3 == 0) {
        echo $sonlar2[$i] . PHP_EOL;
        $sum += $sonlar2[$i];
    }
}
echo "3 ga karrali indexli elementlar summasi = ", $sum . PHP_EOL;
*/

/*
// eng katta elementli indexni topish
$natijalar = [
    "Abdulla" => 12,
    "Mahmud" => 10,
    "Akrom" => 14,
    "Sardor" => 70,
    "Muhammad" => 18_000,
];

$katta_element = 0;
$katta_element_index = null;

foreach ($natijalar as $key => $value)
{
//    echo $key . " => " . $value . PHP_EOL;
    if ($value > $katta_element) {   // agar 1-element 0 dan katta bo'lsa
        $katta_element = $value;     // katta element shu bo'lsin
        $katta_element_index = $key; // va shu index tanlansin
    }
}

echo "Katta element = ", $katta_element . PHP_EOL;
echo "Katta element indexi = ", $katta_element_index . PHP_EOL;
*/

// MASSIVLARNI SARALASH

// bo'sh massiv
$element = [];

// massivni har xil sonlar bilan 10 ta elementga to'ldirish
for ($i = 0; $i < 10; $i++) {
    $element[] = rand(1, 100);
//    arr_print($element);
}

echo "Saralanmagan massiv: \n";
arr_print($element);
//print_r($element);      // chiqarish
echo PHP_EOL;

$j = 0;

echo "Saralangan massiv: \n";
for ($i = 0; $i < count($element); $i++) {
    arr_print($element);    // har odimdagi o'zgarishlarni chiqarish

    // 0-dan boshlab kichik deb elementni saqlab turish
    $kichik = $element[$i];

    // i dan keyingi (saralanganlardan boshqa)larni siklga kiritish
    for ($j = $i + 1; $j < count($element); $j++) {

        // agar i dan o'ngda turgan element chapdagidan kichik bo'lsa
        if ($element[$j] < $kichik) {       // kamayish tartibida saralash uchun > yoziladi
            $kichik = $element[$j];     // kichik element shu bo'lsin

            // o'rin almashtirish
//            $temp = $element[$j];           // o'ngdagini vaqtincha saqlab turish
            $element[$j] = $element[$i];    // o'ngdagi chapdagini qiymatini saqlasin
//            $element[$i] = $temp;           // chapdagi esa vaqtincha saqlab turilganni o'zida saqlasin
            $element[$i] = $kichik;         // temp bo'lmasa

            // almashgan ikki son
            echo " { $element[$j] } > { $element[$i] } " . PHP_EOL;
        }
    }
//    echo $element[$i] . " < " . $element[$j] . PHP_EOL;
    echo PHP_EOL;
}

//print_r($element);

function arr_print($massiv): void
{
    for ($i = 0; $i < count($massiv); $i++) {
        echo $massiv[$i] . " ";
    }
    echo PHP_EOL;
}