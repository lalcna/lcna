<?php
include('db.php');

// Get search query (if any)
$search = trim($_GET['search'] ?? '');

// Function to safely highlight multiple keywords
function highlight($text, $keywords) {
    if (!$keywords) return htmlspecialchars($text);
    $text = htmlspecialchars($text); // escape first
    // Split keywords by space and filter out empty strings
    $words = array_filter(preg_split('/\s+/', $keywords));
    foreach ($words as $word) {
        $escaped = preg_quote($word, '/');
        $text = preg_replace_callback("/($escaped)/i", function($matches) {
            return '<span class="highlight">'.$matches[1].'</span>';
        }, $text);
    }
    return $text;
}

// SQL query: show all articles or filter by search
if (!empty($search)) {
    $stmt = $conn->prepare("SELECT id, title, content, created_at FROM articles WHERE title LIKE ? OR content LIKE ? ORDER BY created_at DESC");
    $like = "%$search%";
    $stmt->bind_param("ss", $like, $like);
    $stmt->execute();
    $result = $stmt->get_result();
} else {
    $result = $conn->query("SELECT id, title, content, created_at FROM articles ORDER BY created_at DESC");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Articles</title>
<link rel="shortcut icon" href="tkpt.png" type="image/x-icon">
<style>
body {
    font-family: "Poppins", sans-serif;
    background: linear-gradient(135deg, #f0f8ff, #e8f5e9);
    margin: 0;
    padding: 40px 20px;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
}
.container { width: 100%; max-width: 1100px; }
h1 { text-align: center; color: #33C98B; margin-bottom: 30px; font-size: 2rem; }

/* Search Bar */
.search-bar { display: flex; justify-content: center; margin-bottom: 30px; gap: 10px; flex-wrap: wrap; }
.search-bar input { padding: 10px 14px; border-radius: 8px; border: 1px solid #ccc; min-width: 250px; font-size: 1rem; }
.search-bar button { background: linear-gradient(90deg, #33C98B, #28b57a); color: white; border: none; padding: 10px 18px; border-radius: 8px; font-weight: 600; cursor: pointer; transition: all 0.3s ease; }
.search-bar button:hover { transform: scale(1.05); background: linear-gradient(90deg, #28b57a, #33C98B); }

/* Grid */
.articles-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; }
.article-card { background: #fff; padding: 20px; border-radius: 16px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); cursor: pointer; transition: all 0.3s ease; position: relative; overflow: hidden; }
.article-card:hover { transform: translateY(-5px) scale(1.02); box-shadow: 0 8px 25px rgba(0,0,0,0.15); }
.article-card h2 { font-size: 1.25rem; color: #222; margin-bottom: 10px; }
.article-card:hover h2 { color: #0072ff; }
.article-card .date { color: #777; font-size: 0.9rem; margin-bottom: 10px; }
.article-card p { color: #444; font-size: 0.95rem; line-height: 1.5; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 4; -webkit-box-orient: vertical; margin: 0; }

/* Back Button */
.back-btn { display: inline-block; margin-top: 40px; padding: 12px 22px; background: #33C98B; color: #fff; border-radius: 12px; text-decoration: none; font-weight: 600; box-shadow: 0 8px 20px rgba(51,201,139,0.3); transition: 0.3s all; }
.back-btn:hover { transform: translateY(-3px) scale(1.05); background: #28b57a; }

/* Highlighted Keyword */
.highlight {
    background-color: #ffeb3b;
    color: #000;
    border-radius: 3px;
    padding: 0 2px;
    font-weight: 600;
}

@media(max-width:600px){ body {padding:20px;} h1 {font-size:1.6rem;} }
</style>
</head>
<body>
<div class="container">
    
    <h1>Sermon leh Articles te</h1>

    <form class="search-bar" method="get" action="">
        <input type="text" name="search" placeholder="I thumal zawn duh type la" value="<?= htmlspecialchars($search) ?>">
        <button type="submit">🔍 Zawnna</button>
        <button type="button" class="back-input-btn" onclick="window.location='index.php'">← Letna</button>
    </form>

    <div class="articles-grid">
        <?php if ($result && $result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
                <div class="article-card" onclick="window.location='article.php?id=<?= $row['id'] ?>'">
                    <h2><?= highlight($row['title'], $search) ?></h2>
                    <div class="date">Posted on: <?= htmlspecialchars($row['created_at']) ?></div>
                    <p><?= highlight(mb_strimwidth($row['content'], 0, 180, "..."), $search) ?></p>
                </div>
            <?php endwhile; ?>
        <?php else: ?>
            <p style="text-align:center;color:#777;">I thil zawn <?= $search ? '  “'.htmlspecialchars($search).'”' : '' ?> hi article / Sermon / Thuziak ah a awm lo anih hmel..</p>
        <?php endif; ?>
    </div>

    <div style="text-align:center;">
        <a class="back-btn" href="index.php">← Let lehna</a>
    </div>
</div>
</body>
</html>
