<?php
echo "1 - 14 ta masala orasidan bittasini tanlang: ";
$masala = fgets(STDIN);
$correct = (is_numeric($masala)) && ($masala > 0 && $masala < 15);
if ($correct) {
    switch ($masala) {
        case 1:
            masala_01();
            break;
        case 2:
            masala_02();
            break;
        case 3:
            masala_03();
            break;
        case 4:
            masala_04();
            break;
        case 5:
            masala_05();
            break;
        case 6:
            masala_06();
            break;
        case 7:
            masala_07();
            break;
        case 8:
            masala_08();
            break;
        case 9:
            masala_09();
            break;
        case 10:
            masala_10();
            break;
        case 11:
            masala_11();
            break;
        case 12:
            masala_12();
            break;
        case 13:
            masala_13();
            break;
        case 14:
            masala_14();
            break;
    }
} else {
    echo "Iltimos, skriptni qaytadan ishga tushirib 0 va 15 oarasidagi masalalardan birini tanlang!\n";
}
function masala_01(): void
{
    /* 1-masala.
    $text nomli o`zgaruvchi hosil qiling va unga "Salom dunyo!" qiymatini bering.
    $text ning qiymatini ekranga chiqaring. */
    echo "\t1-masala:\n";

    $text = "Salom dunyo!";
    echo $text . PHP_EOL;
    print $text . PHP_EOL;
}

function masala_02(): void
{
    /* 2-masala.
    Ikkita o`zgaruvchi hosil qiling $text1 = "Salom, " va $text2 = "dunyo!";
    Ekranga "Salom, dunyo!" chiqsin. */
    echo "\t2-masala:\n";

    $text1 = "Salom, ";
    $text2 = "dunyo!";
    echo $text1 . $text2 . PHP_EOL;
}

function masala_03(): void
{
    /* 3-masala.
    $ism nomli o`zgaruvchi hosil qiling va unga qiymat sifatida o`zingizni
    ismingizni bering. Masalan: "Eshmat".
    Ismingiz nechta harfdan iborat bo`lsa ekranga chiqaring.
    "Eshmat: 6ta harfdan iborat" */
    echo "3-masala:\n";
    $ism1 = "Sardor";
    echo "Ismimdagi baytlar hajmi = " . strlen($ism1) . PHP_EOL;
    echo "Ismimdagi harflar hajmi = " . mb_strlen($ism1) . PHP_EOL;

    $ism2 = "Сардор";
    echo "Ismimdagi baytlar hajmi = " . strlen($ism2) . PHP_EOL;
    echo "Ismimdagi harflar hajmi = " . mb_strlen($ism2) . PHP_EOL;
}

function masala_04(): void
{
    /* 4-masala.
    Ismingizdagi oxirgi 3 ta harfni ekranga chiqaring.
    Masalan: "Eshmat". Natija: "mat" */

    echo "4-masala:\n";

    $ism1 = "Sardor";

    // 3- indexdan boshlab 3 ta belgini olish:
    echo substr($ism1, 3, 3) . PHP_EOL;

    // oxirdan boshlab 3 ta beligini olish, universalroq usul:
    echo substr($ism1, -3) . PHP_EOL;
}

function masala_05(): void
{
    /* 5-masala.
    "Bugun ob havo yaxshi" - ushbu matnda "havo" so`zi bor yo`qligini aniqlang. */
    echo "5-masala:\n";

    $havo = "Bugun ob havo yaxshi";

    echo "$havo matnida havo so'zi borligi = " . str_contains($havo, "havo");
}

function masala_06(): void
{
    /* 6-masala.
    $data = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcefghijklmnopqrstuvwxyz';
    Ushbu ma'lumotdan 8 xonali parol hosil qiling. Harflar joylashuvi har xil bo`lsin. */
    echo "6-masala:\n";

    $data = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcefghijklmnopqrstuvwxyz';

    // data ni massiv ga nusxalaymiz;
    $massiv = str_split($data); //print_r($massiv);

    $natija = "";

    // 1-usul:

    // massivdagi 1-element:
//    $element_first = reset($massiv); //echo $element_first . PHP_EOL;

    // massivdagi oxirgi element:
//    $element_last = end($massiv); // echo $element_last . PHP_EOL;

    // 1-va oxirgi index, qiymat emas!
//    $index_first = array_search($element_first, $massiv); //    echo $index_first . PHP_EOL;
//    $index_last = array_search($element_last, $massiv);

    // 8 xonali parol so'ralgani uchun sikl ochamiz:
    for ($i = 1; $i <= 8; $i++) {
        // random key, tasodifiy kalit(index):
        $rand_key = array_rand($massiv);

        // shu random keydagi elementni yangi o'zgaruvchiga olamiz:
        $rand_element = $massiv[$rand_key];

        // natijaga qo'shib boramiz:
        $natija .= $rand_element;
    }
    echo "1-usul natijasi: " . $natija . PHP_EOL;

    // 2-usul, massivga olib emas, satrni o'zidan tasodifiy belgilarni yig'ib boramiz:
    // Parol uzunligi
    $length = 8;

// Tasodifiy parolni hosil qilish
    $password = '';
    for ($i = 0; $i < $length; $i++) {
        // Tasodifiy indeks
        $randomIndex = rand(0, strlen($data) - 1);

        // Tasodifiy belgini qo'shish
        $password .= $data[$randomIndex];
    }


    echo "2-usul natijasi: " . $password . PHP_EOL;
    // masala_06();
}

