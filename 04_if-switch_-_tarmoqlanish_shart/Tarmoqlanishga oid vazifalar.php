<?php
// masalani ishlatish uchun ctrl bilan - ni bosib commentdan chiqaring

// 1-masala:
/* Masala berilishi:
Berilgan son musbat yoki manfiy ekanligini aniqlang.
Agar berilgan son 0 bolsa, 0 kiritdingiz deb;
Agar manfiy bo`lsa, manfiy son deb;
Agar musbat bo`lsa musbat son deb chiqsin. */
/*
echo "\t1-masala:\n";
echo 'Son kiriting: ';
$son = fgets(STDIN);
if (is_numeric($son)) {
    if ($son > 0):
        echo "$son musbat son\n";
    elseif ($son < 0):
        echo "$son manfiy son\n";
    else:
        echo 'Son 0 ga teng' . PHP_EOL;
    endif;
} else {
    echo 'Son kiriting!' . PHP_EOL;
}
echo PHP_EOL;
*/

// 2-masala:
/* N soni berilgan (1-7 gacha).
Berilgan songa mos hafta kunini chiqaring.
Misol: N=4 => Natija: Payshanba
(if va switch ikkalasida ham bajaring)  */
/*
echo "\t2-masala:\n";
print 'Hafta kuni tartib raqamini kiriting: ';
$N = fgets(STDIN);

echo 'if orqali: ';
if (is_numeric($N) && $N > 0 && $N < 8):
    if ($N == 1): echo "Dushanba";
    elseif ($N == 2): echo "Seshanba";
    elseif ($N == 3): echo "Chorshanba";
    elseif ($N == 4): echo "Payshanba";
    elseif ($N == 5): echo "Juma";
    elseif ($N == 6): echo "Shanba";
    elseif ($N == 7): echo "Yakshanba";
    endif;
endif;
echo PHP_EOL;

echo 'switch orqali: ';
switch ($N % 7) {
    case 1:
        echo "Dushanba";
        break;
    case 2:
        echo "Seshanba";
        break;
    case 3:
        echo "Chorshanba";
        break;
    case 4:
        echo "Payshanba";
        break;
    case 5:
        echo "Juma";
        break;
    case 6:
        echo "Shanba";
        break;
    case 7:
        echo "Yakshanba";
        break;
}
echo PHP_EOL;
*/

// 3-masala:
/*  3-masala.
Berilgan so`zni last_upper 3 ta harflarini,
katta harfga aylantiring.
Agar so`zning harflari soni 3 tadan kichik bo`lsa
barchasini katta harfga aylantiring.
Misol: "sardoroga"=>"sardorOGA", "js" => "JS".  */
echo "\t3-masala:\n";
echo "matn kiriting: ";
$matn = trim(fgets(STDIN));

$last_upper = strtoupper(substr($matn, -3));

// oxirgi 3 ta belgidan boshqa pozitsiyalar soni:
$last = mb_strlen($matn) - mb_strlen($last_upper);  //echo $last . PHP_EOL;


echo "last_upper: $last_upper\n";


// 4-masala:
/*  4-masala.
Berilgan so`zning boshlang`ich va last_upper harflarini tekshiradigan dastur qiling.
Agar so`z O harfi bilan boshlansa "OleOle" deb chiqarsin.
Agar so`z A harfi bilan tugasa "GoGo" deb chiqarsin.
Agar so`z O harfi bilan boshlanib, A harfi bilan tugasa: "OleOleGoGo" chiqsin.
Boshqa holatlarda so`zning o`zi chiqsin.
IF va SWITCH ikkalasi bilan ham qilinsin    */
echo "\t4-masala:\n";


// 5-masala:
/*  5-masala.
4 ta son berilgan. Shulardan nechtasi musbat va nechtasi manfiyligini aniqlang. */
echo "\t5-masala:\n";

// 6-masala:
/*  6-masala.
Eshmat do`kondan kiyim kechak harid qildi.
Harajatlarining summasi N so`m.
Harid qilib kassani oldiga borsa,
agar harid qilgan narsalaringizni narxi
300 ming so`mdan ko`p bo`lsa, 10% chegirma,
agar 500 ming so`mdan ko`p bo’lsa 20% chegirma bor ekan.
Eshmat sotib olgan haridlariga qancha to’laganini aniqlang.   */
echo "\t6-masala:\n";

// 7-masala:
/*  7-masala.
Eshmat ovqatlanmoqchi. Uning N so'm puli bor.
- Oshni narxi 17500 so`m.
- Nonni narxi 1500 so’m.
- Salatni narxi 4000 so’m.
Eshmatning puli yuqoridagilarning qaysi birilarini sotib olishiga yetishi aniqlang. */
echo "\t7-masala:\n";


// 8-masala:
/*  8-masala.
Eshmat instutga kirish uchun imtihon topshirdi.
- Matematika - 3.1 ball.
- Fizika - 2.1 ball.
- Ona tili - 1.1 ball.
Grantga kirish uchun eng past ball 160.4 ball.
Kontraktning eng past bali 100 ball.
Superkontraktning eng past bali 56 ball.
Eshmat: - Matematikadan N ta to’g’ri ishladi
- Fizikadan M ta to’g’ri ishladi
- Ona tilidan K ta to’g’ri ishladi
Eshmat o’qishga grantga kirdimi yoki kontraktgami?
Yoki superkonrtaktgami?
Yoki umuman kira olmadimi?
Shuni aniqlang. */
echo "\t8-masala:\n";

// 9-masala:
/*  9-masala.
    Berilgan so`zni last_upper ikkita harfini o`rnini almashtiring.
Agar berilgan so`z 2 harfdan kam bo`lsa, so`zni o`zi chiqsin.
Misol: "Python" => "Pythno", "JS" => "SJ", "A" => "A"   */
echo "\t9-masala:\n";

// 10-masala:
/*  10-masala.
Baytlarda ko'rsatilgan qiymat berilgan.
Baytdan: - GB - MB - KB ga o`tkazing.
Agar berilgan qiymat, 1 KB ga yetmasa bayt holatida chiqsin.
156 B => 156 B;
1056 B => 1.03 KB
10560 B => 10.31KB
1056000 B => 1.01 MB
MB ga yetsa MB da chiqsin, GB ga yetsa GB da chiqsin    */
echo "\t10-masala:\n";

// 11-masala:
/*  11-masala.
Berilgan qiymat IP yoki IP emasligini aniqlang. Berilgan qiymat matn ko'rinishida.
"123.312.12.222" => IP emas
"123.212.12.222" => IP  */
echo "\t11-masala:\n";