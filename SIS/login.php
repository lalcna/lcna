<?php
session_start();
include('db.php'); // Make sure db.php has $conn and no extra spaces

$error = '';

if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT * FROM admin WHERE username=? LIMIT 1");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $admin = $result->fetch_assoc();

    if ($admin && password_verify($password, $admin['password'])) {
        $_SESSION['admin'] = $admin['username'];
        header("Location: admin.php");
        exit;
    } else {
        $error = "Invalid username or password";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<style>
body{font-family:"Segoe UI", Roboto,sans-serif; background:#f4f6f9; display:flex; justify-content:center; align-items:center; height:100vh;}
.login-container{background:#fff; padding:30px; border-radius:12px; box-shadow:0 4px 12px rgba(0,0,0,0.1); width:300px;}
.login-container h2{text-align:center; margin-bottom:20px;}
.login-container input{width:100%; padding:10px; margin:10px 0; border-radius:8px; border:1px solid #ddd; outline:none;}
.login-container button{width:100%; padding:10px; border:none; border-radius:8px; background:#333; color:#fff; cursor:pointer; transition:0.3s;}
.login-container button:hover{background:#555;}
.error{color:red; text-align:center;}
</style>
<link rel="shortcut icon" href="tkpt.png" type="image/x-icon">
</head>
<body>
<div class="login-container">
    <h2>Editorial Board Login</h2>
    <?php if ($error) echo "<p class='error'>$error</p>"; ?>
    <form method="POST">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit" name="login">Login</button>
    </form>
</div>
</body>
</html>
