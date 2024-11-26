<?php
session_start();    
require_once ('db.php');
if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['product_id'])) {    
    $name = $_POST['name'];
    $email = $_POST['email'];   
    $product_id = $_POST['product_id'];    
    $stmt = $conn->prepare("INSERT INTO orders (name, email, product_id) VALUES (?, ?, ?)");
    $stmt->bind_param("ssi", $name, $email, $product_id);
    $stmt->execute();
    $stmt->close();
    unset($_SESSION['cart']);        
    echo "<script>alert('Заказ успешно оформлен!'); window.location.href = 'main.php';</script>";
} else {
    echo "<script>alert('Ошибка оформления заказа!'); window.location.href = 'buylist.php';</script>";
}   
?>  