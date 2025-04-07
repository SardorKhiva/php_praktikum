<?php

require ('01_connect.php');

$sql_db = $conn->prepare("SHOW DATABASES;");
$sql_db->execute();
$bazalar = $sql_db->fetchAll(PDO::FETCH_ASSOC);
echo '<pre>';
print_r($bazalar);
echo '</pre>';
