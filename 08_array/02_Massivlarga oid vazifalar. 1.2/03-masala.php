<?php
// 3-masala.
// array(0 => 'blue', 1 => 'red',
// 2 => 'green string', 3 => 'red');
// Yuqoridagi arraydan berilgan
// so’zni bor yo’qligini aniqlang.
// $suz = 'lue'; // Natija : bor
// $suz = 'leu'; // Natija : yo'q

$ranglar = ['blue', 'red', 'green string', 'red'];
print_r($ranglar);

echo "Massivdan qidirilayotgan qism: ";
$str = strval(readline());
echo PHP_EOL;

// standart funksiya orqali qidirish:
/*
if (in_array($str, $ranglar)){
    echo "$str massivda bor\n";
}
else{
    echo "$str massivda yo'q\n";
}
 */

for ($i = 0; $i < count($ranglar); $i++) {
    if (mavjud($ranglar[$i], $str)) {
//        echo "$ranglar[$i] da $str bor\n";
        echo "Natija : bor\n";
        break;
    } else {
//        echo "$ranglar[$i] da $str yo'q\n";
        echo "Natija : yo'q\n";
    }
}

function mavjud(string $massivdan_str, string $str): bool
{
    $ok = false;
    for ($i = 0, $j = -1; $i < mb_strlen($massivdan_str); $i++, $j--) {
        if (substr($massivdan_str, 0, $i) == $str ||
            substr($massivdan_str, $j) == $str) {
            $ok = true;
            break;
        }
    }
    return $ok;
}