<form method="post" name="myForm" action="01_Formalar hosil qilish va ulardan foydalanish.php">
    <label for="name">Name:</label>
    <input type="text" name="name" id="name"> <br>

    <label for="email">Email:</label>
    <input type="email" name="email" id="email"> <br>

    <input type="submit" value="Submit">
</form>

<?php

if (isset($_POST['name'])) {
    echo $_POST['name'];
}
echo "<br>";

if (isset($_POST['email'])) {
    echo $_POST['email'];
}