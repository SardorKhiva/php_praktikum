<?php

require '02_conn.php';

$sth = $conn->prepare("SELECT * FROM test.talaba");
$sth->execute();

$result_assoc = $sth->fetchAll(PDO::FETCH_ASSOC);   // har bir bazani assotsiativ massiv (ASSOC) sifatda oldi
echo '<pre>';
print_r($result_assoc);

$db = $conn->prepare("SHOW DATABASES");
$db->execute();

$DB = $db->fetchAll(PDO::FETCH_OBJ);    // har bir bazani object sifatida oldi
print_r($DB);