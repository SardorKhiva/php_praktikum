<?php
/**
 * 7. https://whatsabyte.com/P1/byteconverter.htm
 * Manashu saytga kirib ko`ringlar.
 * Bu yerda convertor qilishgan.
 * Yani ma'lumotlarni hajmini kilobayt,
 * megabayt, terabayt vhkzlarga convert qilib beradi.
 * Sizlar ham shunaqa qilishingiz kerak.
 * php html , POST, form lardan foydalanib
 */

?>

<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vazifa_07.php</title>
    <style>
        .qolip {
            background-color: green; /* Толщина, стиль и цвет рамки */
            padding: 10px; /* Отступ между содержимым и рамкой */
            margin-left: 5px;
            margin-right: 5px;
            max-width: 100%;
        }

        #namuna, .qolip {
            max-width: 100%; /* Изображение занимает ширину контейнера */
            height: auto; /* Высота сохраняет пропорции */
        }

        table {
            max-width: 100%;
            width: 100%;
            height: auto;
        }

        /*td, input {*/
        .satr-1 {
            max-width: 100%;
            margin-left: 20px;
            margin-right: 20px;
            margin-top: 40px;
            height: 35px;
            text-align: center;
            border-radius: 5px;
        }

        .oq-yozuv {
            margin-top: 20px;
            margin-left: 20px;
            margin-right: 20px;
            text-align: center;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>

<h1>Namuna uchun rasm: </h1>
<img id="namuna" src="/05_formalar/uyishi/Formaga%20oid%20vazifalar/data_converter.png"
     alt="Bu yerda namuna rasmi bor edi">
<br>
<hr>
<br>

<div class="qolip">
    <form method="post">
        <table>
            <tr id="satr-1">
                <td>
                    <input class="satr-1" type="number"
                           name="byte"
                           id="byte"
                           placeholder="0">

                </td>
                <td>
                    <input class="satr-1" type="number"
                           name="kb"
                           id="kb"
                           placeholder="0">
                </td>
                <td>
                    <input class="satr-1" type="number"
                           name="mb"
                           id="mb"
                           placeholder="0">
                </td>
                <td>
                    <input class="satr-1" type="number"
                           name="gb"
                           id="gb"
                           placeholder="0">
                </td>
                <td>
                    <input class="satr-1" type="number"
                           name="tb"
                           id="tb"
                           placeholder="0">
                </td>
            </tr>
            <tr>
                <td>
                    <label class="oq-yozuv" for="byte">Bytes</label>
                </td>
                <td>
                    <label for="kb">Kilobytes</label>
                </td>
                <td>
                    <label for="mb">Megabytes</label>
                </td>
                <td>
                    <label for="gb">Gigabytes</label>
                </td>
                <td>
                    <label for="tb">Terabytes</label>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Submit">
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
