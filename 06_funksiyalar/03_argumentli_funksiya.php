<?php
// declare(strict_types=1);     // funksiya argument tiplar tekshirishni majburiy qiladi
$yosh = 18;

function showAge($yosh, $width, $height)
{
    echo $yosh . PHP_EOL;
    echo $width . PHP_EOL;
    echo $height . PHP_EOL;
}

showAge($yosh, 12, 16);
echo PHP_EOL;

function burn($fuel)
{
    echo "Biz {$fuel} yoqyapmiz!\n";
}

$a = "asdas";
burn("tappi");
burn('ko`mir');

// Funksiya rgumentga standart default - boshlang'ich qiymat berish
function makeCoffee($type = 'Cappuccino')
{
    echo "Make a cup of $type!\n";
}

makeCoffee();
makeCoffee('Nescafe');

// argumentlar turlarini aniq belgilash


function sum(int $a, int $b)
{
    echo $a + $b . PHP_EOL;
}

sum(6, 5);
sum(8, 9);

function turnOnTV($tv_name)
{
    echo "TV tokka ulandi, hammasi joyida \n";
    echo "{$tv_name} TV yoqildi \n";
}

echo "kod1 \n";
turnOnTV("Apple");

echo "kod2 \n";
turnOnTV("Samsung");

echo "kod3 \n";
$tv = "MI";
turnOnTV($tv);

function OnTV($arg1, $tv_name = "LG")   // boshlang'ich qiymatli argumentlarni oxiriga qo'yish kerak!
{
    echo "TV tokka ulandi, hammasi joyida \n";
    echo "{$tv_name} TV yoqildi \n";
}

echo "\nkod1 \n";
OnTV('', "Apple"); // TV tokka ulandi, hammasi joyida Apple TV yoqildi
