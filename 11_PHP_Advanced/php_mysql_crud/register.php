<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ro'yhatdan o'tish</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<form action="register.php" method="post">
    <label for="firstname">Isminggiz:</label>
    <input type="text" name="firstname" id="firstname">
    <br>

    <label for="lastname">Familyanggiz:</label>
    <input type="text" name="lastname" id="lastname">
    <br>

    <label for="email">Email:</label>
    <input type="email" name="email" id="email">
    <br>

    <!--    <label for="ok"></label>-->
    <input type="submit" name="ok" id="ok" value="OK">
</form>
</body>
</html>

<?php

require("01_connect.php");

if (isset($_POST["firstname"]) && isset($_POST["lastname"])) {
    $firstname = $_POST["firstname"];
    $lastname = $_POST["lastname"];
    $email = $_POST["email"];

    $sql_insert = "INSERT INTO test.talaba (firstname, lastname, email) 
    VALUES (?, ?, ?);";

    $stmt = $conn->prepare($sql_insert);

    try {
        $stmt->execute([$firstname, $lastname, $email]);
        echo "Saqlandi!";
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
}
