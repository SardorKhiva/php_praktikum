<?php

require '01_connect.php';

$baza = $conn->prepare("SHOW DATABASES;");
$baza->execute();
$baza_table = $baza->fetchAll(PDO::FETCH_ASSOC);
echo '<pre>';
echo '<code>';
print_r($baza_table);
echo '</code>';
echo '</pre>';

echo '<table border="1">';
foreach ($baza_table as $baza) {
    echo "<tr>";
    echo '<ol>';
    echo '<td>';
    echo $baza['Database'];
    echo '</td>';
    echo '</ol>';
    echo '</tr>';
}
echo '</table>';

echo '<br><hr><br>';

$talaba = $conn->prepare("SELECT * FROM test.talaba;");
$talaba->execute();
$talaba_jadvali = $talaba->fetchAll(PDO::FETCH_ASSOC);

echo '<table border="1">';
    echo '<thead>';
        echo '<th>';
            echo '№';
        echo '</th>';
        echo '<th>';
            echo 'Ismi:';
        echo '</th>';
        echo '<th>';
            echo 'Familyasi: ';
        echo '</th>';
    echo '</thead>';
foreach ($talaba_jadvali as $talaba) {
    echo '<tr>';
        echo '<td>';
        echo $talaba['id'];
        echo '</td>';
        echo '<td>';
            echo $talaba['firstname'];
        echo '</td>';

        echo '<td>';
            echo $talaba['lastname'];
        echo '</td>';
    echo '</tr>';
}
echo '</table>';