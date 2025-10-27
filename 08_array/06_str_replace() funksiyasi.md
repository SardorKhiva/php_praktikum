Ushbu funksiya "Matnlar bilan ishlash" mavzusiga oid. Lekin u mavzuda, o'quvchi hali massivlar haqida o'rganmagan bo'ladi.

Shuning uchun bu funksiyani massivlar mavzusida keltiryapmiz.

str_replace() funksiyasi 

Massivlar bilan ishlatish.
Ushbu masalada, berilgan matnda, $search massividagi birorta element topilsa, 
uni "" ga almashtirsin deyilgan.
Ishlash ketma ketligi quyidagicha:
- $search massividan 1 elementni oladi va matndan qidiradi
- topilsa, uni "" ga almashtiradi va matn yangilanadi
- keyingi qadamda $search massivdan 2-elementni oladi va yangilangan matndan qidiradi
- topilsa, uni "" ga almashtiradi va matn yangilanadi
- shu tariqa massiv elementlari hammasi matn bilan tekshiriladi

$search = array("a", "e", "i", "o", "u", "A", "el", "I", "O", "U");
$result = str_replace($search , "", "Hello World of PHP");
Natija: Hll Wrld f PHP

 

$search  = array('A', 'B', 'C', 'D', 'E');
$replace = array('B', 'C', 'D', 'E', 'F');
$subject = 'A';
echo str_replace($search, $replace, $subject);
Natija: F
// Natija F chiqadi.Chunki A harfi B ga almashtiriladi,
// keyin B harfi Cga, C hargi Dga... oxirida F ga almashtiriladi

 

$search = array('a', 'p');
$replace   = array('apple', 'pear');
$text    = 'a p';
$result = str_replace($search, $replace, $text);
echo $result;
- $search massividan 1-elementni oladi va matndan qidiradi
- 'a' harfi topildi va 'a' harfini 'apple' ga almashtiradi
- matnning yangi holati quyidagicha: yani $text = 'apple p'
- endi massivning 2-elementini $text ('apple p')dan qidiradi
- demak matnda 3 ta joyda 'p' harfi ishlatilgan
- shu ishlatilganlarni almashtiriladi
- oxirgi natija - 'apearpearle pear'