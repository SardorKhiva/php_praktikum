<?php

require '02_conn.php';

// INSERT
/*
$insert = "INSERT INTO `test`.`talaba`
    (`firstname`, `lastname`)
    VALUES(?, ?)";

$stmt = $conn->prepare($insert);

try {
    $stmt->execute(['ism', 'familya']);
    echo 'ism familya insert qilindi';
} catch (Throwable $e) {
    echo $e->getMessage();
}

echo "\nIsmini kiriting: ";
$firstname = trim(fgets(STDIN));

echo "Familyasini kiriting: ";
$lastname = trim(fgets(STDIN));

try {
    $stmt->execute([$lastname, $firstname]);
    echo "$firstname va $lastname jadvalga INSERT qilindi";
} catch (PDOException $e) {
    echo $e->getMessage();
}
*/

// bindParam
$stmt = $conn->prepare("INSERT INTO `talaba` (`firstname`, `lastname`)
VALUES (:firstname, :lastname)");

$stmt->bindParam(':firstname', $firstname);
$stmt->bindParam(':lastname', $lastname);

$firstname = 'ismigul';
$lastname = 'familyasigul';
$stmt->execute();

$data = [
    ':firstname' => $firstname,
    ':lastname' => $lastname
];
$stmt->execute($data);