function masala_07(): void
{
    /* 7-masala.
    "Assalomu alaykum O'zbekiston" - ushbu matnni
    "Assalomu alaykum jonajon O'zbekiston" ga aylantiring. */
    echo "7-masala:\n";

    $matn = "Assalomu alaykum O'zbekiston";
    $jon = "jonajon ";
//    $uzb = "O'zbekiston";

    // dastlabki 2 so'zni olamiz:
    $ikki_str = mb_substr($matn, 0, 17); // Assalomu alaykum

    // $matn ning oxirgi so'zini olamiz:
    // oxirdan boshlab 11 ta belgi olamiz:
    $uzb = mb_substr($matn, -11);   // O'zbekiston

    $matn = $ikki_str . $jon . $uzb;
    echo $matn . PHP_EOL;

}

function masala_08(): void
{
    /* 8-masala.
    Berilgan emaildan domen nomini ajratib oling.
    Masalan: example@gmail.com
    Natija: "gmail.com" */
    echo "8-masala:\n";

    $mail = 'example@gmail.com';
    // oxirdan boshlab 9 ta belgini ajratib olish:
    $domen = substr($mail, -9);
    echo $domen . PHP_EOL;
}

function masala_09(): void
{
    /* 9-masala.
    '000346023.24' ->  346023.24 ga aylantiring.
    Yani boshida 0 larni olib tashlang. */
    echo "9-masala:\n";

    $son_1 = '000346023.24';
    $kerakmas = '000';
    $natija_1 = substr($son_1, -9);
    $natija_2 = '';
    // $kerakmas ning uzunligidan keyingi belgilarni olish:
    for ($i = strlen($kerakmas); $i < strlen($son_1); $i++) {
        $natija_2 .= $son_1[$i];
    }
    echo '1-usul: ', $natija_1 . PHP_EOL;
    echo '2-usul: ', $natija_2 . PHP_EOL;

    // 3-indexdan keyingi sonlarnigina olish:
    echo '3-usul: ', substr($son_1, 3) . PHP_EOL;

    // funksiya orqali floatga keltirish:
    echo '4-usul: ', floatval($son_1) . PHP_EOL;

    // funksiyasiz floatga keltirish(aniqroqi ko'rsatish):
    echo '5-usul: ', (float)$son_1 . PHP_EOL;

    // chapdan 0 llarni olib tashlash:
    echo '6-usul: ', ltrim($son_1, '0') . PHP_EOL;

    echo 'Dastlabki qiymat: ', $son_1 . PHP_EOL;
}

function masala_10(): void
{
    /* 10-masala.
    https://kun.uz/50487176 - ushbu urldan 50487176 ni ajratib oling. */
    echo "10-masala:\n";

    $url = 'https://kun.uz/50487176';

    // oxirdan boshlab 8 ta belgini ko'rsatish:
    echo substr($url, -8) . PHP_EOL;

    // satrdan sonlarni regulyar ifodalar orqali izlab olish:
    if (preg_match('/\d+/', $url, $matches)) {
        echo $matches[0];
    }
    echo PHP_EOL;

    // barcha sonlarni regulyar ifodalar orqali ajratish:
    echo preg_replace('/\D/', '', $url) . PHP_EOL;
}

function masala_11(): void
{
    /* 11-masala.
    "/Users/sardordushamov/darslar/kurs/index.php" - ushbu matndan
    file nomini va kengaytmasini ajratib oling.
    Natija: index.php */
    echo "\t11-masala:\n";

    $file_url = '/Users/sardordushamov/darslar/kurs/index.php';

    echo "1-usul: ", substr($file_url, -9) . PHP_EOL;

    // so'zlar massivini olish:
    $natija = str_word_count($file_url, 1);

    // 4-va 5-indexdagi elementlarni . bilan qo'shish, concatination:
    $natija = $natija[4] . '.' . $natija[5];

    echo "2-usul: " . $natija . PHP_EOL;
}

