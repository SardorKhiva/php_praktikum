<!--
1. Header qismi. Ya'ni saytning eng tepa, menyular joylashadigan qismi
2. Yangiliklarni o'qish va ro'yxatini ko'rish qismi. Bu qism `content` qismi deyiladi
3. Eng pastgi qismi. Buni veb dasturlashda `footer` deyiladi
-->

<!-- header.php: -->
<?php
echo "bu header";
?>
<br>

<!-- footer.php: -->
<?php
echo "bu footer";
?>
<br>

<!--index.php: -->
<?php
include 'header.php';  // ulamoqchi bo'lgan fayl yo'li va nomi
echo "bu asosiy<br>";
include 'footer.php';

/*
 * include - agar fayl bo'lmasa va shu fayl ichida xato bo'lsa ham davom etaveradi, require esa xato beradi
 * har ikkisiga _once yozilsa bir marta ulanadi va o'zgaruvchilarda conflict bo'lmaydi
 */