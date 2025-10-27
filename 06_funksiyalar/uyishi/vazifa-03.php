<?php
/**
 * 3. Kun boshidan boshlab N sekund vaqt o’tdi.
 * Kun boshidan boshlab qancha soat ,
 * minut, sekund o’tganini aniqlaydigan
 * funksiya hosil qiling.
 * (2 soat, 14 minut, 34 sekund o'tdi)
 */

$soniya = '';
$daqiqa = '';
$soat = '';

function soat($soniya): int
{
    return (int)($soniya / 60 / 60);
}

function daqiqa($soniya): int
{
    return $soniya / 60;
}

function qoldiq_soniya($soniya): int
{
    return $soniya % 3600;
}

function soniya($qoldiq_soniya): int
{
    return $qoldiq_soniya % 60;
}

if (!empty($_POST['soniya'])) {
    $soniya = intval(trim($_POST['soniya']));

    $soat = soat($soniya);
    $qoldiq_soniya = qoldiq_soniya($soniya);
    $daqiqa = daqiqa($qoldiq_soniya);
    $soniya = soniya($qoldiq_soniya);


//    $daqiqa = $soniya / 60;
//    $soat = $daqiqa / 60;
}
?>

<form method="post">
    <label for="n">Kun boshidan boshlab qancha vaqt o'tdi: </label>
    <input type="number" required
           id="n"
           name="soniya"
           placeholder="Qancha soniya o'tganini kiriting"
           min="1"
           max="86400"
           step="1"
           value="0"
    >
    <br>
    <input type="submit" value="Yuborish"> <br>
</form>

<p>
    <?php echo "Kun boshidan boshlab <br>"; ?>
    <?php echo "$soat soat <br>" ?? 0; ?>
    <?php echo "$daqiqa daqiqa <br>" ?? 0; ?>
    <?php echo "$soniya soniya o'tdi <br>" ?? 0; ?>.
</p>

