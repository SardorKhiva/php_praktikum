<?php
/**
 * Foydalanuvchi: User
 * Loyiha nomi: PRAKTIKUM
 * Fayl nomi: 13_Fayllar_bilan_ishlash.php
 * Fayl yaratilgan: 30.11.2025 10:34
 * Maqsad: php da fayllar bilan ishlash
 */
goto go;

// fopen()  -  fayl hosil qilish
$fayl_nomi = 'test.txt';
$handle = fopen($fayl_nomi, 'w') or die('faylga yozib bo\'lmadi');
fclose($handle);  // faylni yopish
/*
fopen() MODE (REJIMLARI)

Quyidagi rejimlar faqat o‘qish, yozish yoki ikkala uchun ishlatiladi.

1) Faqat o‘qish rejimlari
'r'
Faqat o‘qish
Fayl bo‘lishi shart
Pointer boshiga qo‘yiladi

'r+'
O‘qish + yozish
Fayl bo‘lishi shart
Pointer boshiga qo‘yiladi

2) Yozish rejimlari
'w'
Faqat yozish
Fayl bo‘lmasa — yaratiladi
Fayl bo‘lsa — ichidagini 0 qilib o‘chiradi
Pointer boshiga qo‘yiladi

'w+'
O‘qish + yozish
Fayl bo‘lmasa — yaratiladi
Fayl bo‘lsa — ichidagini o‘chiradi (truncate)
Pointer boshida

3) Qo‘shimcha yozish (append) rejimlari
'a'
Faqat yozish
Fayl bo‘lmasa — yaratiladi
Fayl bo‘lsa — yozish oxiriga qo‘yiladi
Pointer oxirida

'a+'
O‘qish + yozish
Fayl bo‘lmasa — yaratiladi
Yozish har doim oxirida

4) Create-only rejimlari (fayl bo‘lsa xatolik beradi)
'x'
Faqat yozish
Fayl bo‘lsa — xato (Warning)
Fayl bo‘lmasa — yaratadi
Pointer boshida

'x+'
O‘qish + yozish
Fayl bo‘lsa — xato
Fayl bo‘lmasa — yaratadi

5) O‘zgartirmay ochish + yozish rejimlari
'c'
Faqat yozish
Fayl bo‘lmasa — yaratadi
Fayl bo‘lsa — o‘chirmaydi
Pointer boshida

'c+'
O‘qish + yozish
Fayl bo‘lsa — o‘chirmaydi
Fayl bo‘lmasa — yaratadi

6) Binar rejimlar (Windows uchun muhim)
Yuqoridagi barcha rejimlarga b qo‘shish mumkin:

'rb', 'wb', 'ab', 'rb+', 'wb+', 'ab+' va hokazo.

b — Windows’da CRLF konvertatsiyasining oldini oladi.

Linux’da farq yo‘q.
*/

$fayl_nomi2 = 'test2.txt';
$handle2 = fopen($fayl_nomi2, 'w+') or die('fayl hosil qilinmadi');
fwrite($handle2, "Sardor Dushamov\n");  // faylga yozish
fwrite($handle2, "PHP forewer\n");
fclose($handle2);


// fread()  -  faylni o'qish
$myfile = 'test2.txt';  // mavjud fayl nomi
$handle = fopen($myfile, 'r') or die("Faylni o'qib bo'lmadi");
$data = fread($handle, filesize($myfile));  // fayldagilarni string qilib oladi
print_r($data);  // string $data ni ochish
fclose($handle);

// unlink()  -  faylni o'chirish
$handle = fopen('unlink.txt', 'w+');

if (unlink('unlink.txt')) {
    echo 'unlink.txt deleted';
};
fclose($handle);


// FAYLLARGA OID ASOSIY FUNKSIYALAR
// chmod()  -  fayl premissions larini o'zgartirish
if (chmod('test.txt', 0600)) {
    echo "test.txt ni fayl egasigina yozishi va o'qishi mumkin\n";
}

if (chmod('test.txt', 0644)) {
    echo "egasi o'qish va yozish mumkin, boshqalar o'qiy oladi\n";
};

