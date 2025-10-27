<?php
// indexli yoki nomerli massiv
// bu massiv elementlari sonlar yordamida joylashadi, tartiblanadi va tanlanadi

$indexed_array1 = [1, 2, 3, 4, 5];
$indexed_array2 = ["element1", "element2", "element3", "element4", "element5"];


//var_dump($indexed_array1);
print_r($indexed_array1);
echo PHP_EOL;

//var_dump($indexed_array2);
print_r($indexed_array2);

// elementlar soni
$size = count($indexed_array2);

// ekranga chiqarish
for ($i = 0; $i < $size; $i++) {
    echo $indexed_array2[$i], PHP_EOL;
}
echo PHP_EOL;

// alohida index berish
$indexed_array3 = [
    "a",   // 0
    "b",   // 1
    6 => "c",   // 6
    "d",   // 7
    3 => "e",   // 3
    "f"    // 8
];
var_dump($indexed_array3);
echo PHP_EOL;

// alohida index orqali element ustiga qayta malumot yozish
$indexed_array4 = [
    "bir",  // 0
    "ikki", // 1
    "uch",  // 2
    "to'rt", // 3
    1 => "besh"  // 1, oldingi 1-indexdagi elementni ustiga qayta yozadi
];
var_dump($indexed_array4);
$indexed_array4[] = "olti"; // yangi elementni oxirga qo'shish
echo PHP_EOL;

// test uchun
$indexed_array5 = [
    2 => 1,
    4 => 3,
    6 => 5,
    8 => 7,
    10 => 9
];
for ($i = 2; $i <= count($indexed_array5); $i+=2) {
    echo $indexed_array5[$i], PHP_EOL;
};
