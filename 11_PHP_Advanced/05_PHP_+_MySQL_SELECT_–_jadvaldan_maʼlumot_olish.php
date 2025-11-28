<?php
require_once 'conn.php';
goto resume;

// PHP + MySQL: SELECT

// prepare()   - tayyorlaydi
// execute() - bajaradi
// fetchAll  - barchasini oladi
// test.talaba jadvalini assoc massiv qilib olish
$sth = $pdo->prepare("SELECT * FROM `talaba`;");
try {
    $sth->execute();
    $natija = $sth->fetchAll(PDO::FETCH_ASSOC);
    echo "<pre>";
    print_r($natija);
    echo "</pre>";
} catch (PDOException $e) {
    echo $e->getMessage();
}


// barcha bazalarni olish
$bazalar = $pdo->prepare("SHOW DATABASES;");
try {
    $bazalar->execute();
    $barchaBazalar = $bazalar->fetchAll(PDO::FETCH_ASSOC);
    echo "<pre>";
    print_r($barchaBazalar);
    echo "</pre>";

} catch (PDOException $e) {
    echo $e->getMessage();
}

// bindparam() SELECT
// jadvalda ma'lum bir o'zgaruvchi qiymati bor bo'lganlarni SELECT qilish

$firstname = 'Sardor';
try {
    $sth = $pdo->prepare("SELECT * FROM `talaba` 
           WHERE firstname = :ism;");
    $sth->bindParam(':ism', $firstname, PDO::PARAM_STR);
    $firstname = 'Jaloly';  // bindparamda keyingi o'zgartirishlar ishlaydi, bindValue da esa yo'q!

    $sth->execute();  // Oxirgi o'zlashgan qiymat, Sarvar bilan bajariladi
    $result = $sth->fetchAll(PDO::FETCH_ASSOC);
    if (!empty($result)) {
        print_r($result);
    } else {
        echo "talaba jadvalida $firstname nomli talaba yo'q\n<br>";
    }
} catch (PDOException $e) {
    echo $e->getMessage();
}


// bindValue SELECT
$firstname = 'Sardor';
try {
    $sth = $pdo->prepare("SELECT * FROM `talaba`
                                WHERE `firstname` = :ismigul;");
    $sth->bindValue(':ismigul', $firstname, PDO::PARAM_STR);
    $firstname = 'JalolyI';
    $sth->execute();  // firstname = 'Sardor' bo'lib bajariladi!
    $natija = $sth->fetchAll(PDO::FETCH_ASSOC);
    if (!empty($natija)) {
        echo "<pre>";
        print_r($natija);
        echo "</pre>";
    }
} catch (PDOException $e) {
    echo $e->getMessage();
}

// fetch() - so'rov natijalaridan bittasini olish
$firstname = 'Sardor';
try {
    $sth = $pdo->prepare("SELECT * FROM `test`.`talaba` WHERE 
                            `firstname` = :ism;");
    $sth->bindValue(':ism', $firstname, PDO::PARAM_STR);
    $sth->execute();
    $fetch_assoc = $sth->fetch(PDO::FETCH_ASSOC);
    echo "<pre>";
    echo "fetch assoc: <br>";
    print_r($fetch_assoc);
    echo "<pre>";
} catch (PDOException $e) {
    echo $e->getMessage();
}

resume:
// fetchAll() - so'rov natijalarini hammasini oladi
$firstname = 'Sardor';
$sth = $pdo->prepare("SELECT * 
                            FROM `talaba`
                            WHERE `firstname` = :ism;");
try {
    $sth->bindValue(':ism', $firstname, PDO::PARAM_STR);
    $sth->execute();
    $natija = $sth->fetchAll(PDO::FETCH_ASSOC);
    if (!empty($natija)) {
        echo "<pre>";
        print_r($natija);
        echo "</pre>";
    }
} catch (PDOException $e) {
    echo $e->getMessage();
}

// rowCount() - so'rov natijasidagi qatorlar soni
$firstname = 'Sardor';
$sth = $pdo->prepare("SELECT * 
                            FROM `talaba` 
                            WHERE `firstname` = :ism;");
try {
    $sth->bindValue(':ism', $firstname, PDO::PARAM_STR);
    $sth->execute();
    $rowCount = $sth->rowCount();
    echo "talaba jadvalida $firstname ismli " . $rowCount . ' ta talaba bor';
} catch (PDOException $e) {
    echo $e->getMessage();
}

// errorInfo()  -  SQL so'rov bajarilganda sodir bo'lgan xatoliklarni olish
$sth = $pdo->prepare("SELECT * 
                            FROM `talaba` 
                            WHERE `firstname` = :ism;");
$sth->bindValue(':ism', $firstname, PDO::PARAM_STR);