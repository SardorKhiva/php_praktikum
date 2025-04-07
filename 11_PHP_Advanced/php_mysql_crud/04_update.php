<?php
require_once "01_connect.php";

$sql_update = "UPDATE test.talaba
SET firstname = :firstname
WHERE id = :id";
$prepare = $conn->prepare($sql_update);
$prepare->bindParam(':firstname', $firstname);
$prepare->bindParam(':id', $id);

$firstname = "Jasur";
$id = 4;

if ($prepare->execute() === TRUE) {
    echo "Talaba jadvalidagi yozuv yangilandi\n";
} else {
    echo "Talaba jadvalidagi yozuv yangilanmadi\n";
};
