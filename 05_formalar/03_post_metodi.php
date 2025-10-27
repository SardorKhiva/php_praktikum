<!--
**POST metodi** — bu veb-formadan maʼlumotlarni
serverga yuborish uchun ishlatiladigan
HTTP protokoli metodlaridan biridir.
POST metodi foydalanuvchi kiritgan ma'lumotlarni
(masalan, login, parol yoki boshqa forma elementlari)
serverga _yashirin_ tarzda (so'rovning boshida ko'rsatilmay) yuboradi,
shuning uchun GET metodiga nisbatan xavfsizroq hisoblanadi.

### POST metodi xususiyatlari:
    1. **Yashirinligi**: Ma’lumotlar URL (havola) orqali yuborilmaydi
        va foydalanuvchi brauzerining manzil satrida ko‘rinmaydi.
    2. **Ko'p miqdorda ma'lumot uzatish**: GET'dan farqli ravishda POST
        katta hajmdagi ma'lumotlarni serverga uzatishga imkon beradi.
    3. **Serverga qaratilgan soʻrov**: Bu metod odatda ma'lumotlarni
    serverda qayta ishlash yoki saqlash uchun ishlatiladi, masalan,
        foydalanuvchini avtorizatsiya qilish, ma'lumotlar bazasiga kirish yoki boshqa backend operatsiyalar.
    4. **Xavfsizlik (asosan HTTPS bilan)**: POST ma'lumotlari URL orqali
        uzatilmagani uchun, GET kabi kiberhujumlarga masalan, URL manipulyatsiyasiga kamroq moyil.

### Afzalliklari:
- POST method foydalanuvchi ma'lumotlarini URL orqali yubormasligi sababli biroz xavfsizroq.
- Login, parol kabi shaxsiy ma'lumotlarni yuborishda asosan POST'dan foydalaniladi.
- Ko'proq miqdordagi ma'lumotlarni, fayllarni yoki kiritma maydonlari ko'p bo'lgan
  formalarni yuborishda qo'llaniladi.
-->

<form method="post" action="03_post_metodi.php">
    <label for="login">Login:</label>
    <input type="text" id="login" name="login"> <br> <br>

    <label for="parol">Parol: </label>
    <input type="password" id="parol" name="parol"> <br> <br>

    <input type="submit" value="OK">
</form>

<?php
if (isset($_POST['login'])) {
//    $login = htmlspecialchars($_POST['login']);   // html dagi teg mahsus belgilarini sahifada ko'rsatadi.
    $login = htmlentities($_POST['login']);
}

if (isset($_POST['parol'])) {
//    $parol = htmlspecialchars($_POST['parol']);
    $parol = htmlentities($_POST['parol']);
}

echo $login . PHP_EOL;
echo $parol . PHP_EOL;