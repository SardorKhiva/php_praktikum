<?php
$host = '127.0.0.1';
$user = 'root';
$password = '1302';
$dbname = 'test';
$dsn = "mysql: host = $host; dbname = $dbname";
$conn = null;

try {
    $conn = new PDO ($dsn, $user, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "PDO orqali MySQL ga ulandi!" . PHP_EOL;
} catch (PDOException $e) {
    echo "PDO orqali MySQL ga ulanishda xatolik sodir bo'ldi: " . $e->getMessage() . PHP_EOL;
}


// bindParam
$sql = $conn->prepare("INSERT INTO test.talaba (firstname, lastname, email)
VALUES (:firstname, :lastname, :email)");

$sql->bindParam(":firstname", $firstname);
$sql->bindParam(":lastname", $lastname);
$sql->bindParam(":email", $email);

$firstname = "Alisher";
$lastname = "Hamza";
$email = "alisher@gmail.com";
saveDb($sql);


echo "Ismi: ";
$firstname = trim(fgets(STDIN));

echo "Familyasi: ";
$lastname = trim(fgets(STDIN));

echo "Email: ";
$email = trim(fgets(STDIN));

saveDb($sql);

function saveDb(&$sql)
{
    try {
        $sql->execute();
        echo "Saqlandi!" . PHP_EOL;
    } catch (PDOException $e) {
        print $e->getMessage();
    }
}

