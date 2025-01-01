<?php
/*
$array = ["1", "2", "3"];
// is_array - massiv ekanligini boolean qiymatini qaytaradi
if (is_array($array)) {
    echo "Array";
} else {
    echo "Not Array";
}
echo PHP_EOL;
*/

/*
// in_array - massiv ichidan element bor yo'qligini bool tipida qaytaradi
if (in_array(2, $array)) {
    echo "Array ichida 2 bor\n";    // bu yerda "2" stringi 2 intga o'tkaziladi
} else {
    echo "Array ichida 2 yo'q\n";
}

// agar 3-paramaetrga true berilsa tiplari bir xilligini tekshiradi
// odatda false bo'ladi va turlarga keltirib javob qaytaradi
if (in_array(2, $array, true)) {
    echo "Array ichida 2 bor\n";
} else {
    echo "Array ichida 2 yo'q\n";
}
*/

// array_search - massivdan qidirilayotgan element indexini,
// topilmasa false qaytaradi
/*
$array = ["1", "2", "3"];
$index = array_search(2, $array);
$index_type = array_search(2, $array, true);
echo "Qidirilayotgan element indexi = $index \n";
echo "Qidirilayotgan element indexi bir xil tipli = $index_type \n";
echo PHP_EOL;
*/

// array_column() - ko'p o'lchamli massivdan kiritilgan
// keydagi elementlarni ajratib olish
/*
$massiv = [
    ['name' => 'Ivan', 'surname' => 'Ivanov'],
    ['name' => 'Petr', 'surname' => 'Petrov'],
    ['name' => 'Oleg', 'surname' => 'Olegov'],
];
// $massiv massividagi name indexli elementlarni names ga nusxalab olish
$names = array_column($massiv, 'name');
print_r($names);
echo PHP_EOL;
*/

// count() , sizeof() - massiv elementlari soni
/*
$massiv = [5, 6, 7, [9, 10, 11]];
$massiv2 = [[9, 10]];
echo "Massivda ", count($massiv),
" ta element", (count($massiv) > 1 ? 'lar' : ''), " bor \n";
// rekursiv hamma elementlar soni COUNT_RECURSIVE yoki 1 yoziladi
echo "Massivda ", count($massiv, COUNT_RECURSIVE), " ta element", (count($massiv, COUNT_RECURSIVE) > 1 ? 'lar' : ''), " bor";
echo "\nMassivda ", count($massiv2, COUNT_RECURSIVE), " ta element", (count($massiv2, COUNT_RECURSIVE) > 1 ? 'lar' : ''), " bor";
echo PHP_EOL;
*/

// array_push() - massiv oxiriga element qo'shish
/*
$massiv = [1, 2, 3];
echo "Oldingi massiv: \n";
print_r($massiv);
echo PHP_EOL . "array_push() dan keyingi massiv: \n";
array_push($massiv, 4, 5, 6);
print_r($massiv);
*/

// array_pop - oxirgi elementni qirqib olish
/*
$massiv = [1, 2, 3];
echo "Oldingi massiv: \n";
print_r($massiv);
echo PHP_EOL . "array_pop() dan keyingi massiv: \n";
$oxirgi = array_pop($massiv);
print_r($massiv);
echo "Oxirgi qirqib olingan element = $oxirgi " . PHP_EOL;
*/

// array_diff - A massiv va B massiv orasidagi  farqlarni topadi
/*
$dasturlash1 = ["html", "css", "js", "php", "mysql", "Paskal"];
$dasturlash2 = ["html", "css", "js", "php", "mysql", "C++", "C#"];

echo "1-massiv: ";
print_massiv($dasturlash1);
echo PHP_EOL;

echo "2-massiv: ";
print_massiv($dasturlash2);
echo PHP_EOL . PHP_EOL;

echo "1-massivda yo'q 2-massivda bor elementlar: \n";
$dasturlash3 = array_diff($dasturlash1, $dasturlash2);
print_massiv($dasturlash3);
echo PHP_EOL;

echo "2-massivda yo'q 1-massivda bor elementlar: \n";
$dasturlash4 = array_diff($dasturlash2, $dasturlash1);
print_massiv($dasturlash4);
echo PHP_EOL;
*/

// array_flip - massiv key lari va value larini almashtiradi
/*
$dasturlash = ["html", "css", "js", "php", "mysql", "C++", "C#"];
echo "O'zgarmagan massiv: \n";
print_massiv($dasturlash);

$dasturlash2 = array_flip($dasturlash);
echo "O'zgargan massiv: \n";
print_massiv($dasturlash2);
*/

