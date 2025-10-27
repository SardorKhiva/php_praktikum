<?php
/**
 * 5. Forma hosil qiling.
 * Kiritilgan qiymat telefon nomer
 * ekanligiga tekshiradigan
 * funksiya hosil qiling.
 * (Faqat o`zbekistondagi telefon raqamlariga tekshiring).
 * 998909999999 - beeline
 * +998971231233 - mobiuz
 * 9899899123 - telefon nomer emas
 */

$phone = '';
$phone2 = '';
$operator_nomi = '';

//  indexga mos prefixli operator yoki viloyat kodi to'g'ri kelsa
// shunday keyli massiv elementi bo'lsa
// telefon raqam shuniki
$prefix = [
    90 => "Bilayn", 91 => "Bilayn",
    33 => "Humans", 95 => "UzMobile",
    77 => "UzMobile GSM", 55 => "Ucell",
    93 => "Ucell", 94 => "Ucell", 88 => "Mobiuz",
    98 => "Perfectum", 71 => "Toshkent shahri",
    70 => "Toshkent viloyati", 74 => "Andijon viloyati",
    65 => "Buhoro viloyati", 72 => "Jizzah viloyati",
    75 => "Qashqadaryo viloyati", 69 => "Namangan viloyati",
    36 => "Navoiy viloyati", 66 => "Samarqand viloyati",
    76 => "Surxondaryo viloyati", 67 => "Sirdaryo viloyati",
    73 => "Farg'ona viloyati", 62 => "Xorazm viloyati"
];

// keraksiz belgilarni olib tashlash
function delChar($phone): string
{
    return preg_replace('/\D/', '', $phone); // faqat raqamlar qolsin
}

// 12 ta belgimi
function uzunlik12($phone): bool
{
    return strlen($phone) == 12;
}

// 13 ta belgimi
function uzunlik13(string $phone): bool
{
    return strlen($phone) == 13;
}

// Uzb nomeri ekanligini tekshirish
function uzb(string $phone): bool
{
    // 13 xona uzunlik va +998 dan boshlangan va oxirgi 9 belgi raqam bo'lsa yoki
    // 12 xona uzunlik va +998 dan boshlangan va oxirgi 9 belgi raqam bo'lsa 
    // telefon raqam O'zbekistonniki
    return (strlen($phone) == 13 && (str_starts_with($phone, '+998')) && is_numeric(substr($phone, -9))) ||
        (strlen($phone) == 12 && (str_starts_with($phone, '998')) && is_numeric(substr($phone, -9)));
}

// agar $_POST['phone'] bo'sh bo'lmasa
if (!empty($_POST['phone'])) {
    $phone = $_POST['phone'];

    // o'zgarmagan raqamdan nusxa
    $phone2 = $phone;
    // tekshirish uchun bazi joylarda echo orqali ko'rilgan
//    echo "Dastlabki phone = $phone <br>";

    // keraksiz belgilarni o'chirish
    $phone = delChar($phone);
//    echo "Probelsiz phone = $phone <br>";

    // agar telefon raqam O'zbekistonniki bo'lsa
    if (uzb($phone)) {
        $prefiks = null;        // prefix, 998 dan keyingi 2 ta raqam

        // agar telefon raqam uzunligi 12 xona bo'lsa
        if (uzunlik12($phone)) {
            // prefix 3-indexli belgidan boshlab 2 ta belgi bo'lsin
            $prefiks = substr($phone, 3, 2);

            // yoki agar 13 xonali bo'lsa 
        } else if (uzunlik13($phone)) {
            // 4-indexli belgidan boshlab 2 ta belgi bo'lsin
            $prefiks = substr($phone, 4, 2);
        } else {
            // aks holda
            $operator_nomi = "Bunday prefixli raqam mavjud emas <br>";
            return;
        }
//        echo "Prefiks = $prefiks <br>";
        if (array_key_exists($prefiks, $prefix)) {
            $operator_nomi = $prefix[$prefiks];
        } else {
            $operator_nomi = "Bu prefix O'zbekiston telefon raqamlarida uchramaydi <br>";
        }
//        echo "Operator_nomi = $operator_nomi <br>";
    } else {
        $operator_nomi = "Bu raqam O'zbekiston telefon raqami emas <br>";
    }
}
?>

<form method="post" style="padding: 50px">
    <label for="tel-number-id">
        Telefon raqam kiriting:
    </label>
    <br><br>

    <input type="text"
           required="required"
           autofocus="autofocus"
           style="width: 20%"
           id="tel-number-id"
           placeholder="O'zbekiston telefon raqamini kiriting"
           name="phone">
    <br><br>

    <input type="submit" value="Tekshirish"> <!-- Исправлено: добавлена закрывающая скобка -->
</form>

<p>
    <?php
    if (!empty($phone)) {
        echo "$phone2 raqami {$operator_nomi}niki. <br>";
    }
    ?>
</p>