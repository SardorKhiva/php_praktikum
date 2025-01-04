<?php
// 3-masala. N ta elementdan tashkil
// topgan massiv berilgan. Massivda eng kop
// qatnashgan bir xil qiymatli element
// sonini chiqaruvchi funksiya yozing.


$n = $n2 = null;
do {
    echo "Nechta element kerak: ";
    $n = intval(readline());
    $n2 = intval($n / 3);
} while (!($n2 > 1));

$arr = [];
// dublikatlari ko'proq massiv random generatsiya qilish:
for ($i = 0; $i < $n; $i++) {
    $arr[$i] = rand(1, $n2);
}

// nima necha marta takrorlanganini ko'rish
sort($arr);
print_r($arr);

// qaysi element necha marta uchraganini topadigan funksiyadagi
// maximal elelemtni qaytaradigan funksiya
function mostFrequentElement($arr): int
{
    // Elementlar sonini hisoblash uchun massiv
    $counts = array_count_values($arr);
    echo "\nQaysi element necha marta takrorlangani:\n";
    foreach ($counts as $key => $value) {
        echo $key . " elementi " . $value . " marta takrorlandi\n";
    }

    // Eng ko'p uchragan qiymatni topish
    $maxValue = max($counts);  // Eng ko'p uchragan elementning soni

    // Eng ko'p uchragan elementning qiymatini qaytarish
    return array_search($maxValue, $counts);  // Eng ko'p uchragan elementni qaytarish
}


echo "\nEng ko'p uchragan element: " . mostFrequentElement($arr) . PHP_EOL;

//1. array_count_values($arr): Bu funksiya massivdagi har bir elementning
// nechta marta uchrashini hisoblaydi va natijada yangi massivni qaytaradi,
// unda kalitlar - bu elementlarning qiymatlari,
// va qiymatlar - bu qiymatlarning nechta borligi.

//2. max($counts): Bu funksiya hisoblangan qiymatlarning eng kattasini topadi,
// ya'ni eng ko'p uchragan qiymatni.

// 3. array_search($maxValue, $counts): Bu funksiya eng ko'p
// uchragan qiymatning asl qiymatini topadi.

// Agar massiv `[1, 2, 3, 4, 2, 3, 2, 5, 2, 6, 7, 2]` bo'lsa,
// bu kod "Eng ko'p uchragan element: 2" deb chiqaradi,
// chunki 2 raqami 4 marta uchraydi.


