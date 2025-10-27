<style>
    body {
        background-color: saddlebrown;
    }
</style>
<?php
// 2. Qo'shimcha fayllardagi kalkulyator
// interfeysiga mos formani hosil qiling
// va amallarni funksiya yordamida bajaring.

$number1 = null;
$number2 = null;
$amal = null;
$natija = null;

if (!empty($_POST['number1']) &&
    !empty($_POST['number2']) &&
    !empty($_POST['operation'])) {
    $number1 = doubleval(trim($_POST['number1']));
    $number2 = doubleval(trim($_POST['number2']));
    $amal = trim($_POST['operation']);
    function qoshish($number1, $number2): float
    {
        return $number1 + $number2;
    }

    function ayirish($number1, $number2): float
    {
        return $number1 - $number2;
    }

    function kopaytirish($number1, $number2): float
    {
        return $number1 * $number2;
    }

    function bolish($number1, $number2): float
    {
        if ($number2 != 0) {
            return $number1 / $number2;
        }
        return 0;
    }

    switch ($amal) {
        case "Qo'shish":
        {
            $natija = qoshish($number1, $number2);
            break;
        }
        case "Ayirish":
        {
            $natija = ayirish($number1, $number2);
            break;
        }
        case "Ko'paytirish":
        {
            $natija = kopaytirish($number1, $number2);
            break;
        }
        case "Bo'lish":
        {
            if ($number2 != 0) {
                $natija = bolish($number1, $number2);
            } else {
                $natija = "Nolga bo'lish mumkin emas <br>";
            }
            break;
        }

    }
}
?>

<h1>
    Kalkulyator
</h1>

<form method="post">
    <div>
        <input type="number"
               name="number1"
               id="n1"
               placeholder="0"
            <?= htmlspecialchars($number1 ?? '') ?>
        >
        <label for="n1"><b>First number</b></label>
        <br>
        <br>
    </div>

    <div>
        <input type="number"
               name="number2"
               id="n2"
               placeholder="0"
            <?= htmlspecialchars($number2 ?? '') ?>
        >
        <label for="n2"><b>Second number</b></label>
        <br>
        <br>
    </div>

    <div>
        <input type="text" readonly
               value="<?= htmlspecialchars($natija ?? '') ?>"
               placeholder="0"
               id="result">
        <label for="result"><b>Result</b></label>
        <br>
        <br>
    </div>

    <input type="submit" value="Qo'shish" name="operation">
    <input type="submit" value="Ayirish" name="operation">
    <input type="submit" value="Ko'paytirish" name="operation">
    <input type="submit" value="Bo'lish" name="operation">
</form>