<?php
include('db.php');
// show errors while debugging (remove in production)
error_reporting(E_ALL);
ini_set('display_errors', 1);

// -------------------------
// 1) Fetch display_mode safely (try lowercase then uppercase table name)
// -------------------------
$displayMode = 'date';
$displayModeQuery = $conn->query("SELECT value FROM settings WHERE name='display_mode' LIMIT 1");
if (!$displayModeQuery) {
    // fallback for servers with different table name
    $displayModeQuery = $conn->query("SELECT value FROM Settings WHERE name='display_mode' LIMIT 1");
}
if ($displayModeQuery && $displayModeQuery->num_rows > 0) {
    $tmp = $displayModeQuery->fetch_assoc();
    if (!empty($tmp['value'])) $displayMode = $tmp['value'];
}

// -------------------------
// 2) Determine $filterDate
//    - If user selected ?date=YYYY-MM-DD -> always use it (manual override)
//    - Else if display_mode === 'latest' -> pick latest content date
//    - Else -> today's date
// -------------------------
$filterDate = null;
if (!empty($_GET['date']) && preg_match('/^\d{4}-\d{2}-\d{2}$/', $_GET['date'])) {
    // manual override by user
    $filterDate = $conn->real_escape_string($_GET['date']);
} else {
    if ($displayMode === 'latest') {
        // get latest date across tables (UNION ALL + alias)
        $latestDateSql = "
            SELECT MAX(d) AS latest_date FROM (
                SELECT DATE(created_at) AS d FROM articles WHERE created_at IS NOT NULL AND created_at != ''
                UNION ALL
                SELECT DATE(created_at) AS d FROM posts WHERE created_at IS NOT NULL AND created_at != ''
                UNION ALL
                SELECT DATE(created_at) AS d FROM side_sections WHERE created_at IS NOT NULL AND created_at != ''
                UNION ALL
                SELECT DATE(created_at) AS d FROM notices WHERE created_at IS NOT NULL AND created_at != ''
                UNION ALL
                SELECT DATE(created_at) AS d FROM gallery WHERE created_at IS NOT NULL AND created_at != ''
            ) AS all_dates
        ";
        $latestDateQuery = $conn->query($latestDateSql);
        $row = ($latestDateQuery ? $latestDateQuery->fetch_assoc() : null);
        $filterDate = ($row && !empty($row['latest_date'])) ? $row['latest_date'] : date('Y-m-d');
    } else {
        $filterDate = date('Y-m-d');
    }
}

// final safety check
if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $filterDate)) {
    $filterDate = date('Y-m-d');
}

// prepare where clause (safe)
$whereClause = "WHERE DATE(created_at) = '" . $conn->real_escape_string($filterDate) . "'";

// -------------------------
// 3) Fetch content using $filterDate
// -------------------------
$articles = $conn->query("SELECT * FROM articles $whereClause ORDER BY created_at DESC");
$posts    = $conn->query("SELECT * FROM posts $whereClause ORDER BY created_at DESC");
$sides    = $conn->query("SELECT * FROM side_sections $whereClause ORDER BY created_at DESC");
$notices  = $conn->query("SELECT * FROM notices $whereClause ORDER BY created_at DESC");
$gallery  = $conn->query("SELECT * FROM gallery $whereClause ORDER BY created_at DESC");

