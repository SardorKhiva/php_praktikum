<?php
/**
 * Foydalanuvchi: User
 * Loyiha nomi: PRAKTIKUM
 * Fayl nomi: 08_Cookie_bilan_ishlash.php
 * Fayl yaratilgan: 29.11.2025 11:36
 * Maqsad: PHP da cookie lar bilan ishlash
 */

goto resume;
/*
 * Cookie - bu server tomonidan foydalanuvchi qurilmasiga joylashitriladigan kichik fayl.
 * Har safar brauzerdan saytga murojaat qilinganida o'zi bilan birga cookie faylni ham yuboradi.
 * PHP orqali cookie larni hosil qilsa bo'ladi.
 * Cookie lar ma'lum bir domenga bog'langan bo'ladi.
 * Va shu domendagi sahifalarni ochganimizdagina serverga yuboriladi.
 * Brauzer orqali cookie larni saqlanmaydigan qilsa bo'ladi.
 * Cookie orqali user qaysi sahifalardan foydalaniyotganini bilish mumkin.
 */

// --------- Cookie hosil qilish

/*
setcookie(string $name,    // cookie nomi
          string $value,   // qiymati
          int $expire = 0, // 0 - brauzer yopilguncha saqlansin
          string $path = "", // qayerda saqlanish yo'li
          string $domain = "", // cookie saqlaydigan domen nomi
          bool $secure = false,
);  // true yoki false, true bo'lsa https orqali cookie dan foydalanadi
*/

//Asosiy (klassik) parametrlar (tugʻri tartib)
/*
setcookie(
    string $name,
    string $value = "",
    int $expires = 0,
    string $path = "",
    string $domain = "",
    bool $secure = false,
    bool $httponly = false
): bool
$name — cookie nomi


Identifikator. Belgilashda quyidagilarga eʼtibor: nom bo‘sh bo‘lmasligi kerak va =, ;,
boshqaruv belgilar (control chars) yoki bo‘shliq tavsiya etilmaydi.

Domen bo‘yicha har bir cookie`ning nomi noyob bo‘ladi (shunday qilib,
bir domenda bir xil nom bilan ikkita cookie bo‘lmaydi — oxirgisi ustiga yozadi).

$value — cookie qiymati (string)
PHP setcookie() qiymatni URL-encode qiladi. Agar xom qiymat kerak bo‘lsa setrawcookie() ishlatiladi.
Agar siz struktura (array/object) saqlamoqchi bo‘lsangiz — serialize yoki json_encode qilib qo‘ying.
Cheklov: cookie hajmi brauzer va server bo‘yicha ~4KB atrofida bo‘ladi (amalda 4096 baytga yaqin).

$expires — tugash vaqti (Unix timestamp, int)
0 bo‘lsa sessiya cookie (brauzer yopilganda o‘chadi).
Musbat timestamp berilsa — shu vaqtdan keyin cookie muomaladan chiqadi (odatda GMT).
O‘tmishdagi vaqt bersangiz cookie o‘chiriladi. Cookie o‘chirish uchun setcookie('name', '', time() - 3600) ishlatiladi.

$path — qaysi URL yo‘llarida cookie yuboriladi
Masalan "/" — butun domen bo‘ylab ishlaydi;
"/blog/" — faqat /blog/ va uning ichidagi sahifalarda yuboriladi.
Bu serverga yuborilish sohalarini cheklaydi (client browser so‘rov yuborayotganda).

$domain — cookie qaysi domen/subdomenlarda ishlaydi
Misol: "example.com" — example.com va barcha subdomenlar uchun ishlaydi
(historik jihatdan oldingi usullarda .example.com bilan boshlandi;
ko‘pgina brauzerlar ikkisini ham qabul qiladi).
Agar aniq subdomen (www.example.com) berilsa, faqat shu subdomen uchun bo‘ladi.
Xavfsizlik: boshqa domenlarga cookie yuborilmaydi (same-origin siyosati bilan cheklangan).

$secure — agar true bo‘lsa cookie faqat HTTPS orqali yuboriladi
Agar sayt HTTPS bo‘lmasa va secure=true qo‘ysangiz cookie brauzer tomonidan yuborilmaydi.

SameSite=None bilan birga ishlatilsa ko‘pchilik brauzerlar Secureni talab qiladi
— yaʼni SameSite=None bo‘lsa secure ham true bo‘lishi kerak.

$httponly — agar true bo‘lsa cookie JavaScript (document.cookie) orqali ko‘rinmaydi
Bu XSS hujumlarida cookie`ni oson o‘g‘irlashdan himoya qiladi
(masalan sessiya id sini JS orqali o‘qishga to‘sqinlik qiladi).
Ammo bu cookie serverga yuborilishini bloklamaydi — faqat mijozdagi JSga ko‘rinmaydi.

Yangi array-usul (PHP 7.3+): kengaytirilgan opsiyalar
setcookie("name", "value", [
    "expires"  => time() + 3600,   // int
    "path"     => "/",             // string
    "domain"   => "example.com",   // string
    "secure"   => true,            // bool
    "httponly" => true,            // bool
    "samesite" => "Lax"            // "Lax" | "Strict" | "None"
]);

Qoʻshimcha parametrlarning izohi:

samesite
Strict — cookie faqat birinchi tomon (same-site) so‘rovlar uchun yuboriladi.
Tashqi sayt orqali kelgan link bosilganda cookie yuborilmaydi.
Eng qatʼiy va CSRF xavfini kamaytiradi,
ammo tashqi saytlardan keladigan link orqali avtentikatsiyani mumkin qiyinlashtiradi.

Lax — ko‘proq muvozanat: GET navigatsiyalari (masalan tashqi saytdan link bosilganda) cookie yuborilishi mumkin,
ammo cross-site subrequests (masalan iframe, fetch XHR POST) da yuborilmaydi.
Ko‘p saytlar uchun tavsiya etilgan default.

None — cookie har doim yuboriladi (cross-site ham).
Brauzerlar uchun qoida: None belgilansa Secure=true bo‘lishi zarur (yaʼni faqat HTTPSda ishlaydi).
SameSite CSRFga qarshi kuchli himoya vositasi.

max-age (HTTP header maydon)
setcookie() opsiyalarida alohida max-age parametri yo‘q (PHP expires bilan ishlaydi),
lekin HTTP jihatdan Max-Age ham mavjud va bu sekundlarda yashash muddatini beradi.
expires va Max-Age ikkalasi ham brauzerlar tomonidan ishlatiladi (PHP avtomatik headerni mos yaratadi).
Agar siz aniq Max-Age qo‘ymoqchi bo‘lsangiz,
manual header yuborish yoki boshqa usullar kerak bo‘ladi.
(Amalda expires = time() + seconds yetadi.)
*/

