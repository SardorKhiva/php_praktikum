<!doctype html>
<html lang=uz>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <style>
        table {
            border: 1px solid black;
            border-collapse: collapse;
        }

        .center {
            text-align: center;
        }

        td, th {
            border: 1px solid black;
            padding: 5px;
        }
    </style>
</head>

<body>

<h2>Saytga kirish:</h2>
<form action="02_get_metodi.php" method="get">
    <label for="login">Login: </label>
    <input type="text" name="login" id="login"> <br><br>

    <label for="parol">Parol: </label>
    <input type="password" name="parol" id="parol"> <br><br>

    <input type="submit" value="Kirish">
</form>
<br><br>

<b class="center">
    ### `GET` va `POST` o'rtasidagi farq
</b>

<table>
    <thead>
    <tr>
        <th> Xususiyati</th>
        <th> GET</th>
        <th> POST</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td> Ma'lumot uzatish usuli</td>
        <td> URL orqali uzatiladi</td>
        <td> HTTP xabarining tanasida uzatiladi</td>
    </tr>

    <tr>
        <td> Xavfsizlik</td>
        <td> Kam xavfsiz (ma'lumot ochiq)</td>
        <td> Ko'proq xavfsizlikni ta'minlaydi</td>
    </tr>
    <tr>
        <td> Uzatiladigan hajmi</td>
        <td> Cheklangan (`URL` uzunligiga bog'liq)</td>
        <td> Cheksiz (server cheklashiga qarab)</td>
    </tr>
    <tr>
        <td> Qo'llaniladigan joyi</td>
        <td> Qidiruv va statistik ma'lumot uchun</td>
        <td> Maxfiy va katta hajmdagi ma'lumot uchun</td>
    </tr>
    </tbody>
</table>

<p>

    GET methodi - bu veb-dasturlardagi eng keng tarqalgan HTTP so'rov usullaridan biri bo'lib,
    u ma'lumotlarni URL orqali so'rov qismida (query string) jo'natadi.
    Quyida GET methodi haqida batafsil ma'lumot keltiriladi. <br>

    GET methodining asosiy xususiyatlari
    Ma'lumotlarni URL orqali jo'natadi: Foydalanuvchi tomonidan kiritilgan ma'lumotlar manzilning (URL) oxiriga
    qo'shiladi.
</p>

</body>
</html

<?php

if (isset($_GET['login'])) {
    echo "Login: \t" . $_GET['login'] . "<br>";
}

if (isset($_GET['parol'])) {
    echo "Parol: \t" . $_GET['parol'] . "<br>";
}