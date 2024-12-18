<?php
/** 5. Qo'shimcha fayllarda berilgan kalkulyator
 *  interfeysi ko'rinishidagi sahifa tuzing.     */
$num_1 = null;
$num_2 = null;
$amal = null;
$natija = null;

if (isset($_POST['num_1']) && !empty($_POST['num_1']) &&
    isset($_POST['num_2']) && !empty($_POST['num_2']) &&
    isset($_POST['amal']) && !empty($_POST['amal'])) {
    $num_1 = doubleval(trim($_POST['num_1']));
    $num_2 = doubleval(trim($_POST['num_2']));
    $amal = trim($_POST['amal']);

    switch ($amal) {
        case "Qo'shish":
        {
            $natija = $num_1 + $num_2;
            break;
        }
        case "Ayirish":
        {
            $natija = $num_1 - $num_2;
            break;
        }
        case "Ko'paytirish":
        {
            $natija = $num_1 * $num_2;
            break;
        }
        case "Bo'lish":
        {
            if ($num_2 != 0) {
                $natija = $num_1 / $num_2;
            } else {
                $natija = "Nolga bo'lish mumkin emas <br>";
            }
        }
        case "Darajaga ko'tarish":
        {
            if ($num_1 == 0 && $num_2 < 0) {
                throw new InvalidArgumentException("0 ni manfiy darajaga ko'tarib bo'lmaydi.");
            } else {
                $natija = pow($num_1, $num_2);
            }
        }
    }
}
?>


<h1>Kalkulyator</h1>

<form action="vazifa_05.php" method="post">
    <!-- 1-raqamni kiritish -->
    <input type="number" required id="num_1" name="num_1"
           value="<?= htmlspecialchars($num_1 ?? '') ?>">
    <label for="num_1">
        <b>First number</b>
    </label>
    <br><br>

    <!-- 2-raqamni kiritish -->
    <input type="number" required id="num_2" name="num_2"
           value="<?= htmlspecialchars($num_2 ?? '') ?>">
    <label for="num_2">
        <b>Second number</b>
    </label>
    <br><br>

    <!-- natijani chiqarish -->
    <input type="text" id="result" readonly
           value="<?= htmlspecialchars($natija ?? '') ?>">
    <label for="result">
        <b>Result</b>
    </label>
    <br><br>

    <input type="submit" name="amal" value="Qo'shish">
    <input type="submit" name="amal" value="Ayirish">
    <input type="submit" name="amal" value="Ko'paytirish">
    <input type="submit" name="amal" value="Bo'lish">
    <input type="submit" name="amal" value="Darajaga ko'tarish">
</form>