function masala_12(): void
{
    /* 12-masala.
    "112233" korinishida matn berilgan. Ushbu matnni soatni bildiradigan
    korinishga keltiring.
    "112233" => "11:22:33"
    "252233" - xatolik deb chiqsin, chunki soat 25:22:33 vaqt bo'lmaydi. */
    echo "12-masala:\n";

    echo "Soatni soatdaqiqasoniya niqobida kiriting (misol: 112233): " . PHP_EOL;
    $vaqt = (trim(fgets(STDIN)));

    // agar kiritilgan son bo'lsa:
    if (is_numeric($vaqt)) {
        // agar kiritilgan 6 ta belgi bo'lsa:
        if (mb_strlen($vaqt) == 6) {
            // soat uchun 6 ta raqamdan 0-indexdan boshlab 2 ta raqam olish:
            $soat = mb_substr($vaqt, 0, 2);

            // daqiqa uchun 6 ta raqamdan 2-indexdan boshlab 2 ta raqam olish:
            $daqiqa = mb_substr($vaqt, 2, 2);

            // soniya uchun 6 ta raqamdan 4-indexdan boshlab 2 ta raqam olish:
            $soniya = mb_substr($vaqt, 4, 2);

            // soat 0 va 24 oraliqda ekanligi rost bo'lsa:
            if (($soat > 0 && $soat < 24) &&

                // daqiqa 0 va 60 oraliqda ekanligi rost bo'lsa:
                ($daqiqa > 0 && $daqiqa < 60) &&

                // soniya 0 va 60 oraliqda ekanligi rost bo'lsa:
                ($soniya > 0 && $soniya < 60)) {
                $vaqt = $soat . ':' . $daqiqa . ':' . $soniya;
            }
        } else {
            echo "Vaqt 6 xona bo'lsin.\n";
        }
    } else {
        echo "Son kiriting.\n";
    }

    echo $vaqt . PHP_EOL;
}

function masala_13(): void
{
    /* 13-masala.
    Berilgan qiymat telefon nomermi yoki yoq aniqlang.
    (O'zbekistondagi telefon nomerlar)
    Masalan: "+998999999999" Natija: telefon nomer
    "+99899999999912" Natija: telefon nomer emas. */
    echo "13-masala:\n";

    print "Telefon raqamni + siz kiriting: ";
    // kiritilgan raqamdan ochiq joylarni olib tashlash:
    $tel = trim(fgets(STDIN));

    // oldidan + kiritilgan bo'lsa olib tashlash:
    $tel = ltrim($tel, '+');

    // raqam kiritilganligini tekshirish:
    if (is_numeric($tel)) {

        // 12 xonali ekanligini tekshirish:
        if (mb_strlen($tel) === 12) {
            // raqam O'zbekistonni ekanligini tekshirish:
            if (mb_substr($tel, 0, 3) == 998) {
                echo "Siz kiritgan raqam O'zbekistonniki.\n";
            } else {
                echo "Siz kiritgan raqam boshqa davlatniki\n";
            }
        } else {
            echo "Siz kiritgan raqam boshqa davlatniki\n";
        }
    } else {
        echo "Son kiriting.\n";
    }

    echo PHP_EOL . PHP_EOL;
//    masala_13();

}

function masala_14(): void
{
    /* 14-masala.
    "+998999999999"  telefon nomermi yoki yo`q aniqlang.
    Agar telefon  nomer bo`lsa
    qaysi kompanyaga tegishligini aniqlang
    90, 91 - beeline
    93, 94 - ucell
        97 - mobiuz
        99 - uzmobile */
    echo "14-masala:\n";
    print "Telefon raqamni + siz kiriting: ";
    // kiritilgan raqamdan ochiq joylarni olib tashlash:
    $tel = trim(fgets(STDIN));

    // oldidan + kiritilgan bo'lsa olib tashlash:
    $tel = ltrim($tel, '+');

    // raqam kiritilganligini tekshirish:
    if (is_numeric($tel)) {

        // 12 xonali ekanligini tekshirish:
        if (mb_strlen($tel) === 12) {
            // raqam O'zbekistonni ekanligini tekshirish:
            if (mb_substr($tel, 0, 3) == 998) {
                echo "Siz kiritgan raqam O'zbekistonniki va ";
                switch (mb_substr($tel, 3, 2)) {
                    case 55:
                    case 33:
                    {
                        echo "Humans operatori";
                        break;
                    }

                    case 90:
                    case 91:
                    {
                        echo "Beeline operatori";
                        break;
                    }

                    case 93:
                    case 94:
                    {
                        echo "Ucell operatori";
                        break;
                    }

                    case 88:
                    case 97:
                    {
                        echo "MobiUz operatori";
                        break;
                    }

                    case 98:
                    {
                        echo "Perfectum Mobile operatori";
                        break;
                    }

                    case 77:
                    case 95:
                    case 99:
                    {
                        echo "Uzmobile";
                        break;
                    }
                    default:
                    {
                        echo "Operatorni hozircha aniqlay olmadim.
                    \nHali balkim yangiliklar va qo'shimchalar kiritishimiz kerakdir.";
                    }
                }

            } else {
                echo "Siz kiritgan raqam boshqa davlatniki\n";
            }
        } else {
            echo "Siz kiritgan raqam boshqa davlatniki\n";
        }
    } else {
        echo "Son kiriting.\n";
    }


    echo PHP_EOL . PHP_EOL;
    masala_14();


}