// array_merge - massivlarni birlashtirish
/*
$dasturlash1 = [1 => "html", 2 => "css", 'web' => "js", "php", "mysql", "C++", "C#"];

// oldingi massivdagi web keyini o'rnidagi js ga php yoziladi
$dasturlash2 = [1 => "html", 2 => "css", "js", 'web' => "php", "mysql", "C++", "C#"];

//  yangi massivga massivlarni qo'shish
$dasturlash3 = array_merge($dasturlash1, $dasturlash2);

echo "Eski massiv: \n";
print_massiv($dasturlash1);

echo "Yangi massiv: \n";
print_massiv($dasturlash2);
*/

// array_count_values() - elementlar takrorlanish sonlarini yangi massivga oladi
/*
$massiv = ['php', 'html', 'css', 'js', 'php', 'mysql', 'C++', 'C#', 'php', 'mysql', 'C++', 'C#'];
$dasturlash = array_count_values($massiv);
print_massiv($dasturlash);
echo PHP_EOL;
*/

// implode() - massiv elementlarini 1 dona string qiladi
/*
$massiv = ["Assalomu", "Alaykum", "O'zbekiston"];
$string1 = implode($massiv);    // qo'shish
$string2 = implode(", ", $massiv);  // vergul bilan qo'shish
echo $string1 . PHP_EOL;
echo $string2 . PHP_EOL;
echo PHP_EOL;
*/

//  explode() - string ni massiv qiladi
/*
$string = "Assalomu, Alaykum, O'zbekiston";
echo "String: $string \n";

$massiv = explode(",", $string);
echo "Massiv: \n";
print_massiv($massiv);
echo PHP_EOL;
*/

// array_combine() - 2 ta teng elementlarga ega massivdan yangi massiv hosil qiladi
/*
// bunda 1-massiv kaliti
// 2-massiv esa qiymati bo'ladi

$massiv1 = ["C++", "C#", "Java", "Python", "PHP", "JavaScript", "C"];
$massiv2 = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
$massiv3 = array_combine($massiv1, $massiv2);

echo "1-massiv: \n";
print_massiv($massiv1);

echo "2-massiv: \n";
print_massiv($massiv2);

echo "3-massiv: \n";
print_massiv($massiv3);
*/

// array_slice() - a massivdan b indexdan boshlab c dona element nusxalab massiv qaytaradi
/*
$massiv1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
$massiv2 = array_slice($massiv1, 2, 5);

echo "To'liq massiv: \n";
print_massiv($massiv1);

echo "2-dan boshlab 5 elementli massiv: \n";
print_massiv($massiv2);
*/

// array_splice() - massivdan biror element yoki bir nechta elementlarni o'chirish uchun
/*
// yoki boshqa qiymatga almashtirish yangi element qo'shadi

$massiv = ['php', 'html', 'css', 'js', 'php',
    'mysql', 'C++', 'C#', 'php', 'mysql', 'C++', 'C#'];

echo "O'zgarmagan massiv: \n";
print_massiv($massiv);

// I holat:
// $massiv dagi 2-indexdan boshlab 3 ta elementni qirqib qaytadi
$massiv2 = array_splice($massiv, 2, 3);

echo "O'zgargan massiv: \n";
print_massiv($massiv);

echo "Yangi massiv: \n";
print_massiv($massiv2);
echo PHP_EOL;

// II holat:
// 2-indexdan boshlab quyidagi eleemntlarni massiv orasiga joylaydi, joriy massivni o'zini o'zgartiradi
echo "O'zgarmagan massiv: \n";
print_massiv($massiv);
$temp_arr = ['| C |', '| C++ |', '| C# |'];
$massiv3 = array_splice($massiv, 2, 0, $temp_arr);
echo "Orasiga element qo'shilgan massiv: \n";
print_massiv($massiv);
echo PHP_EOL;

// III holat
// 1-massivni o'chirmay ma'lum string, o'zgaruvchi yoki massivni joylash
// bunda hech narsa o'chmaydi, orasiga "suqulib kiradi"
$massiv4 = array_splice($massiv, 1, 0, 'suqulib kirdi');
echo "O'zgargan massiv: \n";
print_massiv($massiv);
*/

// array_intersect() - 2 massivda mavjudlarini yangi massivga qaytaradi
// array_diff() ni teskarisi
/*
$massiv1 = ['php', 'html', 'css', 'js', 'php'];
$massiv2 = ['php', 'html', 'css', 'js', 'php',
    'mysql', 'C++', 'C#',];
$massiv3 = array_intersect($massiv1, $massiv2);

echo "\n1-massiv: \n";
prAr($massiv1);

echo "\n2-massiv: \n";
prAr($massiv2);

echo "\n1-massivda va 2-massivda mavjud elementlar: \n";
prAr($massiv3);
echo PHP_EOL;
*/

