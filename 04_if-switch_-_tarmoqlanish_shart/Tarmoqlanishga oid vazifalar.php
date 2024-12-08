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
/* Eshmat ovqatlanmoqchi.
Uning N so'm puli bor.
- Oshni narxi 17500 so`m.
- Nonni narxi 1500 so’m.
- Salatni narxi 4000 so’m.
Eshmatning puli yuqoridagilarning qaysi
birilarini sotib olishiga yetishi aniqlang. */
/*
echo "\t7-masala:\n";

echo "Eshmatni yonida qancha pul bor: ";
$n = trim(fgets(STDIN));

// 1500 dan 4000 gacha bo'lsa nonga yetadi:
$non = $n >= 1_500 && $n < 4_000;

// 4000 dan 17_500 gacha salatga yetadi:
$salat = ($n >= 4_000) && ($n < 17_500);

// 17_500 va undan ko'p pul bo'lsa oshga yetadi:
$osh = $n >= 17_500;

switch ($n) {
    case $osh:
        echo "Oshga ";
    case $salat:
        echo "Salatga ";
    case $non:
        echo "Nonga ";
}
if ($non || $salat || $osh) {
    echo "pul yetarli.";
} else {
    echo "Ovqatlanishga pul yetarli emas.";
}
echo PHP_EOL . PHP_EOL;
*/

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
/*
echo "\t8-masala:\n";

do {
    echo "Eshmat matematikadan nechta to'g'ri ishladi: ";
    $n = intval(trim(fgets(STDIN)));
} while (!($n > 0 && $n < 31));

do {
    echo "Eshmat fizikadan nechta to'g'ri ishladi: ";
    $m = intval(trim(fgets(STDIN)));
} while (!($m > 0 && $m < 31));

do {
    echo "Eshmat ona tilidan nechta to'g'ri ishladi: ";
    $k = intval(trim(fgets(STDIN)));
} while (!($k > 0 && $k < 31));

$matematika = $n * 3.1;
$fizika = $m * 2.1;
$ona_tili = $k * 1.1;
$kirgan = '';

$grant = 160.4; // (15 * 3.1) + (15 * 2.1) + (15 * 1.1)
$contract = 100;
$supercontract = 56;

// ballar yig'indisi:
$sum = $matematika + $fizika + $ona_tili;

// grant = 160.4 <= ball
$grantga = $sum >= $grant;

// contract = grant > ball >= 100
$contractga = $sum >= $contract && $sum <= $grant;

//supercontract = contract > ball >= 56
$superkontraktga = $sum >= $supercontract && $sum <= $contract;

switch ($sum) {
    case $grantga :
        $kirgan = "Eshmat grantga kirdi";
        break;
    case $contractga:
        $kirgan = "Eshmat kontraktga kirdi";
        break;
    case $superkontraktga:
        $kirgan = "Eshmat superkontraktga kirdi";
        break;
    default:
        $kirgan = "Eshmat umuman kira olmadi";
}

//echo (15 * 3.1) + (15 * 2.1) + (15 * 1.1);    echo PHP_EOL;
echo '1 - usul: ' . $kirgan . PHP_EOL . PHP_EOL;

$kirgan2 = match (true) {
    $sum >= $grant => "Eshmat grantga kirdi",
    $sum >= $contract => "Eshmat kontraktga kirdi",
    $sum >= $supercontract => "Eshmat superkontraktga kirdi",
    default => "Eshmat umuman kira olmadi"
};
echo '2-usul: ' . $kirgan2 . PHP_EOL . PHP_EOL;
*/

// 9-masala:
/*  9-masala.
    Berilgan so`zni last_upper ikkita harfini o`rnini almashtiring.
Agar berilgan so`z 2 harfdan kam bo`lsa, so`zni o`zi chiqsin.
Misol: "Python" => "Pythno", "JS" => "SJ", "A" => "A"   */

// MASALA SHARTI VA MISOLDA HAR XIL!  MASALA SHARTIGA QARAB ISHLADIM
/*
echo "\t9-masala:\n";

echo "Matn kiriting: ";
$matn = strval(trim(fgets(STDIN)));

// matnni oxirgi 2 harfi:
$end = substr($matn, -2);

// katta harflarga o'tkazish:
$end = strtoupper($end);

// oxirgi 2 harfni o'rnini almashtirish:
$end = str_shuffle($end);
//echo $end . PHP_EOL;

// matnni qolgan qismi, oxirgi 2 harfdan tashqari:
$start = substr($matn, 0, -2);
//echo $start . PHP_EOL;

if (mb_strlen($matn) > 2) {
    $matn = $start . $end;
}

echo $matn . PHP_EOL . PHP_EOL;
*/


// 10-masala:
/*  Baytlarda ko'rsatilgan qiymat berilgan.
Baytdan: - gb - MB - KB ga o`tkazing.
Agar berilgan qiymat, 1 KB ga yetmasa bayt holatida chiqsin.
156 B => 156 B;
1056 B => 1.03 KB
10560 B => 10.31KB
1056000 B => 1.01 MB
MB ga yetsa MB da chiqsin, gb ga yetsa gb da chiqsin    */

