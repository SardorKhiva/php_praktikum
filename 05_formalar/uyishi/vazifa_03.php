<form action="vazifa_03.php" method="post">
    <!-- Hafta kuni tartib raqamini kiritish maydoni -->
    <label for="hafta_kun">Hafta kuni tartib raqamini: </label>
    <input required id="hafta_kun" type="number" name="hafta_kun" min="1" max="7"
           placeholder="1-7 oraliqdagi son kiriting" style="width: 15%;">

    <!-- Yuborish tugmasi -->
    <input type="submit" value="Yuborish">
</form>

<?php

/**
 * 3. Forma hosil qiling va bitta polya joylang.
 * 1-7 oraliqdagi son kiritilsa,
 * shunga qarab hafta kunlarini ekranga chiqarsin.
 */

if (!empty($_POST['hafta_kun'])) {
    $hafta_kun = trim($_POST['hafta_kun']);
}

if (isset($hafta_kun)) {
    switch ($hafta_kun) {
        case 1:
        {
            echo "dushanba";
            break;
        }
        case 2:
        {
            echo "seshanba";
            break;
        }
        case 3:
        {
            echo "chorshanba";
            break;
        }
        case 4:
        {
            echo "payshanba";
            break;
        }
        case 5:
        {
            echo "juma";
            break;
        }
        case 6:
        {
            echo "shanba";
            break;
        }
        case 7:
        {
            echo "yakshanba";
            break;
        }
    }
}