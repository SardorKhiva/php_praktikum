<form action="vazifa_01.php" method="post">
    <label for="tel">Telefon:</label>
    <input required id="tel" type="text" name="tel">
    <br><br>

    <input type="submit" value="OK">
</form>
<?php
/*  1. Forma hosil qiling va 1 ta input polya va submit button joylang.
    Inputga yozilgan qiymatni telefon nomermi yoki yoq, shuni aniqlasin.
    Faqat uzbdagi tel nomerlar uchun.
 */

if (!empty($_POST['tel'])) {
    $tel = $_POST['tel'];
}

if ( isset($tel) ) {
$tel = trim($tel);
$tel = str_replace(' ', '', $tel);

    if (strlen($tel) === 13 && str_starts_with($tel, '+998')) {
        echo $tel;
        echo " telefon raqam O'zbekistonniki <br>";
    } else {
        echo $tel;
        echo " telefon raqam O'zbekistonniki emas <br>";
    }
}
