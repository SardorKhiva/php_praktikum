<form action="vazifa_02.php" method="post">
    <label for="num_1">1-raqam:</label>
    <input id="num_1" name="num1" type="number" placeholder="1-raqamni kiriting" step="any">
    <br><br>

    <label for="num_2">2-raqam:</label>
    <input id="num_2" name="num2" type="number" placeholder="2-raqamni kiriting" step="any">
    <br><br>

    <input type="submit" value="Yigindisini chiqarish">
</form>

<?php
/**
 * 2. Forma hosil qiling va ikkita input polya hamda submit button joylang.
 * Inputlarga kiritilgan sonlarni yigindisini chiqarsin.
 */
$yigindisi = $num_1 = $num_2 = null;
if (!empty($_POST['num1']) && !empty($_POST['num2'])) {
    $num_1 = doubleval(trim($_POST['num1']));
    $num_2 = doubleval(trim($_POST['num2']));
    $yigindisi = $num_1 + $num_2;
}

if (!empty($yigindisi)) {
    echo number_format($num_1, 0, '.', ' ') . ' + ';
    echo number_format($num_2, 0, '.', ' ') . ' = ';
    echo number_format($yigindisi, 0, '.', ' ');
    echo '<br>';
} else {
    echo "Yigindisi yo'q";
}