if (chmod('test.txt', 0755)) {
    echo "egasi hamma ish qiladi, boshqalar o'qish va ishga tushirishi mumkin\n";
};
/*
Eng ko‘p ishlatiladigan chmod kodlari (oddiy ro‘yxat)
Fayllar uchun:
0644   # egasi o‘qiydi/yozadi, boshqalar faqat o‘qiydi
0600   # faqat egasi o‘qiydi va yozadi
0666   # hamma o‘qiydi va yozadi

Papkalar uchun:
0755   # egasi to‘liq, boshqalar kirishi mumkin (standart)
0700   # faqat egasi to‘liq
0777   # hamma kiradi, yozadi, bajaradi (tavsiya etilmaydi)

To‘liq, ammo juda oddiy ruxsatlar
Kod	    Ma’no
0000	hech kim hech nima qila olmaydi
0600	egasi r/w
0644	egasi r/w, boshqalar r
0666	hamma r/w
0700	egasi r/w/x
0755	egasi r/w/x, boshqalar r/x
0777	hamma r/w/x
*/

// chown()  -  owner-fayl egasini o'zgartirish
if (chown('test.txt', 'SARDOR-LEADER')) {
    echo "test.txt egasi SARDOR-LEADER\n";
} else {
    echo "file owner not modified\n";
};


// copy()  -  fayldan ruxsat olish
if (copy('test2.txt', 'test2nusxa.txt'))  // 1-nusxa olinadigan fayl nomi, 2-nusxa fayl nomi
{
    echo "test3.txt fayli test2nusxa.txt ga nusxalandi \n";
}

// feof uchun test fayl
$fayl_nomi = 'feof_test.txt';
$handle = fopen($fayl_nomi, 'w+');
for ($i = 0; $i < 1_000; $i++) {
    echo "$i: ";
    fwrite($handle, "$i: ");

    echo date('Y.m.d H:i:s:v:u');
    fwrite($handle, date('Y.m.d H:i:s:v:u'));

    echo "\n";
    fwrite($handle, "\n");
}
fclose($handle);
echo "$fayl_nomi yaratildi\n";


// bool feof(resource $handle)  -  fayl oxiri ekanlgini tekshirish
// fayl oxiriga yetsa true, aks holda false

// faylni qatorlab o'qish va uni chiqarish
$fayl_nomi = 'feof_test.txt';

// faylni o'qish
$handle = fopen($fayl_nomi, 'r') or die('faylni ochib bo\'lmadi');

// qator tugaguncha har bir qatorni chiqarish
while (!feof($handle)) {
    $line = fgets($handle);     // fgets  -  file get string, faylni qatorlab o'qiydi
    echo $line;
}
fclose($handle);  // fayl bilan ishni yakunlash


// fgetc  -  faylni harflab o'qiydi
$fayl_nomi = 'feof_test.txt';
$handle = fopen($fayl_nomi, 'r') or die("$fayl_nomi faylini ochib bo'lmadi!\n");

while (!feof($handle)) {
    $line = fgetc($handle);
    echo $line . PHP_EOL;
}


// fgets  -  faylni qatorlab o'qiydi
$fayl_nomi = 'feof_test.txt';
$handle = fopen($fayl_nomi, 'r') or die('faylni ochib bo\'lmadi');
while (!feof($handle)) {
    $line = fgets($handle);
    echo $line;
}


// fgetcsv() — CSV faylidan bitta qatorni massiv sifatida o‘qib beradi.
// fgetcsv(file, length, separator, enclosure)  -  CSV fayllarni o'qiydi
// file - fayl nomi, length - uzunligi, separator - qaysi belgi bilan ajratiladi,
// fgetcsv(resource $stream, ?int $length = null, string $separator = ",", string $enclosure = "\"", string $escape = "\\"): array|false
$file = fopen('ismlar.csv', 'r');
$natija = fgetcsv($file, 0, ',', '"', '\\');
print_r($natija);

// CSV dagi barcha qatorlarni chiqarish
while (($row = fgetcsv($file, '0', ',', '"', '\\')) !== FALSE) {
    print_r($row);  // har 1 satrni massiv qilib chiqarish
}
fclose($file);


// file_exists():bool  -  fayl yoki katalog mavjudligini tekshirish
$filename = 'ismlar.csv';
if (file_exists($filename)) {
    echo $filename . ' fayli mavjud' . PHP_EOL;
} else {
    echo $filename . ' fayli mavjud emas' . PHP_EOL;
}


