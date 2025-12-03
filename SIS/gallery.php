<?php
include('db.php');

// Get ID and date from URL
$id = $_GET['id'] ?? null;
$date = $_GET['date'] ?? date('Y-m-d');

if(!$id){
    echo "Invalid gallery item.";
    exit;
}

// Fetch gallery item
$stmt = $conn->prepare("SELECT * FROM gallery WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if($result->num_rows==0){
    echo "Gallery item not found.";
    exit;
}

$item = $result->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?= htmlspecialchars($item['title']) ?></title>
<style>
body {font-family:'Segoe UI', Roboto, sans-serif; background:#f8f9fb; margin:0; padding:20px; display:flex; justify-content:center;}
.container {max-width:800px; width:100%; background:#fff; border-radius:15px; padding:20px; box-shadow:0 10px 25px rgba(0,0,0,0.08);}
img {width:100%; border-radius:12px; object-fit:cover; margin-bottom:20px;}
h1 {font-size:1.8em; color:#222; margin-bottom:15px;}
p {font-size:1em; color:#555; line-height:1.5; margin-bottom:20px;}
.small {font-size:0.85em; color:#888; margin-bottom:15px;}
.back-btn {
    display:inline-block; padding:10px 20px; background:#33C98B; color:#fff;
    border-radius:8px; text-decoration:none; font-weight:600; transition:0.3s;
}
.back-btn:hover {background:#28a174;}
</style>
<link rel="shortcut icon" href="tkpt.png" type="image/x-icon">
</head>
<body>
<div class="container">
    <img src="<?= htmlspecialchars($item['image']) ?>" alt="<?= htmlspecialchars($item['title']) ?>">
    <h1><?= htmlspecialchars($item['title']) ?></h1>
    <div class="small">Posted on: <?= $item['created_at'] ?></div>
    <p><?= nl2br(htmlspecialchars($item['description'])) ?></p>
    <a href="index.php?date=<?= $date ?>" class="back-btn">← Let leh na</a>
</div>
</body>
</html>
