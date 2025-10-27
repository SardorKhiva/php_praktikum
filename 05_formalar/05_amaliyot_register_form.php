<h2>Kirish:</h2>
<form method="post" action="05_amaliyot_register_form.php">
    <label for="login">Ism:</label>
    <input type="text" required id="login" name="login">
    <br><br>

    <label for="phone">Telefon:</label>
    <input type="text" required id="phone" name="phone">
    <br><br>

    <label for="parol">Parol:</label>
    <input type="password" required id="parol" name="password">
    <br><br>

    <input type="submit" value="OK"> <br><br>
</form>

<?php
/**
 * Ro'yhatdan o'tish formasini hosil qiling.
 * Ism, telefon raqam, parol maydonlari to'ldirilsin.
 * Ism va parol 6 ta belgidan kam bo'lmasin.
 * Telefon raqami O'zbekistonniki bo'lsin, +998 bilan boshlanib
 * jami 13 xona bo'lsin.
 */


if (!empty($_POST['login'])) {
    $login = $_POST['login'];
    $login = trim($login);
}

if (!empty($_POST['password'])) {
    $password = $_POST['password'];
    $password = trim($password);
}

if (!empty($_POST['phone'])) {
    $phone = $_POST['phone'];
    $phone = trim($phone);
}


if (isset($login) && strlen($login) < 6) {
    echo "Ism 6 ta belgidan kam bo'lmasligi kerak <br>";
}

if (isset($password) && strlen($password) < 6) {
    echo "Parol 6 ta belgidan kam bo'lmasligi kerak <br>";
}

// agar telefon raqam + bilan 13 xona bo'lsa,
if (str_starts_with($phone, '+') && strlen($phone) == 13) {
    // chapdan boshlab 3 ta belgi +998 bo'lsa
    if (str_starts_with($phone, '+998')) {
        echo "Telefon raqam O'zbekistonniki <br>";
    } else {
        echo "Telefon raqam O'zbekistonniki emas <br>";
    }
} else {
    echo "Telefon raqam O'zbekistonniki emas <br>";
}