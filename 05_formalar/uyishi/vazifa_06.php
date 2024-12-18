<?php
// 6. Qo'shimcha fayllarda berilgan
// menyu rasmidagidek forma hosil qilib,
// hisob kitob qilish.
$chiqim = 0;

if (!empty($_POST['taom1'])) {
    $taom1 = $_POST['taom1'];

    switch ($taom1) {
        case 'moxora':
        case 'mastava':
        {
            $taom1 = 16_000;
            break;
        }
        case 'shorva':
        {
            $taom1 = 15_000;
            break;
        }
        case 'norin':
        {
            $taom1 = 20_500;
            break;
        }
    }
    $chiqim += $taom1;
}

if (!empty($_POST['taom2'])) {
    $taom2 = $_POST['taom2'];
    switch ($taom2) {
        case 'osh':
        {
            $taom2 = 20_000;
            break;
        }
        case 'manti':
        {
            $taom2 = 18_500;
            break;
        }
        case 'qozon':
        {
            $taom2 = 23_000;
            break;
        }
        case 'lagmon':
        {
            $taom2 = 21_500;
            break;
        }
    }
    $chiqim += $taom2;
}

if (!empty($_POST['ichimlik'])) {
    $ichimlik = $_POST['ichimlik'];
    switch ($ichimlik) {
        case 'choy':
        {
            $ichimlik = 2_000;
            break;
        }
        case 'fanta':
        case 'coca':
        {
            $ichimlik = 8_000;
            break;
        }
        case 'kofe':
        {
            $ichimlik = 10_500;
            break;
        }
    }
    $chiqim += $ichimlik;
}

if (!empty($_POST['salat'])) {
    $salat = $_POST['salat'];
    switch ($salat) {
        case 'achchiq':
        {
            $salat = 5_000;
            break;
        }
        case 'fransuzcha':
        case 'olivye':
        {
            $salat = 8_000;
            break;
        }
        case 'kapriz':
        {
            $salat = 10_500;
            break;
        }
    }
    $chiqim += $salat;
}

$chiqim *= 1.15;
?>

<h1>Menyu</h1>
<form method="post">
    <h3>1-taom</h3>
    <div>
        <!-- Mastava -->
        <input type="radio" name="taom1" id="mastava" value="mastava">
        <label for="mastava">Mastava (16 000 so'm)</label>

        <!-- Moxora -->
        <input type="radio" name="taom1" id="moxora" value="moxora">
        <label for="moxora">Moxora (16 000 so'm)</label>

        <!-- Sho'rva -->
        <input type="radio" name="taom1" id="shorva" value="shorva">
        <label for="shorva">Sho'rva (15 000 so'm)</label>

        <!-- Norin -->
        <input type="radio" name="taom1" id="norin" value="norin">
        <label for="norin">Norin (20 500 so'm)</label>
    </div>

    <h3>2-taom</h3>
    <div>
        <!-- Osh -->
        <input type="radio" name="taom2" id="osh" value="osh">
        <label for="osh">Osh (20 000 so'm)</label>

        <!-- Manti -->
        <input type="radio" name="taom2" id="manti" value="manti">
        <label for="manti">Manti (18 500 so'm)</label>

        <!-- Qozon kabob -->
        <input type="radio" name="taom2" id="qozon" value="qozon">
        <label for="qozon">Qozon kabob (23 000 so'm)</label>

        <!-- Lag'mon -->
        <input type="radio" name="taom2" id="lagmon" value="lagmon">
        <label for="lagmon">Lag'mon (21 500 so'm)</label>
    </div>

    <h3>Ichimlik</h3>
    <div>
        <!-- Choy -->
        <input type="radio" name="ichimlik" id="choy" value="choy">
        <label for="choy">Choy (2 000 so'm) </label>

        <!-- Coca cola -->
        <input type="radio" name="ichimlik" id="coca" value="coca">
        <label for="coca">Coca cola (8 000 so'm)</label>

        <!-- Fanta -->
        <input type="radio" name="ichimlik" id="fanta" value="fanta">
        <label for="fanta">Fanta (8 000 so'm)</label>

        <!-- Kofe -->
        <input type="radio" name="ichimlik" id="kofe" value="kofe">
        <label for="kofe">Kofe (10 500 so'm)</label>
    </div>

    <h3>Salat</h3>
    <div>
        <!-- Achchiq chuchuk -->
        <input type="radio" name="salat" id="achchiq" value="achchiq">
        <label for="achchiq">Achchiq chuchuk (5 000 so'm)</label>

        <!-- Olivye -->
        <input type="radio" name="salat" id="olivye" value="olivye">
        <label for="olivye">Olivye (8 000 so'm)</label>

        <!-- Fransuzcha -->
        <input type="radio" name="salat" id="fransuzcha" value="fransuzcha">
        <label for="fransuzcha">Fransuzcha (8 000 so'm)</label>

        <!-- Mujskiy kapriz -->
        <input type="radio" name="salat" id="kapriz" value="kapriz">
        <label for="kapriz">Mujskiy kapriz (10 500 so'm)</label>
    </div>

    <h2> 15% xizmat haqqi</h2>

    <input type="submit" value="Hisoblash">
</form>
<h2>
    Jami: <?= htmlspecialchars(number_format($chiqim, 2, '.', ' ')); ?> so'm
</h2>