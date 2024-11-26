<?php
session_start();
require_once ('db.php');
if (!isset($_SESSION['is_admin']) || $_SESSION['is_admin'] !== 1) {
    header('Location: main.php');
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="icons/logotype.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Админ панель</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="main.php">1С Магазин</a>
            
        </div>
</nav>

<div class="container mt-4">
    <h1>Админ панель</h1>
    <a href="add_product.php" class="btn btn-primary">Добавить товар</a>
    <table class="table">
        <thead>
            <tr>
                <th>Название</th>
                <th>Описание</th>
                <th>Цена</th>
                <th>Категория</th>
                <th>Картинка</th>
                <th>Действия</th>
            </tr>
        </thead>
        <tbody>
            <?php            
            $products = $conn->query("SELECT * FROM products");
            foreach($products as $product): ?>
                <tr>
                    <td><?= $product['title'] ?></td>    
                    <td><?= $product['description'] ?></td>
                    <td><?= $product['price'] ?></td>
                    <td><?= $product['category'] ?></td>            
                    <td><img src="<?= $product['image_path'] ?>" alt="<?= $product['title'] ?>" width="100"></td>
                    <td>
                        <a href="edit_product.php?id=<?= $product['id'] ?>" class="btn btn-primary mt-1 mb-2">Редактировать</a>
                        <a href="delete_product.php?id=<?= $product['id'] ?>" class="btn btn-danger">Удалить</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
</body>
</html>