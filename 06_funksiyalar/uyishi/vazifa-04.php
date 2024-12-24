<?php
/**
 * 4. Berilgan son(1 dan 100 gacha bo`lgan sonlar)ni sozlar
 * yordamida ifodalaydigan funksiya hosil qiling.
 * 67 - oltmish yetti
 */
// if dan tashqarida ham ishlaytiladigan o'zgaruvchilar:
//$yuzlar[] = null;
//$onlar[] = null;
//$birlar[] = null;
$num_to_str = '';

if (!empty($_POST['son'])) {
    $son = $_POST['son'];

    // har xonadagi raqam shunga mos indexli son:
    $yuzlar = ["", "yuz"];
    $onlar = ["", "o'n", "yigirma", "o'ttiz", "qirq", "ellik", "oltmish", "yetmish", "sakson", "to'qson"];
    $birlar = ["", "bir", "ikki", "uch", "to'rt", "besh", "olti", "yetti", "sakkiz", "to'qqiz"];

    // yuzlikka tekshirish:
    function yuzmi(int $n): bool
    {
        return $n === 100;
    }

    // o'nlar xonasidaligiga tekshirish:
    function onlikmi(int $n): bool
    {
        return $n > 9 && $n < 100;
    }

    // birlar xonasidaligiga tekshirish:
    function birlikmi(int $n): bool
    {
        return $n > 0 && $n < 10;
    }

    // agar son 100 bo'lsa
    if (yuzmi($son)) {
        // yuzlar massividagi 1-indexli elementni olsin, key == str
        $num_to_str = $yuzlar[1];
    } else if (onlikmi($son)) {
        $num_to_str = $onlar[intval($son / 10)] . ' ' . $birlar[$son % 10];
    } else if (birlikmi($son)) {
        $num_to_str = $birlar[$son];
    }
}
?>

<form method="post">
    <label for="n"></label>
    <input type="number" style="width: 250px;"
           id="n"
           autofocus
           name="son"
           min="1"
           max="100"
           step="1"
           placeholder="1 dan 100 gacha sonni kiriting">
    <br><br>

    <input type="submit" value="So'zda ifodalash:">
</form>
<p> <?php echo $num_to_str; ?></p>
