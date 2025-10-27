<h2>Oddiy kalkulyator:</h2>

<form action="vazifa_04.php" method="post">
    <input required type="number" name="number1" placeholder="0" style="width: 100%">
    <br><br>

    <table style="width: 100%" border="1px solid red">
        <tbody>
        <tr>
            <td style="width: 25%">
                <label for="plyus"> + </label>
                <input type="radio" id="plyus" name="operator" value="+" checked> qo'shish
            </td>

            <td style="width: 25%">
                <label for="minus"> - </label>
                <input type="radio" id="minus" name="operator" value="-"> ayirish
            </td>

            <td style="width: 25%">
                <label for="kopaytirish"> * </label>
                <input type="radio" id="kopaytirish" name="operator" value="*"> ko'paytirish
            </td>
            <td style="width: 25%">
                <label for="bo_lish"> / </label>
                <input type="radio" id="bo_lish" name="operator" value="/"> bo'lish
            </td>
        </tr>
        </tbody>
    </table>
    <br><br>

    <input required type="number" name="number2" placeholder="0" style="width: 100%">
    <br><br>

    <input type="submit" value=" = " name="submit">
    <br><br>


<?php
/**
 * 4. Forma hosil qiling va 2 ta polya qoshing.
 * 4 ta radio ham qushing.
 * Radiolar: + - * / amallaridan birini bajarish uchun.
 * Ikkita polyani toldirib radiodan birortasi tanlansa,
 * masalan + tanlansa,
 * ikkitasini yigindisini hisoblasin.
 * Xatolarga etibor qiling.
 */
$number1 = $number2 = $operator = null;

if (!empty($_POST['number1']) && !empty($_POST['number2'])) {
    $number1 = doubleval(trim($_POST['number1']));
    $number2 = doubleval(trim($_POST['number2']));
    $operator = $_POST['operator'];
}

if (isset($operator)) {
    switch ($operator) {
        case '+':
        {
            echo "&nbsp&nbsp";
            echo number_format($number1, 0, '.', ' ') . '<br>';
            echo ' + ';
            echo "&nbsp&nbsp";
            echo "<br> &nbsp&nbsp" . number_format($number2, 0, '.', ' ') . '<br>';
            echo '<hr>';
            echo "&nbsp&nbsp";
            echo number_format(($number1 + $number2), 2, '.', ' ');
            break;
        }
        case '-':
        {
            echo ' ' . number_format($number1, 0, '.', ' ') . '<br>';
            echo ' - ';
            echo "&nbsp&nbsp";
            echo "<br> &nbsp&nbsp" . number_format($number2, 0, '.', ' ') . '<br>';
            echo '<hr>';
            echo "&nbsp&nbsp";
            echo number_format(($number1 - $number2), 2, '.', ' ');
            break;
        }
        case '*':
        {
            echo ' ' . number_format($number1, 0, '.', ' ') . '<br>';
            echo ' * ';
            echo "<br> &nbsp&nbsp" . number_format($number2, 0, '.', ' ') . '<br>';
            echo '<hr>';
            echo "&nbsp&nbsp";
            echo number_format(($number1 * $number2), 2, '.', ' ');
            break;
        }
        case '/':
            if ($number2 == 0) {
                echo "0 ga bo'lib bo'lmaydi.";
            } else {
                echo ' ' . number_format($number1, 0, '.', ' ') . '<br>';
                echo ' / ';
                echo "<br> &nbsp&nbsp" . number_format($number2, 0, '.', ' ') . '<br>';
                echo '<hr>';
                echo "&nbsp&nbsp";
                echo number_format(($number1 * $number2), 2, '.', ' ');
            }
    }
}