<?php
//require_once 'mysqli_connect.php';  // MySQLi orqali MySQL ga ulanish
require_once 'pdo_connect.php';     // PDO orqali MySQL ga ulanish

//$conn->query("INSERT INTO test.charTest  // test.charTest ga
//VALUES ('Sardor');");                    // shu qiymatlarni yozish

//$conn->query("TRUNCATE TABLE test.charTest");   //

$sql_insert = "INSERT INTO test.charTest
VALUES ('Bu matn')";

// PDO exec() orqali INSERT qilish
try {
    $conn->exec($sql_insert);
    echo "test.charTest ga insert qilindi\n";
} catch (PDOException $e) {
    echo "PDO orqali insert qilishda xatolik: " . $e->getMessage();
}

