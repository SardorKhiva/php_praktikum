<?php
// 8-masala. N ta sondan tashkil topgan array yarating.
// Shu arrayni ichida M soni bor yo’qligini aniqlang.
// Misol: $n = array(12, 5, 2, 66, 22, 56, 123, 7, 1, 67);
// $m=22; Natija : 22 soni massiv ichida bor.

echo "Nechta element kerak: ";
$n = intval(readline());

echo "Qaysi sonni qidiryabsiz massivdan: ";
$m = intval(readline());

$ok = false;

$arr = [];
echo "Random qiymatlarga ega massiv:\n";
for ($i = 0; $i < $n; $i++) {
    $arr[$i] = rand($n, 1);
    echo "arr[$i] = $arr[$i] \n";
    if ($arr[$i] === $m) {
        $ok = true;
        break;  // topilsa sikl tugaydi
    }
}

// standart funksiya orqali element borligini tekshirish
if (in_array($m, $arr)) {
    echo "$m soni massiv ichida bor\n";
} else {
    echo "$m soni massiv ichida yo'q\n";
}

// for ni natijasi, har bir elementni m ga solishitirib ko'rish
if ($ok) {
    echo "$m soni massiv ichida bor\n";
} else {
    echo "$m soni massiv ichida yo'q\n";
}