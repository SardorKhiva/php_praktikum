<?php
require_once __DIR__ . '/header.php';
require_once __DIR__ . '/../dbconnect.php';

if (isset($_POST['cat_add']) && isset($_POST['title'])) {
//    TODO: bazaga category name ni saqlash
    try {

        $title = trim($_POST['title']);
        $sql_insert = "INSERT INTO `category` (`title`) VALUES (:title)";
        $statement = $pdo->prepare($sql_insert);
        $statement->bindparam(':title', $title, PDO::PARAM_STR);
        $statement->execute();
        header('Location: /admin/category.php');
        exit;
    } catch (PDOException $e) {
        echo "kategoriya nomini kiritib bo'lmadi, qaytadan kiritib ko'ring!";
        echo "<br>";
        echo $e->getMessage();
        header('location: add_category.php');
    }

}
?>

    <div class="container">
        <div class="row">
            <form method="post">
                <div class="mb-3">
                    <label for="category_name_input" class="form-label">Kategoriya nomi</label>
                    <input type="text" class="form-control" id="category_name_input" name="title">
                </div>
                <button type="submit" name="cat_add" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>

<?php
require_once __DIR__ . '/footer.php';