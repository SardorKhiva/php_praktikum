<?php
// 7-masala. N ta elementdan tashkil topgan
// massiv berilgan va K butun son berilgan.
// Massiv elementlari orasida K ga eng
// yaqin elementini toping.
// |a[i]-K| ayirma eng kichik bo’luvchi a[i] topilsin.

echo "Nechta random qiymatli element kerak: ";
$n = intval(readline());
$arr = randArrToN($n);

echo "Dastlabki massiv: \n";
print_r($arr);

do {
    echo "K butun sonini kiriting: ";
    $k = intval(readline());
} while (!(1 <= $k && $k <= $n));

$kerak = engyaqinSon($arr, $k);     // funksiyalar case sensitve emas

echo "$k ga eng yaqin son " . $kerak . PHP_EOL;


// n ta random qiymatli element qaytaruvchi funksiya
function randArrToN(int $n): array
{
    $arr = range(1, $n);
    shuffle($arr);
    return $arr;
}

// eng yaqin sonni qaytaruvchi funksiya
function engYaqinSon(array $arr, int $k): int
{
    $kerak = null;
    for ($i = 0; $i < count($arr); $i++) {
        if (abs($arr[$i] - $k) == 1) {
            $kerak = $arr[$i];
        }
    }
    return $kerak;
}