// array file(string $filename, int $flags = 0, ?resource $context = null)  -  faylning barcha qatorlarini massiv sifatida o‘qib beradi
$filename = 'feof_test.txt';
$lines = file($filename);
echo $filename . ' fayli qatorlari soni: ' . count($lines) . PHP_EOL;
foreach ($lines as $line) {
    echo $line;
}


// file_get_contents(string $filename, bool $use_include_path = false, ?resource $context = null, int $offset = 0, int $length = null): string|false
// butun faylning ichidagi ma’lumotni bitta string ga o'tkazaqi
$fileName = 'feof_test.txt';
$str = file_get_contents($fileName);
echo $str;
echo "Belgilar soni: " . mb_strlen($str);


// file_put_contents(string $filename, string|array|resource $data, int $flags = 0, ?resource $context = null): int|false
// faylga ma’lumot yozadi. Butun faylni boshidan yozadi yoki qo‘shimcha qiladi (flagga qarab).
$my_file = 'test.txt';
// $my_file fayliga, yangi qator yozuvini 0 dan yozish, fayl bo'lmasa hosil qilinadi
if (file_put_contents($my_file, 'yangi qator')) {
    echo "$my_file fayliga yangi qator yozildi\n";
}

// $my_file ga, "" ichidagi matnni yozish, pointer end - oxiridan
if (file_put_contents($my_file, "Bu matn file_put_contents() orqali yozildi\n", FILE_APPEND))  // FILE_APPEND - faylga yozuv yozishni oxiridan davom qildiradi boshidan yozmay
{
    echo "$my_file fayli oxiriga yozuv yozildi\n";
}

// LOCK_EX - faylni bloklab turish
if (file_put_contents($my_file, 'LOCK_EX test', FILE_APPEND | LOCK_EX)) {
    echo "$my_file fayli xavfsizlik uchun bloklandi va oxiriga yozildi\n";
}

// faylga massivni yozish
$data = ['Ali', 'Vali', 'Ahmad'];
if (file_put_contents('test.txt', implode("\n", $data))) {
    echo "Faylga massiv yozildi\n";
}

// massivni JSON sifatida yozish
$json_arr = [1 => 'Ali', 2 => 'Vali', 3 => 'Ahmad'];
if (file_put_contents('data.json', json_encode($json_arr, JSON_PRETTY_PRINT))) {
    echo "Faylga JSON qilib yozildi\n";
}


// filesize() - fayl hajmi
$myfile = 'test.txt';
echo filesize($myfile) . PHP_EOL;


// fputcsv(resource $handle, array $fields, string $separator = ",", string $enclosure = '"', string $escape = "\\")
// massivdagi ma’lumotlarni CSV formatida faylga yozadi.
/*
$handle — fopen() bilan ochilgan fayl resursi.
$fields — CSV ga yoziladigan massiv.
$separator — ustunlarni ajratuvchi belgi (default ,).
$enclosure — matnni qavsga olish belgisi (default ").
$escape — escape belgisi (default \).
*/

$list = [
        ['Ali', 'Vali', 'Ahmad'],
        ['321', '159', '357'],
        ['aaa', 'bbb', 'ccc', 'ddd']
];

// file.csv fayliga yozish, mavjud bo'lmasa hosil qilinadi
$handle = fopen('file.csv', 'w');

// har bir qatorni alohida siklda CSV faylga yozish
foreach ($list as $fields) {
    fputcsv($handle, $fields, ',', '"', "\\");
    print_r($fields);
    echo "\n";
}
fclose($handle);  // fayl bilan ishlashni tugatish


// is_dir()  -  katalogligini aniqlash
$item = '../Notion';  // bir katalog yuqorida shunday katalog bor edi
if (is_dir($item)) {
    echo "$item katalog\n";  // shuning uchun bu qismi ishlaydi
} else {
    echo "$item katalog emas\n";
}


// is_file() - fayl ekanligini aniqlash
$filename = 'test.txt';  // bu joyda bunday fayl bor edi
if (is_file($filename)) {
    echo "$filename - fayl\n";
} else {
    echo "$filename - fayl emas\n";
}


