<?php
   session_start();
   require_once('db.php');
   if (isset($_POST['id']) && isset($_POST['title']) && isset($_POST['description']) && isset($_POST['price']) && isset($_POST['category']) && isset($_POST['version']) && isset($_POST['license_type'])) {
       $id = $_POST['id'];
       $title = $_POST['title'];
       $description = $_POST['description'];
       $price = $_POST['price'];
       $category = $_POST['category'];
       $stmt = $conn->prepare("UPDATE products SET title = ?, description = ?, price = ?, category = ?, version = ?, license_type = ? WHERE id = ?");
       $stmt->bind_param("ssssssi", $title, $description, $price, $category, $_POST['version'], $_POST['license_type'], $id);
       $stmt->execute();
       $stmt->close();
       header("Location: main.php");
       exit();  
   } else {
       header("Location: main.php");
       exit();
   }    
?>