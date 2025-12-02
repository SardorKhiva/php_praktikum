<?php
/**
 * Foydalanuvchi: User
 * Loyiha nomi: PRAKTIKUM
 * Fayl nomi: 14_Fayl_yuklash.php
 * Fayl yaratilgan: 02.12.2025 8:55
 * Maqsad: PHP da serverga fayl yuklash
 */
?>
    <!doctype html>
    <html lang="uz">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Fayl yuklash</title>
    </head>
    <body>
    <form action="14_Fayl_yuklash.php" method="post" enctype="multipart/form-data">
        <label for="image">Rasm tanlang</label>
        <input type="file" name="img" id="image">
        <input type="submit" value="Rasmni serverga yuklash">
    </form>
    </body>
    </html>

<?php
$upload_folder = 'uploads/';  // fayllar yuklanadigan jild
if (isset($_FILES['img'])) {  // agar $_FILES superglobal massivida html da name=img bo'lgan element bo'lsa

    if (!is_dir($upload_folder)) {  // agar uploads papkasi bo'lmasa
        mkdir($upload_folder);     // shunday papka hosil qilinsin
    }

    $errors = array();  // xatolarni o'zida saqlovchi massiv
    $file_name = $_FILES['img']['name'];  // yuklanayotgan fayl nomi, kengaytmasi bilan
    $file_size = $_FILES['img']['size'];  // fayl hajmi baytlarda
    $file_tmp = $_FILES['img']['tmp_name'];  // fayl vaqtinchalik nomi
    $file_type = $_FILES['img']['type'];     // fayl turi, masalan image/png
    $file_format_arr = explode('.', $file_name); // fayl nomini nuqtalar bilan ajratish va massiv qilish
    $file_ext = strtolower(end($file_format_arr)); // shu oxirgi nuqtadan keyingi jumla fayl formati

    $extensions = array("jpeg", "jpg", "png");  // ruxsat etilgan kengaytmalar

    // agar yuklanyotgan fayl kengaytmasi $extensions massivi ichida bo'lmasa
    if (in_array($file_ext, $extensions) === FALSE) {
        $errors[] = "Fayl formati JPEG, JPG yoki PNG bo'lishi kerak";
    }

    // fayl hajmi 2 MiB dan katta emasligini tekshirish
    if ($file_size > 2097152) {
        $errors[] = "Rasm hajmi 2 MiB dan katta bo'lmasligi kerak";
    }

    // agar $errors[] bo'sh bo'lsa, xatolar bo'lmasa
    if (empty($errors)) {
        move_uploaded_file($file_tmp, $upload_folder . $file_name);
        echo 'Image uploaded successfully';
        echo "<pre>";
        print_r($_FILES);
        echo "</pre>";
    } else {  // aks holda, xatolar chiqarilsin
        echo "<pre>";
        print_r($errors);
        echo "</pre>";
    }
}


/*
Fayl yuklanganda asosiy 4 ta ma'lumot keladi:
$_FILES['file']['tmp_name'] - yuklangan faylning serverdagi vaqtinchalik nomi
$_FILES['file']['name']     - yuklangan fayl nomi
$_FILES['file']['size']     - yuklangan faylning baytlardagi hajmi
$_FILES['file']['type']     - yuklangan faylning MIME type
*/