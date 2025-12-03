<?php
include('db.php');

$id = intval($_GET['id']);
$selectedDate = $_GET['date'] ?? null; // optional date filter

// Fetch the article
$result = $conn->query("SELECT * FROM articles WHERE id=$id");
$article = $result->fetch_assoc();

// If article not found
if (!$article) {
    echo "<p>Article not found.</p>";
    echo "<a href='index.php'>Back to Home</a>";
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?= htmlspecialchars($article['title']) ?></title>
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
h2 {
    font-size:2rem;
    margin-bottom:10px;
    color:#222;
    position: relative;
}
h2::after {
    content:"";
    display:block;
    width:60px;
    height:4px;
    background:#33C98B;
    border-radius:2px;
    margin-top:8px;
    transition: width 0.4s ease;
}
h2:hover::after { width:100px; }

/* Date */
.date {
    color:#888;
    margin-bottom:20px;
    font-size:0.95rem;
}

/* Content */
.content {
    line-height:1.5; /* matches textarea spacing */
    font-size:1.05rem;
    color:#444;
    margin-bottom:30px;
    white-space: pre-wrap; /* preserves line breaks and spaces exactly */
    word-wrap: break-word;
}

/* Back Button */
a.back {
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
a.back::before {
    content:"";
    position:absolute;
    top:0; left:-100%;
    width:100%; height:100%;
    background:rgba(255,255,255,0.2);
    transform: skewX(-25deg);
    transition: all 0.5s;
}
a.back:hover::before { left:200%; }
a.back:hover { transform: translateY(-3px) scale(1.05); box-shadow: 0 12px 25px rgba(51,201,139,0.4); }

/* Responsive */
@media(max-width:768px){
    body {padding:20px;}
    .container {padding:20px;}
    h2 {font-size:1.5rem;}
    .content {font-size:1rem;}
}
</style>
<link rel="shortcut icon" href="tkpt.png" type="image/x-icon">
</head>
<body>
<div class="container">
    <h2><?= htmlspecialchars($article['title']) ?></h2>
    <div class="date">Posted on: <?= $article['created_at'] ?></div>
    <div class="content"><?= htmlspecialchars($article['content']) ?></div>
    <a class="back" href="index.php<?= $selectedDate ? '?date='.$selectedDate : '' ?>">← Let leh na</a>
</div>
</body>
</html>
