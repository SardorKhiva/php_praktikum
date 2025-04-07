<?php

require '01_connect.php';

$firstname = 'Sardor';
$sth = $conn->prepare("SELECT * FROM test.talaba WHERE firstname = :ism;");
$sth->bindParam(':ism', $firstname, PDO::PARAM_STR);
$sth->EXECUTE();
$result = $sth->fetchAll(PDO::FETCH_ASSOC);

echo '<pre>';
print_r($result);
echo '</pre>';
