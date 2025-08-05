<?php
// multidimensional array - ko'p o'lchovli massiv
/*
$talabalar = [
    [
        'name' => 'Sardor',
        'age' => 20,
        'phone' => '998901234567'
    ],
    [
        'name' => 'Anvar',
        'age' => 22,
        'phone' => '998901234568'
    ],
    [
        'name' => 'Dilshod',
        'age' => 21,
        'phone' => '998901234569'
    ],
    [
        'name' => 'Gulnora',
        'age' => 19,
        'phone' => '998901234570'
    ]
];

// massivni yangi element qilib qo'shish
$talabalar[] = [
    'name' => 'Aziza',
    'age' => 18,
    'phone' => '998901234571'
];

// bo'lak-bo'lak qilib massivga yangi element qo'shish
$student = [];
$student['name'] = 'Azamat';
$student['age'] = 23;
$student['phone'] = '998901234572';
$talabalar[] = $student;

// yangi element qilib qo'shish (har qatori yangi element)
$talabalar[]['name'] = 'Aziza';
$talabalar[]['age'] = 18;
$talabalar[]['phone'] = '998901234571';

print_r($talabalar);

// massivni yangi element qilib indexi bilan qo'shish
$talabalar[6]['name'] = 'Azamat';
$talabalar[6]['phone'] = '998901234572';
$talabalar[6]['age'] = 23;
print_r($talabalar);
*/

/*
$yer = [
    [2, 3, 4, 213, 7],
    ['213', 213, 'salom', 275.4, true],
    [true, false, null, 0, 1],
    ['a', 'b', 'c', 'd', 'e'],
    ['os' => 'ios', 'name' => 'iphone']
];

foreach ($yer as $item => $qiymat) {
    echo "Massivning $item - indexli elementlari:\n";
    foreach ($qiymat as $key => $value) {
        echo $key . " => " . $value . "\n";
    }
    echo "\n";
}
*/

// array_push() - massivga yangi element qo'shadi
/*
$food = [
    'fruits' => [
        'nok',
        'apple',
        'raspberry',
        'pear',
        'banana',
    ],
    'vegetables' => [
        'carrot',
        'potato',
        'onion',
        'cabbage',
        'pepper',
    ],
    'grains' => [
        'rice',
        'wheat',
        'corn',
        'barley',
        'oats',
    ]
];

// Yuqoridagi massivning biror qiymatidan foydalanmoqchi bo'lsak:
echo $food['vegetables'][0]; // 'carrot' - massivning 0-indeksli qiymati
$olma = $food['fruits'][1]; // 'apple' - massivning 1-indeksli qiymati
echo "\nOlma: $olma\n"; // 'apple' - massivning 1-indeksli qiymati

// Yuqoridagi massivga 2 ta yangi qiymat qo'shamiz:
array_push($food['vegetables'], 'broccoli', 'spinach'); // 'broccoli' va 'spinach' qo'shildi
print_r($food);
*/

$talabalar = [
    [
        'name' => 'Sardor',
        'age' => 20,
        'phone' => '998901234567'
    ],
    [
        'name' => 'Anvar',
        'age' => 22,
        'phone' => '998901234568'
    ],
    [
        'name' => 'Dilshod',
        'age' => 21,
        'phone' => '998901234569'
    ],
    [
        'name' => 'Gulnora',
        'age' => 19,
        'phone' => '998901234570'
    ]
];

// jadvalni chiqarish, 1-variant:
/*
echo "<table border='1' cellpadding='5' cellspacing='0'>";
echo "<tr><th>Name</th><th>Age</th><th>Phone</th></tr>";
foreach ($talabalar as $talaba) {
    echo "<tr>";
    echo "<td>" . htmlspecialchars($talaba['name']) . "</td>";
    echo "<td>" . htmlspecialchars($talaba['age']) . "</td>";
    echo "<td>" . htmlspecialchars($talaba['phone']) . "</td>";
    echo "</tr>";
}
*/

// jadvalni chiqarish, 2-variant:
/*
?>

    <table border='1'>
        <tr>
            <th>Ismi</th>
            <th>Yoshi</th>
            <th>Vazni</th>
        </tr>

<?php
*/
/*
foreach ($talabalar as $talaba) {
echo "<tr>";
foreach ($talaba as $qiymat) {
echo "<td>";
echo $qiymat;
echo "</td>";
}
echo "<tr>";

}
echo "</table>";
*/

// array_filter() - massivni filtrlash
// Ushbu talabalar massividan,
// yoshi 23 dan katta yoki teng bo'lgan talabalarni olish

/*
$talabalar = [
    [
        "ismi" => "Sardor",
        "yoshi" => 18,
        "vazni" => 70
    ],
    [
        "ismi" => "Eshmat",
        "yoshi" => 23,
        "vazni" => 67
    ],
    [
        "ismi" => "Toshmat",
        "yoshi" => 25,
        "vazni" => 78
    ],
    [
        "ismi" => "Sanjar",
        "yoshi" => 19,
        "vazni" => 123
    ],
];

$yosh = 23;

$filtered_array = array_filter($talabalar, function ($talaba) use ($yosh) {
    return $talaba['yoshi'] >= $yosh; // yoshi 23 dan katta yoki teng bo'lgan talabalarni olish
});
echo "<pre>";
print_r($filtered_array);
echo "</pre>";
*/

$food = [
    'fruits' => [
        'apple',     // 0
        'raspberry', // 1
        'pear',      // 2
        'banana',    // 3
    ],
    'vegetables' =>
        [
            'peas',    // 0
            'carrots', // 1
            'cabbage'  // 2
        ],
    'grains' => [
        'wheat', // 0
        'rice',  // 1
        'oats'   // 2
    ]
];

// $food massividagi elementlarning qiymatlaridagi massivdan,
// index keyi 1 ga teng bo'lgan barcha qiymatlarni olish:
$ar = array_column($food, 1);
print_r($ar);
// Ushbu kod $food massividagi elementlarning qiymatlaridagi massivdan,
// index keyi 1 ga teng bo'lgan barcha qiymatlarni oladi va yangi massivga saqlaydi.

$talabalar = [
    [
        "ismi"=>"Sardor",
        "yoshi"=>18,
        "vazni"=>70
    ],
    [
        "ismi"=>"Eshmat",
        "yoshi"=>23,
        "vazni"=>67
    ],
    [
        "ismi"=>"Toshmat",
        "yoshi"=>25,
        "vazni"=>78
    ],
    [
        "ismi"=>"Sanjar",
        "yoshi"=>19,
        "vazni"=>66
    ],
];

$arr = array_column($talabalar, 'ismi', 'yoshi');
print_r($arr);
// Ushbu kod $talabalar massividagi 'ismi' kalitlari qiymatlarini
// yangi indeksli massivga saqlaydi, indekslari esa 'yoshi' kalitlari qiymatlari bo'ladi.
// Bu holda, 'ismi' kalitlari qiymatlari yangi indeksli massivning qiymatlari bo'ladi,
// 'yoshi' kalitlari qiymatlari esa yangi indeksli massivning indekslari bo'ladi.

