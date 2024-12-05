<?php

// matn baytlarini hisoblash:
// ASCII dagi belgilar 1 bayt hisoblangani uchun,
// lotin harflarini 1 sini 1 baytdan hisoblaydi
// va belgilar sonini ham ASCII doirasida aniqlaydi
$str = "Sardor Xorazmiy";
echo "$str = " . strlen($str) . PHP_EOL;
echo PHP_EOL;

$str2 = "  Sardor Xorazmiy  ";
echo "$str2 = " . strlen($str2) . PHP_EOL;
echo PHP_EOL;

// matndagi belgilar sonini aniqlash:
echo "$str2 = " . mb_strlen($str2) . PHP_EOL;
echo PHP_EOL;

// harflarni kichik qilish:
$str_lower = strtolower($str);
echo $str_lower . PHP_EOL;
echo PHP_EOL;

// harflarni katta qilish:
echo strtoupper($str) . PHP_EOL;
echo PHP_EOL;

// satrni 1-harfini katta qilish:
echo ucfirst($str_lower) . PHP_EOL;
echo PHP_EOL;

// matndan ma'lum indexli parchalarni olish:
//  S   a   r   d   o   r
//  0   1   2   3   4   5
// -6  -5  -4  -3  -2  -1

$ismim = 'Sardor';
echo substr($ismim, 0) . PHP_EOL;
echo substr($ismim, 1) . PHP_EOL;
echo substr($ismim, 2) . PHP_EOL;
echo substr($ismim, 3) . PHP_EOL;
echo substr($ismim, 4) . PHP_EOL;
echo substr($ismim, 5) . PHP_EOL;
echo substr($ismim, -1) . PHP_EOL;
echo substr($ismim, -2) . PHP_EOL;
echo substr($ismim, -3) . PHP_EOL;
echo substr($ismim, -4) . PHP_EOL;
echo substr($ismim, -5) . PHP_EOL;
echo substr($ismim, -6) . PHP_EOL;
// chegaradan oshib ketsa ham hammasini ko'rsataveradi:
echo "Oxiri = " . substr($ismim, -7) . PHP_EOL;
echo PHP_EOL;

// qidirilayotgan belgi pozitsiyasi:
$str = "Sardor Xorazmiy";
echo strpos($str, "r") . PHP_EOL;
// registr farq qiladi:
echo strpos($str, "R") . PHP_EOL; // hechnarsa chiqmaydi

// 4-pozitsiyadan keyin a ni qidirish:
echo strpos($str, "a", 4) . PHP_EOL;
echo PHP_EOL;

// strrpos = o'ngdan qidirilayotgan belgi pozitsiyasi:
//echo "strrpos = o'ngdan qidirilayotgan belgi pozitsiyasi:\n";
echo strrpos($str, "r") . PHP_EOL;
echo PHP_EOL;

// strripos - oxirdan qidirilayotgan belgini registrga qaramay qidiradi:
echo strripos($str, "a") . PHP_EOL;
echo strripos($str, "A") . PHP_EOL;
echo PHP_EOL;

// stripos - qidirilayotgan belgini
// registrga qaramay qidiradi:
echo stripos($str, "A") . PHP_EOL;

// str_shuffle - satrdagi belgilarni o'rnini almashtirish:
echo str_shuffle($str) . PHP_EOL;
echo PHP_EOL;

//str_replace matnni bir qismini boshqasi bilan almashtirish:
// qidirilayotgan_so'z, o'rniga yoziladigan so'z, qayerga?:
echo str_replace("Xorazmiy", "Xivaqiy", $str) . PHP_EOL;
echo PHP_EOL;

// o'zgarishlar sonini saqlash:
$count = 0;

$str1 = "Salom Dunyo, Dunyojon";

// nimani, nimaga, qaysi birini, necha marta o'zgardi:
$new = str_replace("Dunyo", "Xorazm", $str1, $count);
echo $new . PHP_EOL;
echo PHP_EOL;

// MD5 hesh shifrlash:
echo "MD5 dan oldin: ";
echo $ismim . PHP_EOL;
echo "MD5 dan keyin: " . md5($ismim) . PHP_EOL;
echo PHP_EOL;

// htmlspecialchars - html belgilar(teg+belgi)ni ko'rsatish:
$tag = "<h1>Sardor Xorazmiy</h1>";
echo htmlspecialchars($tag) . PHP_EOL;
echo PHP_EOL;

// matndan html teglarni olib tashlash:
$tag = "<h1> <b>Sardor Xorazmiy</b> </h1>";
echo strip_tags($tag) . PHP_EOL;
// b tegini qoldirish:
echo strip_tags($tag, "<b>") . PHP_EOL;
echo PHP_EOL;

//substr_count - qidirilayotgan satr satrda nechta joydaligini aniqlash:
// registrga bog'liq:
$satr = "Suvni ta'mi muz bilan. 
Suv obi hayot, suv obi hayot";
echo substr_count($satr, 'suv') . PHP_EOL;
echo substr_count($satr, 'Suv') . PHP_EOL;

// 2-pozitsiyadan boshlab qidirish:
echo substr_count($satr, 'suv', 2) . PHP_EOL;

// trim - matnni 2 tarafidan probel va
// kiritilgan belgilarni olib tashlash:
$satr = ' Sardor ';
echo $satr . PHP_EOL;
echo trim($satr) . PHP_EOL;
echo PHP_EOL;


// ltrim chapdan, rtrim o'ngdan kesadi

// str_word_count - satrdagi so'zlar soni:
$satr = "Suvni ta'mi muz bilan. 
Suv obi hayot, suv obi hayot";
echo str_word_count($satr) . PHP_EOL;
echo PHP_EOL;

// strstr
// satrdan satrni qidiradi va topilgan pozitsiyadan boshlab
// oxirgacha aniqlaydi:
$satr = "Sardor Xorazmiy";

// X ni topadi va X dan oxirgacha ko'rsatadi:
echo strstr($satr, "X") . PHP_EOL;

// true bo'lsa boshidan X gacha:
echo strstr($satr, "X", false) . PHP_EOL;

// false bo'lsa X dan oxirgacha:
echo strstr($satr, "X", true) . PHP_EOL;
echo PHP_EOL;