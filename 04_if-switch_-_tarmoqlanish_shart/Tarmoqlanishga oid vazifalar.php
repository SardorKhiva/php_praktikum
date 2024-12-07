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
/*
echo "\t3-masala:\n";
echo "matn kiriting: ";
$matn = trim(fgets(STDIN));

// oxirgi 3 ta harf va qolgan qismini o'zida saqlovchi o'zgaruvchi:
$start = $end = "";

// agar matndagi harflar soni 4 dan kam bo'lsa
// hammasi katta harflarga o'tsin:
$uzunlik = mb_strlen($matn);
if ($uzunlik < 4) {
    $matn = strtoupper($matn);
} else {
    // oxirgi 3 harfni katta harfga o'tkazish:
    $end = strtoupper(substr($matn, -3));

    // oxirgi 3 ta belgidan boshqa belgilar soni:
    $start_char = mb_strlen($matn) - 3;

    // oxirgi 3 ta  belgidan boshqa harflarni olish:
    $start = substr($matn, 0, $start_char);

    // katta harfli qism + kichik harfli qism = matn:
    $matn = $start . $end;
}
echo $matn . PHP_EOL . PHP_EOL;
*/

// 4-masala:
/*  4-masala.
Berilgan so`zning boshlang`ich va last_upper
harflarini tekshiradigan dastur qiling.
Agar so`z O harfi bilan boshlansa "OleOle" deb chiqarsin.
Agar so`z A harfi bilan tugasa "GoGo" deb chiqarsin.
Agar so`z O harfi bilan boshlanib, A harfi bilan tugasa: "OleOleGoGo" chiqsin.
Boshqa holatlarda so`zning o`zi chiqsin.
IF va SWITCH ikkalasi bilan ham qilinsin    */

/*
echo "\t4-masala:\n";

echo "So`z kiriting: ";
$soz = trim(fgets(STDIN));
$soz2 = $soz;

$last_upper = substr($soz, -1);
$first_upper = substr($soz, 0, 1);

// boshdagi harf O va oxirgi harf A ekanligini tekshirish:
$OA_ok = $first_upper == 'O' && $last_upper == 'A';

// oxirgi harf A ekanligi:
$A_ok = $last_upper == 'A';

// 1-harf O ekanligi:
$O_ok = $first_upper == 'O';

echo 'if orqali: ' . PHP_EOL;
if ($OA_ok) {
    $soz = "OleOleGoGo";
} elseif ($A_ok) {
    $soz = "GoGo";
} elseif ($O_ok) {
    $soz = "OleOle";
}
echo $soz . PHP_EOL;

echo 'switch orqali: ' . PHP_EOL;
switch ($soz2) {
    case $O_ok:
        $soz2 = "OleOleGoGo";
        break;
    case $A_ok:
        $soz2 = "GoGo";
        break;
    case $O_ok:
        $soz2 = "OleOle";
        break;
}
echo $soz2 . PHP_EOL;
*/

// 5-masala:
/*  5-masala.
4 ta son berilgan.
Shulardan nechtasi musbat va nechtasi manfiyligini aniqlang. */
/*
echo "\t5-masala:\n";

$son = array(0, 0, 0, 0);
$musbat = 0;
$manfiy = 0;

echo '4 ta son kiriting: ' . PHP_EOL;
for ($i = 0; $i < count($son); $i++) {
    $son[$i] = trim(fgets(STDIN));
    if ($son[$i] > 0) {
        $musbat++;
    } elseif ($son[$i] < 0) {
        $manfiy++;
    }
    if (!is_numeric($son[$i])) {
        echo 'Son kiriting!' . PHP_EOL;
        exit;
    }
}
echo 'Musbat sonlar soni: ' . $musbat . PHP_EOL;
echo 'Manfiy sonlar soni: ' . $manfiy . PHP_EOL;
echo PHP_EOL . PHP_EOL;
*/

// 6-masala:
/*  6-masala.
Eshmat do`kondan kiyim kechak harid qildi.
Harajatlarining summasi N so`m.
Harid qilib kassani oldiga borsa,
agar harid qilgan narsalaringizni narxi
300 ming so`mdan ko`p bo`lsa, 10% chegirma,
agar 500 ming so`mdan ko`p bo’lsa 20% chegirma bor ekan.
Eshmat sotib olgan haridlariga qancha to’laganini aniqlang.   */
/*
echo "\t6-masala:\n";

echo "Harajatlar jami: ";
$n = trim(fgets(STDIN));
if (is_numeric($n)) {
    if ($n > 300_000 && $n <= 500_000) {
        $n = $n - ($n / 10);
    } elseif ($n > 500_000) {
        $n = $n - ($n / 20);
    }
}
echo "Eshmat {$n} so'mlik harajat qildi" . PHP_EOL . PHP_EOL;
*/

// 7-masala:
/*  7-masala.
Eshmat ovqatlanmoqchi. Uning N so'm puli bor.
- Oshni narxi 17500 so`m.
- Nonni narxi 1500 so’m.
- Salatni narxi 4000 so’m.
Eshmatning puli yuqoridagilarning qaysi birilarini sotib olishiga yetishi aniqlang. */
echo "\t7-masala:\n";

echo "Eshmatni yoniga yeb-ichish uchun qancha berasiz: ";
$choy_chaqa = trim(fgets(STDIN));

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