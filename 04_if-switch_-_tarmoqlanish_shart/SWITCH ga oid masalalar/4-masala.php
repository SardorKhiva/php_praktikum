<?php
/*  4-masala.
Eshmatda N so`m puli bor.
Bankomatga borib uni boshqa valyutaga almashtirmoqchi.
Eshmat ni puli valyutalar kursi bo`yicha hisoblansin.
Agar Eshmat Dollar ni tanlasa, dollar kursi bo`yicha, yevroni tanlasa yevro
kursi bo`yicha hisoblasin.
Dollar, Rubl, Euro, Tanga lardan bittasi bo`lishi mumkin.    */

    echo "Eshmatni yonida qaysi valyuta bor: \n";
    echo "1-dollar \t";
    echo "2-rubl \t";
    echo "3-euro \t";
    echo "4-tanga \n";
    $valyuta = intval(readline());

    switch ($valyuta) {
        case 1:    echo "Eshmatni dollarni tanladi";  break;
        case 2:    echo "Eshmatni rublni tanladi";    break;
        case 3:    echo "Eshmat yevroni tanladi";     break;
        case 4:    echo "Eshmat tangani tanladi";     break;
        default:   echo "Bunday valyuta masala shartida yo'q, qaytdan urinib ko'ring\n";
    }

echo $valyuta . PHP_EOL;