<?php
require_once '04_dbconnect.php';

//              Bazaga ma'lumot qo'shish (INSERT)
//        MySQLi da
$sql_insert = "INSERT INTO test.talaba
(firstname, lastname, email) 
VALUES ('Maxmud', 'Qobulov', 'maxmud@gmail.com')";

// MySQLi
if ($conn_mysqli->query($sql_insert) === TRUE) {
    echo "mysqli orqali jadvalga yangi ma'lumot yozildi" . PHP_EOL;
} else {
    echo "mysqli orqali jadvalga yangi ma'lumot yozishda xatolik: " . $conn_mysqli->error . PHP_EOL;
}
// $conn_mysqli->close();   // aloqani uzish

//        PDO da
$sqlInsert = "INSERT INTO test.charTest(matn)
VALUES ('PDO orqali bazaga matn kiritish');";

try {
    $conn->exec($sqlInsert);
    echo "PDO orqali yangi ma'lumot kiritildi" . PHP_EOL;
} catch (PDOException $e) {
    echo "PDO orqali yangi ma'lumot kiritishda xatolik: " . $e->getMessage() . PHP_EOL;
}

//          Bir vaqtni o'zida bir nechta ma'lumot yozish:
//  MySQLi da
// multi_query() - funksiyasi orqali amalga oshirish mumkin
$sql_insert = "INSERT INTO test.varcharTest (matn)
VALUES ('Bu matn mysqli multi_query orqali bazaga kiritildi_1'),
       ('Bu matn mysqli multi_query orqali bazaga kiritildi_2'),
       ('Bu matn mysqli multi_query orqali bazaga kiritildi_3')";

if ($conn_mysqli->multi_query($sql_insert) === TRUE) {
    echo "mysqli orqali multi_query funskiyasi ishlatilib ma'lumotlar kiritildi" . PHP_EOL;
} else {
    echo "mysqli orqali multi_query funskiyasi ishlatilib ma'lumotlar kiritishda xatolik: " . $conn_mysqli->error;
}
//$conn_mysqli->close();

//        PDO da
try {
    $conn->exec($sql_insert);
    echo "PDO orqali yangi ma'lumot kiritildi" . PHP_EOL;
} catch (PDOException $e) {
    echo "PDO orqali multi_query ishlatishda xatolik: " . $e->getMessage() . PHP_EOL;
}

//  lastInsertId() - so'nggi kiritilgan qator yoki ketma-ketlik IDsi
echo $conn->lastInsertId() . PHP_EOL;


//                        PHP + MySQL:INSERT
$sql_insert = "INSERT INTO test.varcharTest(matn)
VALUES ('PDO orqali bazaga matn kiritildi');";

//      PDO
echo "\texec() bilan insert qilish\n";

try {
    $conn->exec($sql_insert);
    echo "PDO exec orqali yangi ma'lumot kiritildi\n" . PHP_EOL;
} catch (PDOException $e) {
    echo "PDO exec orqali yangi ma'lumot kiritishda xatolik: " . $e->getMessage() . PHP_EOL;
}

echo "\tprepare() bilan INSERT qilish\n";

$insert = "INSERT INTO test.talaba(firstname, lastname, email) 
VALUES (?, ?, ?);";
$stmt = $conn->prepare($insert);
try {
    $stmt->execute(['Shuxrat', 'Shonazarov', 'shuxrat@gmail.com']);
    echo "prepare() bilan INSERT qilindi\n";
} catch (Exception $e) {
    print_r($e->getMessage());
}

// yoki
$data = [
    ":firstname" => "Shuxratchik",
    ":lastname" => "Shonazarov",
    ":email" => "shuxratchik@gmail.com"
];
$insert = "INSERT INTO test.talaba(firstname, lastname, email)
VALUES (:firstname, :lastname, :email);";
$stmt = $conn->prepare($insert);
try {
    $stmt->execute($data);
} catch (Exception $e) {
    print_r($e->getMessage());
}
