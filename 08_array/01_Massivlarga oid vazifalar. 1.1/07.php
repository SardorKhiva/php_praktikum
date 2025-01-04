<?php
// 7-masala. 1 dan N gacha bo’lgan sonlardan
// tashkil topgan massivning elementlari ichidan,
// faqat juft sonlarni yig’indisini hisoblang.

echo "\n1 dan qanchagacha sonlar kerak: ";
$n = intval(readline());

$arr = range(1, $n);
$sum = 0;

foreach ($arr as $value) {
    if ($value % 2 === 0) {
        $sum += $value;
    }
}

echo "1 dan $n gacha juft elementlar yig'indisi = $sum";