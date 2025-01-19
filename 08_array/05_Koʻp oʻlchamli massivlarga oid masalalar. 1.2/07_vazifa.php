<?php
/**
 * 7. ikki o'lchamli massiv uchun
 * Ro'yxatdan o'tish formasini yasang.
 * Ismi, Familyasi, username, password,
 * confirm password kiritish formalari bo'lsin.
 * Talablar:
 * -Barcha inputlar to'ldirilishi shart;
 * -Ism va Familya 3 ta harfdan kam bo'lmasligi kerak;
 * -username - email bo'lishi kerak;
 * -password - 8 ta harfdan kam bo'lmasligi va
 * oxirgi 2 harfi son bo'lishi kerak;
 * -confirm_password - password bilan bir xil qiymatda bo'lishi kerak.
 *
 * Agar ushbu shartlarni birortasi bajarilmasa, ekranga massiv
 * ko'rinishida qaysi input polyada qayshi shart najarilmaganini xabari berilsin.
 */
$ism_xato = "Ism 3 ta harfdan kam bo'lmasligi kerak";
$familya_xato = "Familya 3 ta harfdan kam bo'lmasligi kerak";
$username_xato = "Username email bo'lishi kerak";
$password_xato = "Parol 8 ta belgi bo'lishi va oxirgi 2 harfi son bo'lishi kerak";
$password_xato2 = "Oldingi parol bilan bir xil emas";

$form_data_errors = [
        "ismi" => $ism_xato,
        "familyasi" => $familya_xato,
        "username" => $username_xato,
        "password" => $password_xato,
        "confirm_password" => $password_xato2
];

?>

<body style="background-color: black; color: red;">
<h1>Ro'yhatdan o'tish</h1>
<form method="post">
    <p>
        <label for="ismi">Ism: </label><br>
        <input type="text" id="ismi" name="ismi"
               placeholder="Isminggizni kiriting">
    </p>

    <p>
        <label for="familyasi">Familya: </label><br>
        <input type="text" id="familyasi" name="familyasi"
               placeholder="Familyanggizni kiriting">
    </p>
    
    <p>
        <label for="username">Foydalanuvchi ismi:</label><br>
        <input type="text" id="username" name="username"
        placeholder="Username tanlang">
    </p>
    
    <p>
        <label for="password">Parol:</label><br>
        <input type="password" id="password" name="password"
        placeholder="Parol tanlang">
    </p>
    
    <p>
        <label for="confirm_password">Parolni takrorlang: </label><br>
        <input type="password" id="confirm_password" name="confirm_password"
        placeholder="Oldingi parolni takrorlang">
    </p>
    <p>
        <input type="submit" value="Saqlash">
    </p>
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] === "POST")
{
    // Ism va Familya 3 ta harfdan kam bo'lmasligi kerak
    if (mb_strlen($_POST["ismi"]) > 3) {
        unset($form_data_errors["ismi"]);
    }
    if (mb_strlen($_POST["familyasi"]) > 3){
        unset($form_data_errors["familyasi"]);
    }

    // username - email bo'lishi kerak
    for($i = 5; $i < mb_strlen($_POST["username"]); $i++) {
    if (mb_substr($_POST["username"], $i, 1) === "@" ||
        mb_substr($_POST["username"], $i, 1) === ".")
        unset($form_data_errors["username"]);
    }

    // password - 8 ta harfdan kam bo'lmasligi va
    // oxirgi 2 harfi son bo'lishi kerak
    if ( mb_strlen($_POST["password"]) ) {
        if (is_numeric(mb_substr($_POST["password"], -2)))
            unset($form_data_errors["password"]);
    }

    if ($_POST["confirm_password"] === $_POST["password"]) {
        unset($form_data_errors["confirm_password"]);
    }

    foreach ($form_data_errors as $field => $error) {
        echo $field . " error => " . $error . "<br>";
    }
}