// yangi papka (directory) yaratadi.
//mkdir(string $pathname, int $mode = 0777, bool $recursive = false, resource $context = null): bool
/*
$pathname — yaratiladigan papkaning yo‘li.
$mode — ruxsatlar (permissions), default 0777.
$recursive — agar true bo‘lsa, yo‘lda mavjud bo‘lmagan papkalarni ham yaratadi.
$context — ixtiyoriy, fayl konteksti.
*/

$papka_nomi = 'tempFolders'; // papka nomi
if (mkdir($papka_nomi, 0755)) {  // 0755 - permission
    echo "$papka_nomi papkasi yaratildi\n";
} else {
    echo "$papka_nomi papkasi yaratilmadi\n";
}

if (mkdir('parent/child', 0777, true)) // true - recursive ichma ich papka ochish
{
    echo "parent/child papkalari yaratildi\n";
}

if (rmdir($papka_nomi)) {
    echo "$papka_nomi papkasi o'chirildi\n";
};


// scandir() - papkadagi fayllar ro'yhatini oladi
$papka_nomi = "D:/exe/";
$files1 = scandir($papka_nomi, SCANDIR_SORT_NONE);  // tartiblanmagan
$files2 = scandir($papka_nomi, SCANDIR_SORT_ASCENDING); // 1 - saralash
print_r($files1);
print_r($files2);


// move_uploaded_file(string $from, string $to): bool
// upload qilingan faylni vaqtinchalik joydan kerakli
// joyga ko‘chirish uchun ishlatiladigan asosiy va xavfsiz funksiya.
// Bu funksiya faqat upload orqali kelgan fayllarga ishlaydi ($_FILES[...]).

?>
    <form method="post" enctype="multipart/form-data">
        <input type="file" name="rasm">
        <button type="submit">Yuklash</button>
    </form>

<?php
if (isset($_FILES['rasm'])) {
    $tmp = $_FILES['rasm']['tmp_name'];
    $name = $_FILES['rasm']['name'];

    move_uploaded_file($tmp, 'uploads/' . $name);
}

if (isset($_FILES['rasm']) && isset($_FILES['rasm']['error']) === UPLOAD_ERR_OK) {
    $tmp = $_FILES['rasm']['tmp_name'];
    $name = basename($_FILES['rasm']['name']); // xavfsizlik uchun

    $target = __DIR__ . '/uploads/' . $name;
    if (move_uploaded_file($tmp, $target)) {
        echo 'Fayl yuklandi' . "<br>";
    } else {
        echo 'Fayl yuklanmadi' . "<br>";
    }
}

/*
Muhim eslatmalar

1. move_uploaded_file() faqat upload qilingan fayllarga ishlaydi.
Agar shunchaki faylni ko‘chirmoqchi bo‘lsang, rename() ishlatiladi.

2. uploads/ papkasi mavjud bo‘lishi kerak va unga yozish ruxsati bo‘lishi shart.

3. Fayl nomini har doim basename() orqali tozalash kerak — xavfsizlik uchun.

4. Faylni o‘zing xohlagan nom bilan saqlash mumkin:
*/

$newName = time() . ".jpg";
move_uploaded_file($tmp, "uploads/$newName");


// pathinfo() - fayl haqida ma'lumotlarni olish
$fayl = 'test.txt';
$path_info = pathinfo($fayl);
print_r($path_info);


// readfile(string $filename): int|false
// fayl mazmunini brauzerga chiqaradi
$fayl = 'file.csv';
readfile($fayl);  // darhol faylni chiqaradi

// bu kod $fayl ni yuklaydi
if (file_exists($fayl)) {
    header("Content-Description: File Transfer");
    header("Content-Type: application/octet-stream");
    header('Content-Disposition: attachment; filename="' . basename($fayl) . '"');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($fayl));
    readfile($fayl);
    exit;
}


// rename() - fayl yoki katalog nomini o'zgartiradi
rename('test', 'test.bak');  // 1-si eski nom, 2-si yangi, test papkasi test.bak bo'ldi


// rmdir() - papkani o'chiradi
if (rmdir(is_dir('test.bak'))) {  // papkaligi aniq bo'lsa o'chirilsin
    echo "test.bak folder deleted";
}


go:
// unlink() - faylni o'chiradi

if (unlink('test.txt')) {
    echo 'test.txt deleted successfully';
}