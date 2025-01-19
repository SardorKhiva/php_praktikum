<?php
$non = "";
$kattaligi = "";
$ustiga[] = "";
$qoshimcha[] = "";
$summa = 0;

if (!empty($_POST['non'])) {
    $non = $_POST['non'];
}
if (!empty($_POST['circle'])) {
    $kattaligi = $_POST['circle'];
    switch ($kattaligi) {
        case "25 sm":
        {
            $summa += 40_000;
            break;
        }
        case "30 sm":
        {
            $summa += 45_000;
            break;
        }
        case "35 sm":
        {
            $summa += 50_000;
            break;
        }
    }
}

if (!empty($_POST['ustiga'])) {
    $ustiga = $_POST['ustiga'];
    for ($i = 0; $i < count($ustiga); $i++) {
        $summa += 2_000;
    }
}

if (!empty($_POST['qoshimchalar'])) {
    $qoshimcha = $_POST['qoshimchalar'];
    for ($i = 0; $i < count($qoshimcha); $i++) {
        $summa += 3_000;
    }
}

?>

<!DOCTYPE html>
<html lang="uz">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>8-vazifa</title>
    <style>
        body {
            background-color: aquamarine;
            font-family: Arial, sans-serif;
            /* Шрифт для всего документа */
            display: flex;
            /* Flexbox для расположения левой и правой частей */
        }

        #chap-qism-id {
            width: 60%;
            /* Левая часть занимает 60% ширины */
            padding: 20px 20px;
            /* Отступы внутри левой части */
        }

        #ong-qism-id {
            width: 40%;
            /* Правая часть занимает 40% ширины */
            padding: 20px;
            /* Отступы внутри правой части */
            background-color: aquamarine;
            /* Белый фон для правой части */
            border-left: 1px solid black;
        }

        /* Остальные стили (круги, заголовки, чекбоксы и т.д.) остаются такими же */
        .circle25 {
            /* ... */
            width: 25mm;
            height: 25mm;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            margin-right: 20px;
            background-color: #fff;
            border: 2px solid #ccc;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .circle30 {
            /* ... */
            width: 30mm;
            height: 30mm;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            margin-right: 20px;
            background-color: #fff;
            border: 2px solid #ccc;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        /* ... */
        .circle35 {
            width: 35mm;
            height: 35mm;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            margin-right: 20px;
            background-color: #fff;
            border: 2px solid #ccc;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        input[type="radio"] {
            display: none;
            /* Скрываем радиокнопки */
        }

        input[type="radio"]:checked + .circle25 {
            background-color: #28a745;
            border-color: #218838;
            color: white;
        }

        input[type="radio"]:checked + .circle30 {
            background-color: #28a745;
            border-color: #218838;
            color: white;
        }

        input[type="radio"]:checked + .circle35 {
            background-color: #28a745;
            border-color: #218838;
            color: white;
        }

        /* 3 ta doira konteyneri */
        .kattaligi {
            display: flex;
            flex-direction: row;
        }

        /* h1 stili */
        .header {
            text-align: center;
        }

        /* nonni qalinligini tanlash stili */
        .non-qalinligi-id {
            padding-left: 10px;
        }

        /* jadval kataklari orasidagi masofa, o'ng tomondan */
        td {
            padding-right: 50px;
        }

        .left-tab {
            /*padding-left: 10px;*/
            text-align: right;
        }
    </style>
</head>

<body>

<div id="chap-qism-id">
    <!-- Содержимое левой части -->
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <div class="header">
            <h2>Pitsa buyurtma qilish</h2>
        </div>

        <div class="non-qalinligi-id">
            <h3>Noni qanday bo'lsin?</h3>
            <select name="non">
                <option value="Yupqa">Yupqa</option>
                <option value="Qalin">Qalin</option>
            </select>
        </div>
        <br>

        <div class="non-qalinligi-id">
            <h3>Kattaligi (sm)</h3>
        </div>

        <!-- nonni kattaligi 25-30-35 sm -->
        <div class="kattaligi">
            <label>
                <input type="radio" name="circle" value="25 sm">
                <div class="circle25">25</div>
            </label>
            <label>
                <input type="radio" name="circle" value="30 sm">
                <div class="circle30">30</div>
            </label>
            <label>
                <input type="radio" name="circle" value="35 sm">
                <div class="circle35">35</div>
            </label>
        </div>

        <!--ustiga solinadigan narsalar-->
        <div>
            <h3>Ustiga nima solaylik?</h3>
            <table>
                <tbody>
                <tr>
                    <td>
                        <input type="checkbox" id="pomidor" name="ustiga[]" value="Pomidor">
                        <label for="pomidor">Pomidor</label>
                    </td>
                    <td>
                        <input type="checkbox" id="bodring" name="ustiga[]" value="Tuzlangan bodring">
                        <label for="bodring">Tuzlangan bodring</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" name="ustiga[]" id="kurka" value="Kurka go'shti">
                        <label for="kurka">Kurka go'shti</label>
                    </td>
                    <td>
                        <input type="checkbox" name="ustiga[]" id="qoziqorin" value="Qo'ziqorin">
                        <label for="qoziqorin">Qo'ziqorin</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" name="ustiga[]" id="zaytun" value="Zaytun">
                        <label for="zaytun">Zaytun</label>
                    </td>
                    <td>
                        <input type="checkbox" name="ustiga[]" id="qazi" value="Qazi">
                        <label for="qazi">Qazi</label>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- qo'shimchalar -->
        <div>
            <h3>Qo'shimchalar</h3>
            <table>
                <tbody>
                <tr>
                    <td>
                        <input type="checkbox" name="qoshimchalar[]" id="achchiq" value="Achchiq">
                        <label for="achchiq">Achchiq</label>
                    </td>
                    <td>
                        <input type="checkbox" name="qoshimchalar[]" id="sosiskali" value="Sosiskali">
                        <label for="sosiskali">Sosiskali</label>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <input type="submit" value="Buyurtma berish" class="btn btn-primary">
    </form>
    <p>&quot;Chopmas&quot; pitsa maxsus buyurtma interfeysi</p>

</div>

<!-- buyurtma haqida malumot chiqarish -->
<div id="ong-qism-id">
    <strong>Non: </strong> <span class="left-tab"><?php echo $non; ?></span> <br>
    <strong>Kattaligi: </strong><span class="left-tab"><?php echo $kattaligi; ?></span> <br>
    <strong>Ustida: </strong><br>
    <ul>
        <?php
        if (isset($ustiga)) {
            foreach ($ustiga as $ust) {
                echo "<li>$ust</li>";
            }
        }
        ?>
    </ul>

    <strong>Qo'shimcha: </strong><br>
    <ul>
        <?php
        if (isset($qoshimcha)) {
            foreach ($qoshimcha as $qosh) {
                echo "<li>$qosh</li>";
            }
        }
        ?>
    </ul>
    <br>

    <strong>Summa: </strong> <span class="left-tab"><?php echo $summa ?? 0; ?> so'm</span> <br>

</div>

</body>

</html>