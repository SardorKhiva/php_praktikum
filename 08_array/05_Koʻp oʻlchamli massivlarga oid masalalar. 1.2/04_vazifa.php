<?php

static $contacts =
[
    ['ismi' => 'Sardor','telefoni' => '+99812345671'],
    ['ismi' => 'Abror', 'telefoni' => '+99812345672'],
    ['ismi' => 'Mahmud', 'telefoni' => '+99812345673'],
    ['ismi' => 'Abdulloh', 'telefoni' => '+99812345674'],
    ['ismi' => 'Abdurraxmon', 'telefoni' => '+99812345675'],
    ['ismi' => 'Abdurroxiym', 'telefoni' => '+99812345676'],
    ['ismi' => 'Abdulqahhor', 'telefoni' => '+99812345677'],
];

?>


<!doctype html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Kontaktlar</title>
</head>
<body>
<h3>Kontaktlar orasidan qidirish: </h3>
<form method="post">
    <table>
        <tbody>
        <tr>
            <td>
                <label for="ism">Ismi: </label>
            </td>
            <td>
                <input type="text" name="ism"
                       id="ism" minlength="1"
                       placeholder="ismini kiriting">
            </td>
        </tr>
        <tr>
            <td>
                <label>Telefoni: </label>
            </td>
            <td>
                <input type="tel" id="telefon" name="telefon" minlength="3"
                       placeholder="telefonini kiriting">
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="Qidirish"></td>
        </tr>
        </tbody>
    </table>
</form>
<hr>

<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST')
{
    echo "Mavjud kontaktlar: <br>";
    foreach ($contacts as $contact)
    {
        foreach ($contact as $key => $value)
        {
            echo "$key: $value<br>";
        }
        echo "<br>";
    }
    
    echo "<h3>Topilgan kontaktlar:</h3>";
    foreach ($contacts as $contact)
    {
        if ( $contact['ismi']     === $_POST['ism'] || 
             $contact['telefoni'] === $_POST['telefon'] )
            echo $contact['ismi'] . " " . $contact['telefoni'] . "<br>";
        
//        if ($contact['telefoni'] === $_POST['telefon']
//            echo $contact['ismi'] . " " . $contact['telefoni'] . "<br>";
    }
}

?>

</body>
</html>


