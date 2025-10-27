<?php
/**
 * 6. 1 dan berilgan N gacha bo`lgan toq sonlar
 * yig`indisini hisoblaydigan funksiya hosil qiling.
 */

$toqSonlarSummasi = null;
$misol = '';
$n = 0;
$misolHolati = 0;

if (!empty($_POST['n'])) {
    $n = $_POST['n'];
    $toqSonlarSummasi = toqSonlar($n);
}


function toqSonlar(int $n): int
{
    $summa = 0;
    for ($i = 1; $i <= $n; $i += 2) {
        $summa += $i;
    }
    return $summa;
}

?>

<form method="post">
    <label for="n"> N: </label>
    <input type="number"
           name="n" id="n"
           required autofocus>

    <input type="submit"
           value="Hisoblash">
</form>

<p>
    <?php
    if (!empty($toqSonlarSummasi)) {
        echo "$n gacha bo'lgan toq sonlar: <br>";
        for ($i = 1; $i <= $n; $i++) {
            if ($i % 2 != 0) {
                echo "$i ";
            }
        }
        echo "<br>Ularning yig'indisi: $toqSonlarSummasi";
    }
    ?>
</p>