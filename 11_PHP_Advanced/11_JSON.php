<?php
/**
 * Foydalanuvchi: User
 * Loyiha nomi: PRAKTIKUM
 * Fayl nomi: 11_JSON.php
 * Fayl yaratilgan: 29.11.2025 20:28
 * Maqsad: JSON  -  JavaScript Object Notation
 */
goto resume;

/*
 * JSON - JavaScript asosida ishlab chiqilgan
 * ma'lumotlarni almashish uchun text formati.
 * JSOn ham mustaqil tildir va uni boshqa dasturlash tillari bila nishlatish mumkin.
 */

//JSON ga misol
/*
{
    "first_name" : "Sardor",
    "last_name" : "Dushamov",
    "location" : "Tashkent",
    "websites" :
    {
        "description" : "work",
        "url" : "https://mohirdev.uz"
    },
    {
        "description" : "tutorials",
        "url" : "https://mohirdev.uz/php"
    }
}
*/


// json_encode() - ma'lumotni JSON formatga o'tkazadi
$mevalar = ['olma', 'anor', 'gilos', 'shaftoli'];
print_r($mevalar);
/* Natija:
Array
(
    [0] => olma
    [1] => anor
    [2] => gilos
    [3] => shaftoli
)
*/

print_r(json_encode($mevalar));
/*
Natija:
["olma","anor","gilos","shaftoli"]
*/


$mevalar = [1 => 'olma', 2 => 'anor', 3 => 'uzum'];
print_r($mevalar);
/*
Natija:
Array
(
    [1] => olma
    [2] => anor
    [3] => uzum
)
*/

print_r(json_encode($mevalar));
/* natija:
{"1":"olma","2":"anor","3":"uzum"}
*/


// json_decode()  -  JSON formatidagi ma'lumotni object yoki massivga aylantiradi
$json_obj = '{"1" : "olma", "2" : "gilos", "3" : "shaftoli"}';
print_r(json_decode($json_obj));

// hosil bo'lgan php object dan foydalanish
$json_obj = '{"meva_1" :  "olma", "meva_2" : "anor", "meva_3" : "uzum"}';
$mevachalar = json_decode($json_obj);
echo $mevachalar->meva_1;   // mevachalar obyektining 3-atributini chiqarish
// Natija: // object return
/*
stdClass Object
(
    [1] => olma
    [2] => gilos
    [3] => shaftoli
)
*/


// json_decode da 2-parametr bo'lmasa default false bo'ladi va object qiladi,
// true yozilsa massiv qaytaradi

$json_obj = '{"1" : "olma", "2" : "banan"}';
$decode = json_decode($json_obj, true); // true bo'lsa massiv, aks holda object
print_r($decode);
/*
Array
(
    [1] => olma
    [2] => banan
)
*/

// assoc massivdan foydalanish
$json_obj = '{"meva_1" : "olma", "meva_2" : "anor", "meva_3" : "nok"}';
$mevalar = json_decode($json_obj, true);
echo $mevalar['meva_2'];


resume:
// json_decode() natijani foreach da ishlatish
$json_obj = '{"meva_1" : "uzum", "meva_2" : "banan"}';
$mevalar = json_decode($json_obj, true);
foreach ($mevalar as $key => $value) {
    echo $key . " => " . $value . "<br>\n";
}
/*
meva_1 => uzum
meva_2 => banan
*/