// array_unique() - massivdagi takrorlanuvchi qiymatlarni o'chirib yangi massivga qaytaradi
/*
$massiv1 = ['php', 'php', 'html', 'css', 'js', 'js'];
$massiv2 = array_unique($massiv1);

echo "\nDublikatli massiv: \n";
prAr($massiv1);

echo "\nDublikatsiz massiv: \n";
prAr($massiv2);
echo PHP_EOL;
*/

// extract() - keylar string bo'lsa shuncha dona o'zgaruvchi va unga qiymatlar hosil qiladi
/*
$massiv = ['name' => 'Ivan', 'surname' => 'Ivanov', 'age' => 25];
extract($massiv);   // har bir elementni shu key nomli alohida o'zgaruvchiga olish

print_r($massiv);
echo "name = $name \n";
echo "surname = $surname \n";
echo "age = $age \n";
*/

// compact() - o'zgaruvchilarni shunday nomli keylari bor massiv hosil qiladi
/*
$a = "assalomu";
$b = "alaykum";
$c = "o'zbekiston";
$massiv = compact('a', 'b', 'c');

echo "a = $a \n";
echo "b = $b \n";
echo "c = $c \n";

print_r($massiv);
echo PHP_EOL;
*/

// array_values() - string keyli indexlarni raqamli index qilib yangi massivga qaytaradi
/*
$massiv = ['a' => 'Ivan', 'b' => 'Ivanov', 'c' => 'Ivanovich'];
$massiv2 = array_values($massiv);

echo "Assotsiativ, o'zgarmagan massiv: \n";
print_massiv($massiv);

echo "Index li, o'zgargan massiv: \n";
print_massiv($massiv2);
*/

// array_keys() - keylardan yangi massiv qaytaradi
/*
$massiv = [
    'a' => 'Ivan', 'b' => 'Ivanov', 'c' => 'Ivanovich',
    'd' => 'Ivanovi', 'e' => 'Ivan', 'f' => 'Ivanof',
    'g' => 'Ivan', 'h' => "5", 'i' => 5
];

// I holat:
$massiv2 = array_keys($massiv);

echo "Key => value \n";
print_r($massiv);

echo "Key lardan tashkil topgan yangi massiv: \n";
print_r($massiv2);
echo PHP_EOL;


// II holat
// filtr qiymatli elementlarning
// kalitlaridan tashkil topgan yangi massiv

echo "Oddiy massiv: \n";
print_massiv($massiv);
echo PHP_EOL;

echo "Ivan qiymatli keylar massivi: \n";
$massiv3 = array_keys($massiv, 'Ivan');
print_r($massiv3);
echo PHP_EOL;


// III holat
// 5 ga tipi ham qiymati ham teng bo'lgan element kalitlaridan massiv hosil qiladi
$massiv4 = array_keys($massiv, 5, true);
echo "5 ga tipi ham qiymati ham teng bo'lgan element kalitlaridan massiv: \n";
print_r($massiv4);
*/

// array_key_exists() - massivda shunday keyli element bormi
/*
$massiv = [
    "dushanba" => 1,
    "seshanba" => 2,
    "chorshanba" => 3,
    "payshanba" => 4,
    "juma" => 5,
    "shanba" => 6,
    "yakshanba" => 7,
];

if (array_key_exists("chorshanba", $massiv)) {
    echo "Massivda chorshanba kaliti mavjud\n";
} else {
    echo "Masivda chorshanba kaliti yo'q\n";
}
*/

// array_rand()   tasodifiy n ta element tanlab
// massivga qaytaradi
/*
$massiv = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
$rand = array_rand($massiv, 3);
echo "Tasodifiy 3 ta element: \n";
print_r($rand);
echo PHP_EOL;
*/

// list() - massivdagi elementlarni alohida o'zgaruvchiga oladi tartib bilan
/*
$dasturlash = ["html", "css", "js", "php", "mysql", "C++", "C#"];
list          ($mysql, $cpp, $csharp) = $dasturlash;
echo "mysql = $mysql \n";   // $mysql = html
echo "cpp = $cpp \n";       // $cpp   = css
echo "csharp = $csharp \n"; // csharp = js
echo PHP_EOL;
*/

//  range() - x va y oralig'idagi qiymatlarga ega elementlarni massivga qaytaradi
//  range($start, $end, $step)
//  range($boshlanishi, $tugashi, $odim)
/*
$massiv = range(1, 20); // 1 dan 20 gacha sonlari bor massiv qaytardi
print_r($massiv);

// 1 dan 20 gacha har element 3 taga oshirilgan qiymatlarni massivga qaytaradi
$massiv2 = range(1, 20, 3);
print_r($massiv2);
echo PHP_EOL;

$harflar = range('a', 'z'); // a dan z gacha elementlarni qaytaradi
print_r($harflar);
echo PHP_EOL;
*/

