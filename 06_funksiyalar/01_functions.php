<?php

echo 'Salom dunyo!' . PHP_EOL;

function SayHello()     // funksiya e'lon qilindi
{
    echo 'Hello World!' . PHP_EOL;
}

sayHello(); // funksiya non-case sensative, registrga sezuvchanmas!
SayHello();
sAyHello();

function turnOnTV()
{
    echo 'Tokka ulandi, hammasi joyida!' . PHP_EOL;
}

echo PHP_EOL;


echo 'kod1' . PHP_EOL;
turnOnTV();
echo 'Ovozi balandlatildi!' . PHP_EOL;
echo PHP_EOL;

echo 'kod2' . PHP_EOL;
turnOnTV();
echo "Kanal o'zgartirildi!\n";
