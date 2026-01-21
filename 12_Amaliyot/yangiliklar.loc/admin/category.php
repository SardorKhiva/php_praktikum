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

?>

    <div class="container">
        <h2>Kategoriyalar ro'yhati</h2>
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