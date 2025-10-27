<?php
$tv = false;

function turnOnOffTV($tv)
{
    if ($tv == true) {
        echo "TV o'chirildi\n";
        $tv = false;
        return $tv;
    } else {
        echo "TV yoqildi\n";
        return true;
    }
}

$tv = turnOnOffTV($tv);
echo "1-turnOnOffTV: ";
var_dump($tv);

$tv = turnOnOffTV($tv);
echo "2-turnOnOffTV: ";
var_dump($tv);
echo PHP_EOL;

$mytv = turnOnOffTV(true);
echo "3-turnOnOffTV: ";
var_dump($mytv);
echo PHP_EOL;