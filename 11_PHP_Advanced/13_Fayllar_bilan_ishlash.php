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


go:
// fgetcsv  -  CSV fayllarni o'qiydi