$cookie_name = 'my_first_cookie';
$cookie_value = '998';
$expires = time() + 30;  // hozirgi vaqtdan boshlab 30 soniyadan keyin o'chsin
try {
    setcookie($cookie_name, $cookie_value, $expires);
    echo "1-cookie hosil qilindi!<br>";
} catch (Throwable $th) {
    echo $th->getMessage();
}

$cookie_name = 'second_cookie';
$cookie_value = 'cookie_val';
$expires = time() + 60;  // 1 daqiqa yashaydi
$path = '/';
$domain = '';
$secure = true;
$httponly = true;
try {
    setcookie($cookie_name, $cookie_value, $expires, $path, $domain, $secure, $httponly);
    echo "2-cookie hosil qilindi!<br>";
} catch (Throwable $th) {
    echo $th->getMessage();
}

// mavjud cookielar nomlari ro'yhati
echo "<pre>";
print_r($_COOKIE);
echo "</pre>";

if (!isset($_COOKIE[$cookie_name])) {
    echo "<b>" . $_COOKIE[$cookie_name] . "</b> nomli cookie mavjud emas!<br>";
} else {
    echo "<br>" . $_COOKIE[$cookie_name] . "</br> nomli cookie mavjud!<br>";
    echo 'cookie qiymati: ' . $cookie_value . "<br>";
}


// Cookie da massiv turidagi ma'lumotlarni saqlash
setcookie("matn[bir]", "cookie_1");
setcookie("matn[ikki]", "cookie_2");
setcookie("matn[uch]", "cookie_3", strtotime("1 minute"));

if (isset($_COOKIE['matn'])) {
    foreach ($_COOKIE['matn'] as $name => $value) {
        echo "<b> $name : </b> $value <br>";
    }
}

// Cookie yoqilgan yoqilmaganligini aniqlash
setcookie('test_cookie', 'test', time() + 60);

if (count($_COOKIE) > 0) {
    echo 'cookies on';
} else {
    echo 'cookies off';
}

resume:
// cookie ni o'chirish
setcookie('name', '', time() - 3600);  // hozirgi vaqtdan 3600 soniyani ayirib tashla