<?php
session_start();
$user_login = isset($_SESSION['user_login']) ? $_SESSION['user_login'] : null;
$is_admin = isset($_SESSION['is_admin']) ? $_SESSION['is_admin'] : false;

require_once 'db.php';

$categories = $conn->query("SELECT * FROM categories ORDER BY name");
$products_query = "SELECT * FROM products";
if (isset($_GET['category'])) {
    $category = $conn->real_escape_string($_GET['category']);
    $products_query .= " WHERE category = '$category'";
}
$products = $conn->query($products_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="icons/logotype.png" type="image/x-icon">
    <title>Магазин программ 1С</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<header class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="main.php">«ИнфоСофт»</a>
        <a class="navbar-brand" href="about.html">О нас</a>
    </div>
    <div class="right-element">
    <?php if ($user_login): ?>
                <span class="user-name"><?= htmlspecialchars($user_login) ?></span>
                <a href="session_destroy.php" class="btn logout-btn">Выйти</a>
                <?php if ($is_admin): ?>
                    <a href="admin.php" class="btn admin-btn">Админ</a>
                <?php endif; ?>
            <?php else: ?>
                <a href="index.html" class="btn register-btn">Регистрация/Авторизация</a>
            <?php endif; ?>
        <a href="buylist.php" class="btn btn-primary">Корзина</a>
    </div>
</header>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-3">
                <h4>Категории</h4>
                <div class="list-group">
                    <a href="main.php" class="list-group-item list-group-item-action">Все продукты</a>
                    <?php while($category = $categories->fetch_assoc()): ?>
                        <a href="main.php?category=<?php echo urlencode($category['name']); ?>" class="list-group-item list-group-item-action"> 
                        <?php echo htmlspecialchars($category['name']); ?></a>
                    <?php endwhile; ?>
                </div>
            </div>
            
            <div class="col-md-9">
                <div class="row">
                    <?php while($product = $products->fetch_assoc()): ?>
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <?php if($product['image_path']): ?>
                                    <img src="<?php echo htmlspecialchars($product['image_path']); ?>" 
                                         class="card-img-top" alt="<?php echo htmlspecialchars($product['title']); ?>">
                                <?php endif; ?>
                                <div class="card-body">
                                    <h5 class="card-title"><?php echo htmlspecialchars($product['title']); ?></h5>
                                    <p class="card-text"><?php echo htmlspecialchars(substr($product['description'], 0, 100)) . '...'; ?></p>
                                    <p class="card-text"><strong>Версия:</strong> <?php echo htmlspecialchars($product['version']); ?></p>
                                    <p class="card-text"><strong>Цена:</strong> <?php echo number_format($product['price'], 2); ?> ₽</p>
                                    <p class="card-text"><strong>Категория:</strong> <?php echo htmlspecialchars($product['category']); ?></p>   
                                </div>
                                <button type="button" class="btn btn-primary" onclick="OpenModal(<?php echo $product['id']; ?>)">Подробнее</button>
                                <form action="add_to_cart.php" method="POST">
                                        <input type="hidden" name="product_id" value="<?php echo $product['id']; ?>">
                                        <button type="submit" class="btn btn-success mt-1">В корзину</button>
                                    </form>    
                            </div>
                        </div>
                    <?php endwhile; ?>
                </div>
            </div>
        </div>
    </div>    
  


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="script/script.js"></script>
</body>
</html>
