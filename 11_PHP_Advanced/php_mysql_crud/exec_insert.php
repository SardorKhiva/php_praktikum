<?php

global $conn;
require_once '01_connect.php';

$insert = "INSERT INTO test.talaba (firstname, lastname, email)
VALUES ('SADF', 'SADGGDSAF', 'SAGFVD')";

try {
    $conn->exec($insert);
    echo 'inserted!';
} catch (PDOException $e) {
    echo 'not inserted: ' . $e->getMessage();
}