<?php

// oddiy switch ga misol:

echo "Lutfan hafta kunini kiriting: ";
$hafta_kuni = intval(trim(fgets(STDIN)));

switch ($hafta_kuni) {
    case 1:
        echo "dushanba";
        break;
    case 2:
        echo "seshanba";
        break;
    case 3:
        echo "chorshanba";
        break;
    case 4:
        echo "payshanba";
        break;
    case 5:
        echo "juma";
        break;
    case 6:
        echo "shanba";
        break;
    case 7:
        echo "yakshanba";
        break;
    default:
        echo "Yanglish kirish";
        break;
}