<?php
include('db.php');

// Get the side section ID and date from URL
$sideId = $_GET['id'] ?? null;
$filterDate = $_GET['date'] ?? date('Y-m-d');

if (!$sideId) {
    die("Invalid side section.");
}

// Fetch the side section content
$stmt = $conn->prepare("SELECT * FROM side_sections WHERE id=? LIMIT 1");
$stmt->bind_param("i", $sideId);
$stmt->execute();
$result = $stmt->get_result();
$side = $result->fetch_assoc();

if (!$side) {
    die("Side section not found.");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?= htmlspecialchars($side['title']) ?> - Side Section</title>
<style>
/* Base */
body {
    font-family:"Segoe UI", Roboto, sans-serif;
    background: linear-gradient(135deg, #e0f7fa, #f1f8e9);
    padding:40px 20px;
    display:flex;
    justify-content:center;
    min-height:100vh;
    margin:0;
    animation: fadeInBody 1s ease;
}

/* Container */
.container {
    width:100%;
    max-width:850px;
    background:#ffffff;
    padding:30px 40px;
    border-radius:20px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    position: relative;
    overflow: hidden;
    animation: fadeInContent 0.8s ease forwards;
    opacity:0;
}

/* Animations */
@keyframes fadeInContent {
    from {opacity:0; transform: translateY(20px);}
    to {opacity:1; transform: translateY(0);}
}
@keyframes fadeInBody {
    from {opacity:0;}
    to {opacity:1;}
}

/* Title */
h1 {
    font-size:2rem;
    margin-bottom:10px;
    color:#222;
    position: relative;
}
h1::after {
    content:"";
    display:block;
    width:60px;
    height:4px;
    background:#33C98B;
    border-radius:2px;
    margin-top:8px;
    transition: width 0.4s ease;
}
h1:hover::after { width:100px; }

/* Content */
.content {
    line-height:1.5; /* closer to textarea spacing */
    font-size:1.05rem;
    color:#444;
    margin-bottom:30px;
    white-space: pre-wrap; /* preserves line breaks and spaces exactly */
    word-wrap: break-word;
}

/* Back Button */
.back-btn {
    display:inline-block;
    padding:12px 22px;
    background: #33C98B;
    color:#fff;
    border-radius:12px;
    text-decoration:none;
    font-weight:600;
    box-shadow: 0 8px 20px rgba(51,201,139,0.3);
    transition: 0.4s all;
    position: relative;
    overflow: hidden;
}
.back-btn::before {
    content:"";
    position:absolute;
    top:0; left:-100%;
    width:100%; height:100%;
    background:rgba(255,255,255,0.2);
    transform: skewX(-25deg);
    transition: all 0.5s;
}
.back-btn:hover::before { left:200%; }
.back-btn:hover { transform: translateY(-3px) scale(1.05); box-shadow: 0 12px 25px rgba(51,201,139,0.4); }

/* Responsive */
@media(max-width:768px){
    body {padding:20px;}
    .container {padding:20px;}
    h1 {font-size:1.5rem;}
    .content {font-size:1rem;}
}
</style>
<link rel="shortcut icon" href="tkpt.png" type="image/x-icon">
</head>
<body>
<div class="container">
    <h1><?= htmlspecialchars($side['title']) ?></h1>
    <div class="content"><?= htmlspecialchars($side['content']) ?></div>
    <a href="index.php?date=<?= htmlspecialchars($filterDate) ?>" class="back-btn">← Let leh na</a>
</div>
</body>
</html>
