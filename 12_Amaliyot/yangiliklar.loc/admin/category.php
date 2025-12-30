<?php

/** @var object $pdo */

require_once __DIR__ . "/../dbconnect.php";     // mysql bazaga ulanish
require_once __DIR__ . '/header.php';

try {
    $kategoriyalar = $pdo->prepare("SELECT * FROM `category`");
    $kategoriyalar->execute();
    $natijalar = $kategoriyalar->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die($e->getMessage());
}

/*
foreach ($natijalar as $natija) {
    echo $natija['id'] . " - " . $natija['title'] . "<br>";
}
*/

?>

    <div class="container">
        <h1>Kategoriyalar ro'yhati</h1>
        <a href="category/add_category.php" class="btn btn-success">Qo'shish</a>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>
                    ID
                </th>
                <th>
                    Nomi:
                </th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($natijalar as $natija): ?>
                <tr>
                    <td>
                        <?= $natija['id'] ?>
                    </td>
                    <td>
                        <?= $natija['title'] ?>
                    </td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    </div>

<?php
require_once __DIR__ . '/footer.php';