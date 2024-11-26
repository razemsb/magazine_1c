<?php
session_start();
require_once('db.php');
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $stmt = $conn->prepare("SELECT * FROM products WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $product = $result->fetch_assoc();
    $stmt->close();
}   
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="icons/logotype.png" type="image/x-icon">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Редактирование товара</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="main.php">«ИнфоСофт»</a>
    </div>
</nav>
    <h1>Редактирование товара</h1>  
       <form action="edits.php" method="post" enctype="multipart/form-data" class="edit-form">
        <input type="hidden" name="id" value="<?= $product['id'] ?>">
        <input type="text" name="title" placeholder="Название" value="<?= $product['title'] ?>"><br>
        <input type="text" name="description" placeholder="Описание" value="<?= $product['description'] ?>"><br>
        <input type="number" step="0.01" name="price" placeholder="Цена" value="<?= $product['price'] ?>"><br>
        <select name="category"> 
        <?php
            $categories = $conn->query("SELECT * FROM categories");
            foreach ($categories as $category) {
                echo "<option value='" . $category['name'] . "'>" . $category['name'] . "</option>";
            }
        ?>    
        </select> 
        <br>
        <input type="text" name="version" placeholder="Версия" value="<?= $product['version'] ?>"><br>
        <input type="text" name="license_type" placeholder="Тип лицензии" value="<?= $product['license_type'] ?>"><br>
        <img src="<?= $product['image_path'] ?>" alt="<?= $product['title'] ?>" width="100"><br>    
        <input type="submit" value="Сохранить">
    </form>
</body>
</html>