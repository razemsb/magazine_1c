<?php
session_start();    
require_once('db.php');

if (isset($_POST['name'], $_POST['email'], $_POST['product_ids'], $_POST['phone'], $_SESSION['user_id'])) {      
    $user_id = $_SESSION['user_id'];
    $name = htmlspecialchars($_POST['name']); 
    $phone = htmlspecialchars($_POST['phone']);
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $product_ids = htmlspecialchars($_POST['product_ids']);
    $conn->begin_transaction();
    try {
        $stmt = $conn->prepare("INSERT INTO orders (user_id, name, phone, email, product_id, order_date) VALUES (?, ?, ?, ?, ?, NOW())");
        $stmt->bind_param("issss", $user_id, $name, $phone, $email, $product_ids);
        $stmt->execute();
        $product_ids_array = explode(",", $product_ids);
        foreach ($product_ids_array as $product_id) {
            $stmt = $conn->prepare("UPDATE products SET quantity = quantity - 1 WHERE id = ? AND quantity > 0");
            $stmt->bind_param("i", $product_id);
            $stmt->execute();
            $product_name = $conn->query("SELECT title FROM products WHERE id = $product_id")->fetch_assoc()['title'];
            if ($stmt->affected_rows == 0) {
                throw new Exception("Товар $product_name недоступен или уже распродан.");
                unset($_SESSION['cart']);  
            }
        }
        $conn->commit();
        unset($_SESSION['cart']);        
        echo "<script>alert('Заказ успешно оформлен!'); window.location.href = 'main.php';</script>";
    } catch (Exception $e) {
        $conn->rollback();
        echo "<script>alert('Ошибка: " . $e->getMessage() . "'); window.location.href = 'buylist.php';</script>";
    }
} else {
    echo "<script>alert('Ошибка: Не все данные заполнены!'); window.location.href = 'buylist.php';</script>";
}
?>
