<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous">

<?php
//var_dump($_POST);

// eski qyimatlarni formada qoldirish uchun:
$login = null;
$telefon = null;
$parol = null;

// XATO BO'LSA XATOLIK HAQIDA XABAR BERSIN, AKS HOLDA DAVOM ETSIN:
// login bor bo'lsa va login bo'sh bo'lmasa:
if (isset($_POST['login']) && !empty($_POST['login']) &&
    isset($_POST['telefon']) && !empty($_POST['telefon']) &&
    isset($_POST['parol']) && !empty($_POST['parol'])
) {
    $login = trim($_POST['login']);
    $telefon = trim($_POST['telefon']);
    $parol = trim($_POST['parol']);
//    echo "$login <br> $telefon <br> $parol";

    if (strlen($login) < 6 || strlen($parol) < 6) {
        echo "Login va parol 6 ta belgidan ko'p bo'lishi kerak <br>";
    }

    // telefonni 1-belgisi + ni 0-indexli element deb olib + ga teg bo'lmasa
    if ($telefon[0] != '+') {
        echo "Telefon raqam + bilan boshlanishi kerak <br>";
    }

    if (substr($telefon, 1, 3) != '998') {
        echo "$telefon kodi O'zbekistonniki emas <br>";
    }

    // + bilan jami 13 xona bo'lmasa yoki + dan keyingi xonadagi belgilar son bo'lmasa
    if (strlen($telefon) != 13 ||
        !is_numeric(substr($telefon, 1))) {
        echo "$telefon raqami telefon raqam emas <br>";
    }

}


/* 2-usul:
// agar massivda login kalitli element bo'lmasa '' ni o'zlashtirsin:
$login = $_POST['login'] ?? '';
// agar login bo''sh bo'lmasa:
if (!empty($login)) {
    // login dan ortiqcha bo'shliqlarni olib tashlansin
    $login = trim($login);
}   */
?>

<div class="col-md-3">
    <h1>Kirish</h1>
    <form method="post" action="06_amaliyot_register_form.php">
        <div class="mb-3">
            <label for="exampleInputName" class="form-label">Ism:</label>
            <input type="text" class="form-control" id="exampleInputName" name="login" required
                   placeholder="Isminggizni kiriting"
                   value="<?= htmlspecialchars($login ?? '') ?>"
            >

        </div>
        <div class="mb-3">
            <label for="exampleInputPhone" class="form-label">Telefon raqam:</label>
            <input type="text" class="form-control" id="exampleInputPhone" name="telefon" required
                   placeholder="Telefon raqamni kiriting"
                   value="<?= htmlspecialchars($telefon ?? '') ?>"
            >
        </div>

        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Parol:</label>
            <input type="password" class="form-control" id="exampleInputPassword1" name="parol" required
                   placeholder="Parolni kiriting"
                   value="<?= htmlspecialchars($parol ?? '') ?>"
                   >
        </div>
        <!--                <div class="mb-3 form-check">-->
        <!--                    <input type="checkbox" class="form-check-input" id="exampleCheck1">-->
        <!--                    <label class="form-check-label" for="exampleCheck1">Saqlab qolish</label>-->
        <!--                </div> -->
        <button type="submit" class="btn btn-primary">Kirish</button>
    </form>
</div>