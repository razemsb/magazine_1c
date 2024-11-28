<?php
session_start();
require_once('db.php');
$id = $_POST['order_id'];
$conn->query("DELETE FROM orders WHERE id = '$id'");
header('Location: admin.php?section=orders');
exit(); 