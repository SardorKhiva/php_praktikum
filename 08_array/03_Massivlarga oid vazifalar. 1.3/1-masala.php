<?php
// 1-masala. ”2019-12-03” formatini
// o’zgartiradigan convertor qiling.
// Html select yoki radio dan foydalanib.
// Quyidagi formatlarga o’gira olsin.
// -3-dekabr, 2019 yil
// -3/12/2019
// -dekabr 3, 2019
// -03.12.2019
// -2019/03/12
// -20190312
// -3-dekabr
$format1 = $format2 = $format3 =
$format4 = $format5 = $format6 =
$format7 = null;

if (!empty($_POST['date'])) {
//    print_r($_POST['date']);  // sanani tekshirish

    // kiritilgan sana massivini yil, oy, kun o'zgaruvchisiga olamiz
    list($year, $month, $day) = explode('-', $_POST['date']);
    $day = intval($day);
    $month = intval($month);
    $year = intval($year);

    $oy_nomi = getMonthName($month);

    // 3-dekabr, 2019 yil
    $format1 = "$day-$oy_nomi, $year-yil";

    // 3/12/2019
    $format2 = "$day/$month/$year";

    // dekabr 3, 2019
    $format3 = "$oy_nomi $day, $year";

    // 03.12.2019
    if ($day < 10) {
        $format4 = "0$day.$month.$year";
    } else {
        $format4 = "$day.$month.$year";
    }

    // 2019/03/12
    $format5 = "$year/$month/$day";

    // 20190312
    $format6 = "$year$day$month";

    // 3-dekabr
    $format7 = "$day-$oy_nomi";
}

function getMonthName(int $month): string
{
    return match ($month) {
        1 => "yanvar",
        2 => "fevral",
        3 => "mart",
        4 => "aprel",
        5 => "may",
        6 => "iyun",
        7 => "iyul",
        8 => "avgust",
        9 => "septembar",
        10 => "oktyabr",
        11 => "noyabr",
        12 => "decembr"
    };
}

?>

<form method="post">
    <h3><label for="date">Kun-Oy-Yil:</label></h3>
    <input type="date" name="date" id="date">
    <input type="submit" value="OK"> <br><br>

    <h3><label>Qaysi ko'rinishga o'girasiz: </label></h3>

    <!-- 3-dekabr, 2019 yil -->
    <input type="radio" id="date1" name="format" value="format1">
    <label for="date1"> 8-iyun, 1995-yil </label><br>

    <!-- -3/12/2019 -->
    <input type="radio" id="date2" name="format" value="format2">
    <label for="date2"> 8/6/1995</label> <br>

    <!--  dekabr 3, 2019  -->
    <input type="radio" id="date3" name="format" value="format3">
    <label for="date3">iyun 8, 1995</label><br>

    <!--    03.12.2019-->
    <input type="radio" id="date4" name="format" value="format4">
    <label for="date4">08.06.1995 </label><br>

    <!--    2019/03/12-->
    <input type="radio" id="date5" name="format" value="format5">
    <label for="date5">1995/08/06 </label><br>

    <!--    20190312-->
    <input type="radio" id="date6" name="format" value="format6">
    <label for="date6">19950806</label><br>

    <!--    3-dekabr-->
    <input type="radio" id="date7" name="format" value="format7">
    <label for="date7">8-iyun</label><br><br>
</form>

<p>
    <?php
    if (!empty($_POST['date']) && !empty($_POST['format'])) {
        $tanlanganFormat = $_POST['format'];
        echo match ($tanlanganFormat) {
            "format1" => $format1,
            "format2" => $format2,
            "format3" => $format3,
            "format4" => $format4,
            "format5" => $format5,
            "format6" => $format6,
            "format7" => $format7,
            default => "Bunday format yo'q\n"
        };
    }
    ?>
</p>