// shuffle() - elementlarni random aralashtirib tashlaydi &void
/*
$massiv = range(0, 20);

echo "Random aralashtirilmagan massiv: \n";
print_r($massiv);
echo PHP_EOL;

echo "Random aralashtirilgan massiv: \n";
shuffle($massiv);
print_r($massiv);
echo PHP_EOL;
*/

// sort()   - massivni o'sish tartibida saralaydi : &void
/*
$massiv = range(0, 20);
//echo "Dastlabki massiv: \n";
//print_r($massiv);

shuffle($massiv);
echo "Aralashgan massiv: \n";
print_r($massiv);

sort($massiv);
echo "Saralangan massiv: \n";
print_r($massiv);

$harflar = range('a', 'z');
//echo "Dastlabki harflar: \n";
//print_r($harflar);

shuffle($harflar);
echo "Aralashgan harflar: \n";
print_r($harflar);

sort($harflar);
echo "Saralangan harflar: \n";
print_r($harflar);

$HARFLAR = range("A", "z");
print_r($HARFLAR);
echo PHP_EOL;

shuffle($HARFLAR);
echo "Aralashgan harflar: \n";
print_r($HARFLAR);

sort($HARFLAR);
echo "Saralangan harflar: \n";
print_r($HARFLAR);
echo PHP_EOL;
*/

// rsort() - massivni kamayish tartibida saralaydi : &void
// rsort() - sort() ni teskarisi, revers sorting
/*
$massiv = range(0, 20);
shuffle($massiv);
echo "Aralashgan massiv: \n";
print_r($massiv);
echo PHP_EOL;

rsort($massiv);
echo "Kamayib borish tartibida saralangan massiv: \n";
print_r($massiv);
echo PHP_EOL;
*/

// asort() - assotsiativ massiv kalitlarini o'zgartirmasdan qiymatlarini o'sish tartibida saralaydi
/*
$dasturlash1 = ["html", "css", "js", "php", "mysql", "C++", "C#"];

echo "Dastlabki massiv: \n";
print_r($dasturlash1);
echo PHP_EOL;

$dasturlash2 = [
    "web1" => "html", "web2" => "css",
    "web3" => "js", "backend1" => "php",
    "db" => "mysql", "backend2" => "C++",
    "windows" => "C#", "mobil" => "java"
];


echo "Assotsiativ saralanmagan massiv: \n";
print_r($dasturlash2);
echo PHP_EOL;


asort($dasturlash1); // kalitlar saralanmaydi, qiymatlar saralanadi
echo "Assotsiativ saralangan massiv: \n";
print_r($dasturlash1);
*/

// arsort() - assotsiativ massiv kalitlarini o'zgartirmasdan
// qiymatlarni kamayib borish tartibida saralaydi
/*
$massiv = [
    'bir' => '1', 'ikki' => '2',
    'uch' => '3', 'tort' => '4'
];

echo "oddiy massiv: \n";
print_r($massiv);
echo "\n";

shuffle($massiv);
echo "Aralashtriilgan massiv: ";
print_r($massiv);
echo "\n";

arsort($massiv);
echo "Qiymatlari kamayish tartibida saralangan assotsiativ massiv: \n";
print_r($massiv);
*/

// ksort() - kalitlarni o'sish tartibida saralaydi
// qiymatlar kalitlardan ajramaydi
/*
$massiv = [
    "i" => 9,
    "h" => 8,
    "g" => 7,
    "f" => 6,
    "e" => 5,
    "d" => 4,
    "c" => 3,
    "b" => 2,
    "a" => 10
];
echo "Dastlabki massiv: \n";
print_r($massiv);
echo PHP_EOL;

ksort($massiv);
echo "Kalitlari o'sish tartibida saralangan massiv: \n";
print_r($massiv);
echo PHP_EOL;
*/

// krsort() - kalitlarni kamayish tartibida saralaydi
// qiymatlar kalitlardan ajramaydi
// ksort() ni teskarisi
/*
$massiv = [
    "h" => 8,
    "i" => 9,
    "g" => 7,
    "e" => 5,
    "f" => 6,
    "c" => 3,
    "d" => 4,
    "a" => 10,
    "b" => 2
];
echo "Dastlabki massiv: \n";
print_r($massiv);
echo PHP_EOL;

krsort($massiv);
echo "Kalitlari kamayish tartibida saralangan massiv: \n";
print_r($massiv);
echo PHP_EOL;
*/

function print_massiv($massiv): void
{
    foreach ($massiv as $key => $value) {
        echo $key . " => " . $value . "\n";
    }
    echo PHP_EOL;
}

function prAr($massiv): void
{
    foreach ($massiv as $value) {
        echo $value . " ";
    }
    echo PHP_EOL;
}