// -------------------------
// 4) Get all active dates for calendar highlighting
// -------------------------
$dateQuery = $conn->query("
    SELECT DISTINCT d FROM (
        SELECT DATE(created_at) AS d FROM articles WHERE created_at IS NOT NULL AND created_at != ''
        UNION ALL
        SELECT DATE(created_at) AS d FROM posts WHERE created_at IS NOT NULL AND created_at != ''
        UNION ALL
        SELECT DATE(created_at) AS d FROM side_sections WHERE created_at IS NOT NULL AND created_at != ''
        UNION ALL
        SELECT DATE(created_at) AS d FROM notices WHERE created_at IS NOT NULL AND created_at != ''
        UNION ALL
        SELECT DATE(created_at) AS d FROM gallery WHERE created_at IS NOT NULL AND created_at != ''
    ) AS all_dates
    WHERE d IS NOT NULL AND d != '0000-00-00'
");
$postDatesArray = [];
if ($dateQuery) {
    while ($r = $dateQuery->fetch_assoc()) {
        $postDatesArray[] = $r['d'];
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Salemthar</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- Flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="shortcut icon" href="tkpt.png" type="image/x-icon">
<style>
/* Preloader */
#preloader {
    position: fixed; top:0; left:0;
    width:100%; height:100%;
    background:#fff;
    display:flex; justify-content:center; align-items:center;
    z-index:9999;
}
#preloader img {
    width:150px; height:150px;
    border-radius:50%; object-fit:cover;
    animation: pulse 1.5s infinite;
}
@keyframes pulse {
    0% { transform: scale(1);}
    50% { transform: scale(1.1);}
    100% { transform: scale(1);}
}

/* General Styles */
* {margin:0; padding:0; box-sizing:border-box; font-family:'Segoe UI', Roboto, sans-serif;}
body {background:#eaeef2; padding:20px; display:flex; justify-content:center;}
.container {
    width:100%; max-width:1100px;
    background:#fff; border-radius:20px;
    padding:25px; box-shadow:0 10px 25px rgba(0,0,0,0.08);
    display:flex; flex-direction:column; gap:25px;
    display:none; /* hidden initially for preloader */
}



/* Calendar legend */
.date-legend { display:flex; justify-content:center; gap:15px; margin-bottom:20px; flex-wrap:wrap; }
.date-legend div {
    display:flex; align-items:center; gap:6px;
    font-size:0.9em; font-weight:600;
}
.legend-color {
    width:18px; height:18px; border-radius:50%;
}

/* Colors for each section */
.legend-article { background:#8AE0BC; }
.legend-post { background:#007BFF; }
.legend-side { background:#FF9800; }
.legend-notice { background:#9C27B0; }



/* Logo & Header */
.logo {display:flex; justify-content:center; margin-bottom:8px;}
.logo img {width:100px; height:100px; border-radius:50%; object-fit:cover;}
.organization-header {
    text-align:center; font-size:2em; font-weight:700;
    color:#000; margin-bottom:15px;
    text-transform:uppercase; letter-spacing:1px;
    cursor:pointer; text-decoration:none;
    transition: color 0.3s;
}
.organization-header:hover { color:#0056b3; }

/* Sticky Date Picker */
.date-picker {
    text-align:center; margin-bottom:20px;
    position:sticky; top:0;
    background:#fff; padding:10px 0;
    z-index:10; box-shadow:0 2px 6px rgba(0,0,0,0.05);
}
.date-picker input {
    padding:12px 15px; border:1px solid #ccc; border-radius:12px;
    outline:none; cursor:pointer; transition:0.3s;
}
.date-picker input:hover {border-color:#007BFF;}

/* Grid Layout */
.top-section {display:grid; grid-template-columns:2fr 1fr; gap:25px;}

/* Articles */
.article-section {background:#f8f9fb; border-radius:15px; padding:20px; overflow-y:auto; max-height:400px;}
.article-section h3 {margin-bottom:15px; color:#333; font-size:1.3em;}
.article-card {
    background:#fff; padding:18px; margin-bottom:15px;
    border-radius:12px; box-shadow:0 3px 10px rgba(0,0,0,0.06);
    transition: transform 0.3s, box-shadow 0.3s, background 0.3s;
}
.article-card:hover {
    transform: translateY(-5px);
    box-shadow:0 8px 20px rgba(0,0,0,0.12);
    background:#fefefe;
}
.article-card .article-content {font-size:0.95em; color:#555; line-height:1.5; margin-top:8px;}
.article-card button {
    background:#8AE0BC; color:#fff; border:none; padding:6px 12px;
    border-radius:6px; cursor:pointer; font-size:0.85em; margin-top:8px;
    transition: background 0.3s, opacity 0.3s; opacity:0.95;
}
.article-card button:hover {background:#70caa3; opacity:1;}

/* Side Sections */
.side-section {
    display: flex;
    flex-direction: column;
    gap: 18px;
}

.side-section h3 {
    margin-bottom: 10px;
    color: #333;
    font-size: 1.2em;
}

.side-card {
    position: relative; /* needed for arrow positioning */
    background: #fff;
    padding: 18px 40px 18px 18px; /* extra right padding for arrow */
    border-radius: 12px;
    border: 2px solid rgba(0, 128, 0, 0.3);
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.25);
    text-align: center;
    font-weight: 600;
    transition: all 0.3s ease;
    cursor: pointer;
    text-decoration: none;
    color: #333;
    overflow: hidden;
}

/* Arrow element inside card */
.side-card::after {
    content: '→'; /* right arrow */
    position: absolute;
    right: 16px;
    top: 50%;
    transform: translateY(-50%) translateX(20px); /* start off to the right */
    opacity: 0;
    font-size: 1.2em;
    color: rgba(0, 128, 0, 0.7); /* subtle green */
    transition: all 0.3s ease;
}

/* Hover effect */
.side-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
    border-color: rgba(0, 128, 0, 0.6);
    background: #f9fff9;
}

.side-card:hover::after {
    transform: translateY(-50%) translateX(0); /* slide in */
    opacity: 1;
}


/* Posts */
.post-section {background:#f8f9fb; border-radius:15px; padding:20px; overflow-y:auto; max-height:300px;}
.post-section h3 {margin-bottom:15px; color:#333; font-size:1.3em;}
.post-card {
    background:#fff; padding:15px 18px; margin-bottom:15px;
    border-radius:12px; box-shadow:0 3px 10px rgba(0,0,0,0.06);
    transition:0.3s; position:relative;
    
    
}
.post-card:hover {transform:translateY(-3px); box-shadow:0 6px 15px rgba(0,0,0,0.1);}
.post-card .post-content {
    white-space: pre-wrap;
    line-height: 1.5;
    font-size: 1em;
    color: #555;
    transition: max-height 0.4s ease;
    
}
.post-card button {
    background:#33C98B; color:#fff; border:none; padding:6px 12px;
    border-radius:6px; cursor:pointer; font-size:0.85em; margin-top:8px; transition: background 0.3s;
}
.post-card button:hover {background:#28a174;}

/* Notices */
.notice-card {background:#fff7e6; border:1px solid #ffd591; border-radius:15px; padding:20px; margin-bottom:10px; box-shadow:0 3px 10px rgba(0,0,0,0.05);}
.notice-content {
    overflow:hidden; display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical; transition:max-height 0.3s ease; font-size:1.1em; font-weight:700; color:#ad6800;
}
.notice-card.expanded .notice-content {-webkit-line-clamp:unset; max-height:500px;}
.notice-card button {background:#33C98B; color:#fff; border:none; padding:6px 12px; border-radius:6px; cursor:pointer; font-size:0.85em; margin-top:8px; transition: background 0.3s;}
.notice-card button:hover {background:#28a174;}

/* Gallery / Image Section */
.gallery-section {background:#f8f9fb; border-radius:15px; padding:20px;}
.gallery-section h3 {margin-bottom:15px; color:#333; font-size:1.3em;}
.gallery-grid {
    display:grid; grid-template-columns:repeat(auto-fill,minmax(250px,1fr));
    gap:20px;
}
.gallery-card {
    background:#fff; border-radius:12px; overflow:hidden;
    box-shadow:0 3px 10px rgba(0,0,0,0.06); transition:0.3s;
    display:flex; flex-direction:column;
}
.gallery-card:hover {transform:translateY(-5px); box-shadow:0 8px 20px rgba(0,0,0,0.12);}
.gallery-card img {
    width:100%; height:180px; object-fit:cover;
}
.gallery-card .content {
    padding:15px; flex-grow:1;
}
.gallery-card h4 { font-size:1.1em; margin-bottom:8px; color:#222; }
.gallery-card p {
    font-size:0.9em; color:#555; margin-bottom:10px;
    overflow:hidden; display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical;
}
.gallery-card button {
    background:#33C98B; color:#fff; border:none; padding:6px 12px;
    border-radius:6px; cursor:pointer; font-size:0.85em;
    transition:background 0.3s; margin:0 15px 15px 15px; align-self:flex-start;
}
.gallery-card button:hover {background:#28a174;}

/* Scrollbar styling */
.article-section::-webkit-scrollbar, .post-section::-webkit-scrollbar {width:8px;}
.article-section::-webkit-scrollbar-thumb, .post-section::-webkit-scrollbar-thumb {background:#bbb; border-radius:4px;}

/* Responsive */
@media(max-width:768px){
    .top-section {grid-template-columns:1fr; gap:15px;}
    .article-section, .post-section {max-height:none;}
    .organization-header { font-size:1.5em; }
    .date-picker input { width:90%; }
    .gallery-grid {grid-template-columns:1fr;}
    .notice-card .notice-content {display:block; -webkit-line-clamp: unset; overflow: visible;}

}


.slider {
    width: 100%;
    overflow: hidden;
    position: relative;
    border-radius: 10px; 
}

/* Each slide */
.slide {
    width: 100%;
    display: none;
}

/* Show first slide by default */
.slide:first-child {
    display: block;
}

/* Image settings (full visible, no cropping) */
.slider img {
    width: 100%;
    height: auto;
    object-fit: contain;   /* ensures whole image is visible */
    background: #000;      /* optional background fill */
    border-radius: 10px; 
}



/* Date input with calendar icon */
.date-input-wrapper {
    position: relative;
    display: inline-block;
    width: 220px; /* adjust width as needed */
}

.date-input-wrapper input {
    width: 100%;
    padding: 12px 40px 12px 15px; /* space for icon on right */
    border: 1px solid #ccc;
    border-radius: 25px;
    outline: none;
    cursor: pointer;
    font-size: 0.9em;
    transition: all 0.3s ease;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
     /* HIDE MOBILE DATE PICKER ICONS */
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}


.date-input-wrapper input:focus {
    border-color: #33C98B;
    box-shadow: 0 4px 15px rgba(51,201,139,0.3);
}

/* Calendar icon inside input */
.date-input-wrapper::after {
     content: "\f073"; /* Unicode calendar emoji as icon */
     font-family: "Font Awesome 6 Free";
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    pointer-events: none;
    font-size: 1.2em;
    color: #555;
}



/* Modal Overlay */
#pdfModal .modal-overlay {
    position: fixed;
    top:0; left:0;
    width:100%; height:100%;
    background: rgba(0,0,0,0.5);
    z-index:9998;
}

/* Modal Content */
#pdfModal .modal-content {
    position: fixed;
    top:50%; left:50%;
    transform: translate(-50%, -50%);
    background:#fff;
    padding:25px 30px;
    border-radius:15px;
    box-shadow:0 8px 25px rgba(0,0,0,0.25);
    z-index:9999;
    text-align:center;
    max-width:300px;
    animation: fadeIn 0.3s ease-out;
}

#pdfModal .modal-content h3 {
    color:#dc3545;
    margin-bottom:12px;
}

#pdfModal .modal-content p {
    font-size:1em;
    margin-bottom:20px;
    color:#333;
}

#pdfModal .modal-content button {
    background: linear-gradient(135deg, #33C98B, #28a174);
    color:#fff;
    border:none;
    padding:8px 18px;
    border-radius:25px;
    font-size:0.9em;
    cursor:pointer;
    transition: 0.3s all;
}

#pdfModal .modal-content button:hover {
    transform: scale(1.05);
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
}

@keyframes fadeIn {
    0% {opacity:0; transform: translate(-50%, -45%);}
    100% {opacity:1; transform: translate(-50%, -50%);}
}

/*footer tan*/

 @media (max-width: 768px) {
            .footer-section {
                font-size: 0.85em !important;
                padding: 15px !important;
                text-align: left !important;
            }
            .footer-bottom {
                justify-content: flex-start !important;
                font-size: 0.85em !important;
            }
            .footer-bottom img {
                width: 14px !important;
                height: 14px !important;
            }
        }




</style>
</head>
<body>

<!-- Preloader -->
<div id="preloader"><img src="hello.png" alt="Logo"></div>

<div class="container">
    <div class="logo"><img src="hello.png" alt="Logo"></div>
    <a href="index.php" class="organization-header">SALEMTHAR</a>

  <!--  <div class="date-picker">
        <input type="text" id="datePicker" value="<?= $filterDate ?>">
    </div>-->

    <div class="date-picker">
        <div class="date-input-wrapper">
    <input type="text" id="datePicker" value="<?= $filterDate ?>" readonly>
     </div>
  <!--  <button id="downloadPDF" style="
        padding: 8px 12px;
        margin-left: 10px;
        border:none;
        background:#33C98B;
        color:#fff;
        border-radius:6px;
        cursor:pointer;
        font-size:0.9em;
        transition: 0.3s;
    ">Download PDF</button>-->

     <button id="downloadPDF" style="
        padding:6px 14px; /* smaller button */
        margin-left:12px;
        margin-top:10px;
        border:none;
        background: linear-gradient(135deg, #33C98B, #28a174);
        color:#fff;
        font-weight:600;
        border-radius:20px;
        cursor:pointer;
        font-size:0.85em;
        box-shadow:0 3px 12px rgba(0,0,0,0.2);
        transition: all 0.3s ease;
    ">Download PDF</button>
    
    
    
    <button id="allArticlesBtn" style="
        padding:6px 14px; /* smaller button */
        margin-left:12px;
        margin-top:10px;
        border:none;
        background: linear-gradient(135deg, #33C98B, #28a174);
        color:#fff;
        font-weight:600;
        border-radius:20px;
        cursor:pointer;
        font-size:0.85em;
        box-shadow:0 3px 12px rgba(0,0,0,0.2);
        transition: all 0.3s ease;
    ">Articles / Sermon</button>


</div>

 <!-- Legend -->
    <div class="date-legend">
        <div><div class="legend-color legend-article"></div> A chung Calendar khi hmet la , rawng hring lanna 'Ni' zel khi content / chhiar tur awmna</div>
       <!-- <div><div class="legend-color legend-post"></div> Posts</div>
        <div><div class="legend-color legend-side"></div> Side Sections</div>
        <div><div class="legend-color legend-notice"></div> Notices</div>-->
    </div>


    <!-- Modern Popup Modal -->
<div id="pdfModal" style="display:none;">
    <div class="modal-overlay"></div>
    <div class="modal-content">
        <h3>Oops!</h3>
        <p>No PDF is available for this date.</p>
        <button id="closeModal">OK</button>
    </div>
</div>

<div class="slider">
    <div class="slide">
        <img src="salem.jpg" alt="">
    </div>
   
   <!-- <div class="slide">
    <img src="salemtharweb.jpg" alt="">
    </div>-->
</div>



    <!-- Top Section -->
    <div class="top-section">
        <!-- Articles -->
        <div class="article-section">
            <h3>Sermon / Articles</h3>
            <?php if($articles->num_rows==0): ?>
                <p>No articles for selected date</p>
            <?php else: ?>
                <?php while($row=$articles->fetch_assoc()): ?>
                    <div class="article-card">
                        <strong><?= htmlspecialchars($row['title']) ?></strong><br>
                        <small style="color:#888; font-size:0.85em;">Posted on: <?= $row['created_at'] ?></small>
                        <div class="article-content"><?= htmlspecialchars(strlen($row['content'])>100 ? substr($row['content'],0,100).'...' : $row['content']) ?></div>
                        <?php if(strlen($row['content'])>100): ?>
                            <button onclick="window.location.href='article.php?id=<?= $row['id'] ?>&date=<?= $filterDate ?>'">Chhiarna →</button>
                        <?php endif; ?>
                    </div>
                <?php endwhile; ?>
            <?php endif; ?>
        </div>

        <!-- Side Section -->
        <div class="side-section">
            <h3>Hriattur pawimawhte:</h3>
            <?php if($sides->num_rows==0): ?>
                <div class="side-card">No side content</div>
            <?php else: ?>
                <?php while($row=$sides->fetch_assoc()): ?>
                    <a href="side.php?id=<?= $row['id'] ?>&date=<?= $filterDate ?>" class="side-card"><?= htmlspecialchars($row['title']) ?></a>
                <?php endwhile; ?>
            <?php endif; ?>
        </div>
    </div>

    <!-- Posts -->
    <div class="post-section">
        <h3>Tarlanna:</h3>
        <?php if($posts->num_rows==0): ?>
            <p>No posts for selected date</p>
        <?php else: ?>
            <?php while($row=$posts->fetch_assoc()): ?>
                <?php $isLong = strlen($row['content']) > 200; ?>
                <div class="post-card">
                    <div class="post-content" style="
                        white-space: pre-wrap;
                        line-height: 1.5;
                        font-size: 1em;
                        color: #555;
                        max-height: <?= $isLong ? '200px' : 'none' ?>;
                        overflow: <?= $isLong ? 'hidden' : 'visible' ?>;
                        transition: max-height 0.4s ease;
                    ">
                        <?= htmlspecialchars($row['content']) ?>
                    </div>
                    <?php if($isLong): ?>
                        <button onclick="togglePost(this)">See More</button>
                    <?php endif; ?>
                </div>
            <?php endwhile; ?>
        <?php endif; ?>
    </div>

    <!-- Notices -->
    <h3>Thupuan / Hriattirna / Sawmna</h3>
    <?php if($notices->num_rows>0): ?>
        <?php while($notice = $notices->fetch_assoc()): ?>
            <div class="notice-card">
                <div class="notice-content"><?= htmlspecialchars($notice['content']) ?></div>
                <?php if(strlen($notice['content'])>200): ?>
                    <button onclick="toggleNotice(this)">See More</button>
                <?php endif; ?>
            </div>
        <?php endwhile; ?>
    <?php else: ?>
        <p>No posts for selected date</p>
    <?php endif; ?>

    <!-- Gallery / Image Posts -->
    <div class="gallery-section">
        <h3>FOD Report / Post</h3>
        <?php if($gallery->num_rows==0): ?>
            <p>No FOD Report / Post for selected date</p>
        <?php else: ?>
            <div class="gallery-grid">
            <?php while($row=$gallery->fetch_assoc()): ?>
                <div class="gallery-card">
                    <img src="<?= htmlspecialchars($row['image']) ?>" alt="<?= htmlspecialchars($row['title']) ?>">
                    <div class="content">
                        <h4><?= htmlspecialchars($row['title']) ?></h4>
                        <p><?= htmlspecialchars($row['description']) ?></p>
                    </div>
                    <button onclick="window.location.href='gallery.php?id=<?= $row['id'] ?>&date=<?= $filterDate ?>'">View</button>
                </div>
            <?php endwhile; ?>
            </div>
        <?php endif; ?>
    </div>
    
  <div class="footer-section" style="
    margin-top:30px;
    padding:20px;
    background:#f1f1f1;
    border-radius:15px;
    text-align:center;
    font-size:0.9em;
    color:#333;
    line-height:1.5;
">
    <p><strong>Editor :</strong> Dr R Lalhriatpuia</p>
    <p><strong>Production Manager :</strong> MC Lalhlimpuii</p>
    <p><strong>Circular Manager :</strong> Peter Ramdinzaua, Lalrinawma, Lalrinngheta, HC Lalrammawia B. Lalhruaitluangi, Marina Lalrintluangi</p>
    <p><strong>News Editor :</strong> K. Vanlalpekhlua, Lalfakzuala</p>
    <p><strong>OB Incharge :</strong> Unit Secretary</p>
    <p>Edited & Published by Editorial Board, TKP Salem Unit, Lunglei. Mizoram.</p>
    <div class="footer-bottom" style="
        margin-top:10px;
        display:flex;
        justify-content:center;
        align-items:center;
        flex-wrap:wrap;
        gap:5px;
        font-size:0.9em;
    ">
        <span><em>Developed by Lalchungnunga</em></span>
        <span>&nbsp;|&nbsp;</span>
        <span>&copy; 2025 <img src="tkpt.png" alt="Logo" style="width:16px; height:16px; vertical-align:middle;"></span>
    </div>
    
    
    
    
    
</div>






<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
// Preloader
window.addEventListener('load', function() {
    setTimeout(function() {
        document.getElementById('preloader').style.display = 'none';
        document.querySelector('.container').style.display = 'flex';
    }, 500);
});

// Dates with active content from PHP
const postDates = <?= json_encode($postDatesArray) ?>;

// Helper to format date YYYY-MM-DD
function formatDateLocal(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth()+1).padStart(2,'0');
    const day = String(date.getDate()).padStart(2,'0');
    return `${year}-${month}-${day}`;
}

// Flatpickr init
flatpickr("#datePicker", {
    dateFormat:"Y-m-d",
    defaultDate:"<?= $filterDate ?>",
    disableMobile: true,
    onChange:function(selectedDates,dateStr){window.location.href="index.php?date="+dateStr;},
    onDayCreate:function(dObj,dStr,fp,dayElem){
        const dateStr = formatDateLocal(dayElem.dateObj);
        if(postDates.includes(dateStr)){
            dayElem.style.backgroundColor="#8AE0BC";
            dayElem.style.color="white";
            dayElem.style.borderRadius="50%";
        }
    }
});


//ICON TANA FLATPICKR SIAM


// Toggle posts
function togglePost(button){
    const postCard = button.parentElement;
    const contentDiv = postCard.querySelector('.post-content');

    if(postCard.classList.contains('expanded')){
        contentDiv.style.maxHeight = '200px';
        contentDiv.style.overflow = 'hidden';
        button.textContent = 'See More';
        postCard.classList.remove('expanded');
    } else {
        contentDiv.style.maxHeight = contentDiv.scrollHeight + 'px';
        contentDiv.style.overflow = 'visible';
        button.textContent = 'See Less';
        postCard.classList.add('expanded');
    }
}

// Toggle notices
function toggleNotice(button){
    const noticeCard = button.parentElement;
    noticeCard.classList.toggle('expanded');
    button.textContent = noticeCard.classList.contains('expanded') ? 'See Less' : 'See More';
}




//document.getElementById('downloadPDF').addEventListener('click', function(){
  //  const date = document.getElementById('datePicker').value;
    //window.location.href = 'download.php?date=' + date;
//});

//DOWNLOAD PDF NA

const modal = document.getElementById('pdfModal');
const closeModal = document.getElementById('closeModal');

document.getElementById('downloadPDF').addEventListener('click', function(){
    const date = document.getElementById('datePicker').value;

    fetch('download.php?date=' + date + '&ajax=1')
    .then(res => res.json())
    .then(data => {
        if(data.status === 'found'){
            // Trigger download of PDF
            window.location.href = 'download.php?date=' + date;
        } else if(data.status === 'missing') {
            modal.style.display = 'block';
            modal.querySelector('p').textContent = 'PDF record found, but file is missing on server.';
        } else {
            modal.style.display = 'block';
            modal.querySelector('p').textContent = 'No PDF is available for this date.';
        }
    })
    .catch(err => {
        console.error(err);
        modal.style.display = 'block';
        modal.querySelector('p').textContent = 'Something went wrong.';
    });
});

// Close modal
closeModal.addEventListener('click', function(){
    modal.style.display = 'none';
});








// Hide date legend after 4 seconds with smooth transition
window.addEventListener('load', function() {
    setTimeout(function() {
        const legend = document.querySelector('.date-legend');
        if (legend) {
            legend.style.transition = "opacity 1s ease, max-height 1s ease, margin 1s ease, padding 1s ease";
            legend.style.opacity = "0";
            legend.style.maxHeight = "0";
            legend.style.margin = "0";
            legend.style.padding = "0";
            setTimeout(() => legend.style.display = "none", 1500); // remove from layout after transition
        }
    }, 15000); // 4 seconds before hiding
});


//Button atan hman ani
const btn = document.getElementById('downloadPDF');
btn.addEventListener('mouseenter', () => {
    btn.style.transform = 'scale(1.05)';
    btn.style.boxShadow = '0 5px 18px rgba(0,0,0,0.25)';
});
btn.addEventListener('mouseleave', () => {
    btn.style.transform = 'scale(1)';
    btn.style.boxShadow = '0 3px 12px rgba(0,0,0,0.2)';
});


document.getElementById('allArticlesBtn').addEventListener('click', function() {
  window.location.href = 'allarticle.php';
});


</script>

<script>let slideIndex = 0;
showSlides();

function showSlides() {
    let slides = document.querySelectorAll(".slide");
    
    // hide all
    slides.forEach(s => s.style.display = "none");

    slideIndex++;
    if (slideIndex > slides.length) { slideIndex = 1; }

    slides[slideIndex - 1].style.display = "block";

    setTimeout(showSlides, 4000); // change image every 4s
}

</script>
</body>
</html>
