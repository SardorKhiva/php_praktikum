<?php

require('01_connect.php');

$insert = $conn->prepare("INSERT INTO test.talaba(firstname, lastname, email)
VALUES(:firstname, :lastname, :email);");

$firstname = 'Tom';
$email = 'Tom@gmail.com';

$insert->bindValue(':firstname', $firstname);
$insert->bindValue(':lastname', 'Jerry');   // bindValue da o'zgaruvchidan tashqari qiymatni o'zini bersa ham bo'ladi, bindParam dan farqli o'laroq
$insert->bindValue(':email', $email);

$insert->execute();

