<?php

require '01_connect.php';

// bazadagi ismi Sardor bo'lganlarni chiqaradi
$firstname = 'Sardor';
$sth = $conn->prepare("SELECT * FROM test.talaba WHERE firstname = :ism;");

//$sth->bindParam(':ism', $firstname); yozmasak ham bo'ladi
$sth->bindParam(':ism', $firstname, PDO::PARAM_STR);
$sth->execute();
$result = $sth->fetchAll(PDO::FETCH_ASSOC);

echo '<pre>';
print_r($result);
echo '</pre>';

echo 'Talaba jadvalida ismi ' . $firstname . ' bo\'lganlar:' . '<br><br>';

echo '<table border="1">';
  echo '<thead>';
    echo '<tr>';
        echo '<th>';
            echo 'ID:';
        echo '</th>';
        echo '<th>';
            echo 'Ismi:';
        echo '</th>';
        echo '<th>';
            echo 'Familyasi:';
        echo '</th>';
        echo '<th>';
            echo 'E-mail:';
        echo '</th>';
    echo '</tr>';
    echo '</thead>';
    echo '<tbody>';
foreach($result as $row){
    echo '<tr>';
        echo '<td>';
            echo $row['id'];
        echo '</td>';

        echo '<td>';
            echo $row['firstname'];
        echo '</td>';

        echo '<td>';
            echo $row['lastname'];
        echo '</td>';

        echo '<td>';
            echo $row['email'];
        echo '</td>';
    echo '</tr>';
}
    echo '</tbody>';
echo '</table>';