echo "\t10-masala:\n";

do {
    echo "Bayt qiymati: ";
    // qabul qilingan malumotdan bo'shliqlarni olib tashlab,
    // xavfsizlik yuzasidan int tipiga o'tkazilsin:
    $scan_byte = (trim(fgets(STDIN)));
} while (!($scan_byte > 0));    // 0 dan katta bo'ladi

// qaysi o'lchov axborot o'lchov birligi necha baytligi:
$gb = 1024 ** 4;
$mb = 1024 ** 3;
$kb = 1024 ** 2;
$b = 1024;

// massiv elementidan chap tomonda turuvchi o'zgaruvchi:
$left_prefix = $scan_byte . ' B => ';

// massivning 1-elementi 1-kiritilgan qiymat:
$arr_data[] = $scan_byte . " B";

// 2- elementga nuqtadan keyin 2 xona yaxlitlab olish:
$arr_data[] = round($scan_byte / $kb, 2) . " KB";
$arr_data[] = round($scan_byte / $mb, 2) . " MB";
$arr_data[] = round($scan_byte / $gb, 2) . " gb";


for ($j = 0; $j < count($arr_data); $j++) {
    if ($arr_data[$j] < 1): unset($arr_data[$j]);
    endif;
}

// natijalarni chiqarish:
for ($i = 0; $i < count($arr_data); $i++) {
    // masala shartidagi kabi 0 dan katta
    // qiymatlardagi birliklarni chiqarilsin:
    echo $left_prefix . $arr_data[$i] . PHP_EOL;
}
echo PHP_EOL . PHP_EOL;


// 11-masala:
/*  11-masala.
Berilgan qiymat IP yoki IP emasligini aniqlang. Berilgan qiymat matn ko'rinishida.
"123.312.12.222" => IP emas
"123.212.12.222" => IP  */
echo "\t11-masala:\n";

/*
 * Для проверки IP-адресов важно учитывать несколько условий, которые позволяют определить, является ли строка допустимым IP-адресом. В PHP есть встроенная функция `filter_var()`, которая помогает валидировать IP-адреса.

---

### Основные условия для IP-адреса:
1. **Формат IPv4**:
   - Содержит 4 числа, разделённых точками.
   - Каждое число в диапазоне от `0` до `255`.
   - Пример: `192.168.1.1`.

2. **Формат IPv6**:
   - Представляет собой 8 групп по 4 символа (шестнадцатеричных).
   - Группы разделены двоеточиями `:`.
   - Может содержать сокращённый формат с пропущенными группами, например, `::1`.
   - Пример: `2001:0db8:85a3:0000:0000:8a2e:0370:7334`.

3. **Проверка публичного/приватного IP**:
   - Некоторые диапазоны зарезервированы для локальных или специальных сетей, например, `10.0.0.0/8`, `127.0.0.1` (localhost).

4. **Допустимость символов**:
   - Не допускаются пробелы, буквы (кроме IPv6), или специальные символы (например, `!@#$%^`).

---

### Как проверить IP-адрес в PHP:
PHP предоставляет удобную функцию `filter_var()` для валидации IP-адресов:

#### Пример проверки IPv4:
```php
<?php
$ip = "192.168.1.1";

if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4)) {
    echo "$ip — это допустимый IPv4-адрес.";
} else {
    echo "$ip — это невалидный IP-адрес.";
}
?>
```

#### Пример проверки IPv6:
```php
<?php
$ip = "2001:0db8:85a3:0000:0000:8a2e:0370:7334";

if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV6)) {
    echo "$ip — это допустимый IPv6-адрес.";
} else {
    echo "$ip — это невалидный IP-адрес.";
}
?>
```

#### Пример проверки публичного IP:
```php
<?php
$ip = "8.8.8.8";

if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE)) {
    echo "$ip — это публичный IP-адрес.";
} else {
    echo "$ip — это частный или специальный IP-адрес.";
}
?>
```

---

### Флаги для `filter_var`:
| Флаг                             | Описание                                                                 |
|----------------------------------|--------------------------------------------------------------------------|
| `FILTER_FLAG_IPV4`               | Проверяет, является ли адрес IPv4.                                       |
| `FILTER_FLAG_IPV6`               | Проверяет, является ли адрес IPv6.                                       |
| `FILTER_FLAG_NO_PRIV_RANGE`      | Исключает частные диапазоны (`10.0.0.0/8`, `192.168.0.0/16`, и т.д.).    |
| `FILTER_FLAG_NO_RES_RANGE`       | Исключает зарезервированные диапазоны (`127.0.0.0/8`, `0.0.0.0/8`).      |

---

Эти условия и методы позволяют эффективно валидировать IP-адреса и применять к ним нужные фильтры.
 */