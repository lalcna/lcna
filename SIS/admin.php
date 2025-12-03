<?php
session_start();
include('db.php');

$mode_msg = '';

// --- Secure Login Check ---
if (!isset($_SESSION['admin']) || empty($_SESSION['admin'])) {
    header("Location: login.php");
    exit;
}

  // --- Handle Display Mode Update ---
$mode_result = $conn->query("SELECT value FROM settings WHERE name='display_mode' LIMIT 1");
$display_mode = $mode_result->fetch_assoc()['value'] ?? 'date';



// --- Handle Add Form Submissions ---
if($_SERVER['REQUEST_METHOD'] === 'POST'){
    $created_at = $_POST['created_at'] ?? date('Y-m-d');

    // Articles
    if(isset($_POST['add_article'])){
        $title = $_POST['title'];
        $content = $_POST['content'];
        $stmt = $conn->prepare("INSERT INTO articles (title, content, created_at) VALUES (?,?,?)");
        $stmt->bind_param("sss",$title,$content,$created_at);
        $stmt->execute();
        header("Location: admin.php?success=added"); exit;
    }



  

    // Posts
    if(isset($_POST['add_post'])){
        $content = $_POST['content'];
        $stmt = $conn->prepare("INSERT INTO posts (content, created_at) VALUES (?,?)");
        $stmt->bind_param("ss",$content,$created_at);
        $stmt->execute();
        header("Location: admin.php?success=added"); exit;
    }

    // Side Sections
    if(isset($_POST['add_side'])){
        $title = $_POST['title'];
        $content = $_POST['content'];
        $stmt = $conn->prepare("INSERT INTO side_sections (title, content, created_at) VALUES (?,?,?)");
        $stmt->bind_param("sss",$title,$content,$created_at);
        $stmt->execute();
        header("Location: admin.php?success=added"); exit;
    }

    // Notices
    if(isset($_POST['add_notice'])){
        $content = $_POST['content'];
        $stmt = $conn->prepare("INSERT INTO notices (content, created_at) VALUES (?,?)");
        $stmt->bind_param("ss",$content,$created_at);
        $stmt->execute();
        header("Location: admin.php?success=added"); exit;
    }

    // Gallery
    if(isset($_POST['add_gallery'])){
        $title = $_POST['title'];
        $description = $_POST['description'] ?? '';
        if(isset($_FILES['image']) && $_FILES['image']['error'] === 0){
            $ext = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
            $filename = 'uploads/gallery_' . time() . '.' . $ext;
            move_uploaded_file($_FILES['image']['tmp_name'], $filename);

            $stmt = $conn->prepare("INSERT INTO gallery (title, image, description, created_at) VALUES (?,?,?,?)");
            $stmt->bind_param("ssss", $title, $filename, $description, $created_at);
            $stmt->execute();
            header("Location: admin.php?success=added"); exit;
        } else {
            $error = "Please select an image to upload.";
        }
    }

    // PDFs
    if(isset($_POST['add_pdf'])){
        $title = $_POST['title'];
        $created_at = $_POST['created_at'] ?? date('Y-m-d');

        if(isset($_FILES['pdf']) && $_FILES['pdf']['error'] === 0){
            if($_FILES['pdf']['size'] <= 1024*1024){ // 1MB limit
                $ext = pathinfo($_FILES['pdf']['name'], PATHINFO_EXTENSION);
                if(strtolower($ext) === 'pdf'){
                    $filename = 'uploads/pdf_' . time() . '.pdf';
                    move_uploaded_file($_FILES['pdf']['tmp_name'], $filename);

                    $stmt = $conn->prepare("INSERT INTO pdfs (title, file, created_at) VALUES (?,?,?)");
                    $stmt->bind_param("sss", $title, $filename, $created_at);
                    $stmt->execute();
                    header("Location: admin.php?success=added"); exit;
                } else {
                    $error_pdf = "Only PDF files are allowed.";
                }
            } else {
                $error_pdf = "PDF file size must be less than 1MB.";
            }
        } else {
            $error_pdf = "Please select a PDF file to upload.";
        }
    }
}

// --- Handle Delete Requests ---
if(isset($_GET['delete'])){
    $table = $_GET['table'];
    $id = (int)$_GET['id'];
    $allowedTables = ['articles','posts','side_sections','notices','gallery','pdfs'];

    if(in_array($table,$allowedTables)){
        // Delete file for gallery or pdfs safely
        if($table === 'gallery' || $table === 'pdfs'){
            $column = $table === 'gallery' ? 'image' : 'file';
            $res = $conn->query("SELECT $column FROM $table WHERE id=$id");
            if($res->num_rows){
                $row = $res->fetch_assoc();
                $filePath = $row[$column];
                if(!empty($filePath) && file_exists($filePath)){
                    @unlink($filePath);
                }
            }
        }

        $stmt = $conn->prepare("DELETE FROM $table WHERE id=?");
        $stmt->bind_param("i",$id);
        $stmt->execute();
        header("Location: admin.php?success=deleted"); exit;
    }
}

// Fetch entries
$articles = $conn->query("SELECT * FROM articles ORDER BY created_at DESC");
$posts = $conn->query("SELECT * FROM posts ORDER BY created_at DESC");
$sides = $conn->query("SELECT * FROM side_sections ORDER BY id DESC");
$notices = $conn->query("SELECT * FROM notices ORDER BY created_at DESC");
$gallery = $conn->query("SELECT * FROM gallery ORDER BY created_at DESC");
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Editorial Board</title>
<link rel="shortcut icon" href="tkpt.png" type="image/x-icon">
<style>
body{font-family:"Segoe UI", Roboto,sans-serif; background:#f4f6f9; padding:20px;}
.container{max-width:1100px; margin:auto; background:#fff; padding:25px; border-radius:15px; box-shadow:0 4px 12px rgba(0,0,0,0.1);}
h2{text-align:center; margin-bottom:20px; color:#333;}
h3{margin-top:30px; margin-bottom:10px; color:#007BFF;}
form input, form textarea{width:100%; padding:10px; margin:8px 0; border-radius:8px; border:1px solid #ddd;}
form button{padding:10px 20px; background:#007BFF; color:#fff; border:none; border-radius:8px; cursor:pointer;}
form button:hover{background:#0056b3;}
.table-container {max-height:300px; overflow-y:auto; margin-top:10px; border:1px solid #ddd; border-radius:8px;}
table{width:100%; border-collapse:collapse;}
table, th, td{border:1px solid #ddd;}
th, td{padding:10px; text-align:left;}
th{background:#f1f1f1;}
a.delete{color:red; text-decoration:none; margin-left:10px;}
a.edit{color:#28a745; text-decoration:none; margin-left:10px;}
.section {border:1px solid #eee; padding:15px; border-radius:12px; margin-bottom:20px; background:#f9f9fb;}
.logout-btn{padding:8px 15px; background:#dc3545; color:#fff; text-decoration:none; border-radius:8px; float:right; margin-bottom:10px;}
.logout-btn:hover{background:#a71d2a;}
img {max-width:100px; max-height:80px; object-fit:cover;}
.preserve { white-space: pre-line; } /* preserves line breaks */


/* Side Modal (Right Slide-In Notification) */
.side-modal {
  position: fixed;
  top: 20px;
  right: -400px;
  background-color: #28a745;
  color: white;
  padding: 15px 25px;
  border-radius: 12px 0 0 12px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.3);
  transition: right 0.5s ease-in-out;
  z-index: 10000;
  font-weight: bold;
  min-width: 250px;
}

.side-modal.show {
  right: 20px;
}

.side-modal-content {
  font-size: 16px;
}

</style>
</head>
<body>
<div id="successModal" class="side-modal">
  <div class="side-modal-content" id="successMessage">Action successful!</div>
</div>

<div class="container">

<a href="logout.php" class="logout-btn">Logout</a>
<h2>Welcome</h2>

<!-- Articles -->
<div class="section">
<h3>Sermon / Articles</h3>
<form method="POST">
<input type="text" name="title" placeholder="Title" required>
<textarea name="content" placeholder="Content" required></textarea>
<input type="date" name="created_at" value="<?= date('Y-m-d') ?>" required>
<button type="submit" name="add_article">Add Article</button>
</form>

<div class="table-container">
<table>
<tr><th>ID</th><th>Title</th><th>Content</th><th>Date</th><th>Actions</th></tr>
<?php while($row=$articles->fetch_assoc()): ?>
<tr>
<td><?= $row['id'] ?></td>
<td class="preserve"><?= nl2br(htmlspecialchars($row['title'])) ?></td>
<td class="preserve"><?= nl2br(htmlspecialchars($row['content'])) ?></td>
<td><?= $row['created_at'] ?></td>
<td>
<a href="edit.php?section=article&id=<?= $row['id'] ?>" class="edit">Edit</a>
<a href="?delete=1&table=articles&id=<?= $row['id'] ?>" class="delete" onclick="return confirm('Delete this article?')">Delete</a>
</td>
</tr>
<?php endwhile; ?>
</table>
</div>
</div>




<!-- Side Sections -->
<div class="section">
<h3>Hriattur pawimawhte </h3>
<form method="POST">
<input type="text" name="title" placeholder="Title" required>
<textarea name="content" placeholder="Content" required></textarea>
<input type="date" name="created_at" value="<?= date('Y-m-d') ?>" required>
<button type="submit" name="add_side">Add Hriattur pawimawh</button>
</form>

<div class="table-container">
<table>
<tr><th>ID</th><th>Title</th><th>Content</th><th>Date</th><th>Actions</th></tr>
<?php while($row=$sides->fetch_assoc()): ?>
<tr>
<td><?= $row['id'] ?></td>
<td class="preserve"><?= nl2br(htmlspecialchars($row['title'])) ?></td>
<td class="preserve"><?= nl2br(htmlspecialchars($row['content'])) ?></td>
<td><?= $row['created_at'] ?></td>
<td>
<a href="edit.php?section=side&id=<?= $row['id'] ?>" class="edit">Edit</a>
<a href="?delete=1&table=side_sections&id=<?= $row['id'] ?>" class="delete" onclick="return confirm('Delete this side section?')">Delete</a>
</td>
</tr>
<?php endwhile; ?>
</table>
</div>
</div>




<!-- Posts -->
<div class="section">
<h3>Tarlanna </h3>
<form method="POST">
<textarea name="content" placeholder="Content" required></textarea>
<input type="date" name="created_at" value="<?= date('Y-m-d') ?>" required>
<button type="submit" name="add_post">Add Tarlanna</button>
</form>

<div class="table-container">
<table>
<tr><th>ID</th><th>Content</th><th>Date</th><th>Actions</th></tr>
<?php while($row=$posts->fetch_assoc()): ?>
<tr>
<td><?= $row['id'] ?></td>
<td class="preserve"><?= nl2br(htmlspecialchars($row['content'])) ?></td>
<td><?= $row['created_at'] ?></td>
<td>
<a href="edit.php?section=post&id=<?= $row['id'] ?>" class="edit">Edit</a>
<a href="?delete=1&table=posts&id=<?= $row['id'] ?>" class="delete" onclick="return confirm('Delete this post?')">Delete</a>
</td>
</tr>
<?php endwhile; ?>
</table>
</div>
</div>



<!-- Notices -->
<div class="section">
<h3>Thupuan / Hriattirna / Sawmna</h3>
<form method="POST">
<textarea name="content" placeholder="Content" required></textarea>
<input type="date" name="created_at" value="<?= date('Y-m-d') ?>" required>
<button type="submit" name="add_notice">Add Thupuan / Hriattirna / Sawmna</button>
</form>

<div class="table-container">
<table>
<tr><th>ID</th><th>Content</th><th>Date</th><th>Actions</th></tr>
<?php while($row=$notices->fetch_assoc()): ?>
<tr>
<td><?= $row['id'] ?></td>
<td class="preserve"><?= nl2br(htmlspecialchars($row['content'])) ?></td>
<td><?= $row['created_at'] ?></td>
<td>
<a href="edit.php?section=notice&id=<?= $row['id'] ?>" class="edit">Edit</a>
<a href="?delete=1&table=notices&id=<?= $row['id'] ?>" class="delete" onclick="return confirm('Delete this notice?')">Delete</a>
</td>
</tr>
<?php endwhile; ?>
</table>
</div>
</div>

<!-- Gallery -->
<div class="section">
<h3>FOD Report / Post</h3>
<?php if(isset($error)) echo "<p style='color:red;'>$error</p>"; ?>
<form method="POST" enctype="multipart/form-data">
<input type="text" name="title" placeholder="Title" required>
<input type="file" name="image" accept="image/*" required>
<textarea name="description" placeholder="Description"></textarea>
<input type="date" name="created_at" value="<?= date('Y-m-d') ?>" required>
<button type="submit" name="add_gallery">Add FOD Report / Post</button>
</form>

<div class="table-container">
<table>
<tr><th>ID</th><th>Title</th><th>Image</th><th>Description</th><th>Date</th><th>Actions</th></tr>
<?php while($row=$gallery->fetch_assoc()): ?>
<tr>
<td><?= $row['id'] ?></td>
<td class="preserve"><?= nl2br(htmlspecialchars($row['title'])) ?></td>
<td><img src="<?= htmlspecialchars($row['image']) ?>" alt=""></td>
<td class="preserve"><?= nl2br(htmlspecialchars($row['description'])) ?></td>
<td><?= $row['created_at'] ?></td>
<td>
<a href="edit.php?section=gallery&id=<?= $row['id'] ?>" class="edit">Edit</a>
<a href="?delete=1&table=gallery&id=<?= $row['id'] ?>" class="delete" onclick="return confirm('Delete this gallery item?')">Delete</a>
</td>
</tr>
<?php endwhile; ?>
</table>
</div>
</div>


<!-- PDFs -->
<div class="section">
<h3>Salemthar PDF Uploadna</h3>
<?php if(isset($error_pdf)) echo "<p style='color:red;'>$error_pdf</p>"; ?>
<form method="POST" enctype="multipart/form-data">
<input type="text" name="title" placeholder="PDF Title" required>
<input type="file" name="pdf" accept="application/pdf" required>
<input type="date" name="created_at" value="<?= date('Y-m-d') ?>" required>
<button type="submit" name="add_pdf">Add Salemthar PDF</button>
</form>

<div class="table-container">
<table>
<tr><th>ID</th><th>Title</th><!--<th>File</th>--><th>Date</th><th>Actions</th></tr>
<?php
$pdflist = $conn->query("SELECT * FROM pdfs ORDER BY created_at DESC");
while($row=$pdflist->fetch_assoc()):
?>
<tr>
<td><?= $row['id'] ?></td>
<td class="preserve"><?= nl2br(htmlspecialchars($row['title'])) ?></td>
<!--<td>
    <a href="uploads/<?= htmlspecialchars($row['file']) ?>" target="_blank">View PDF</a> | 
    <a href="download.php?id=<?= $row['id'] ?>">Download</a>
</td>-->
<td><?= $row['created_at'] ?></td>
<td>
<a href="?delete=1&table=pdfs&id=<?= $row['id'] ?>" class="delete" onclick="return confirm('Delete this PDF?')">Delete</a>
</td>
</tr>
<?php endwhile; ?>
</table>
</div>
</div>

</div>

<!-- Modal / Popup for update -->
<div id="modePopup" style="display:none; position:fixed; top:20px; right:20px; background:#28a745; color:#fff; padding:15px 25px; border-radius:10px; box-shadow:0 4px 12px rgba(0,0,0,0.2); z-index:1000; font-weight:bold;">
  Display mode updated to <span id="modeText"><?= htmlspecialchars($display_mode) ?></span>.
</div>


<script>
<?php if(isset($show_mode_modal) && $show_mode_modal): ?>
  var popup = document.getElementById("modePopup");
  popup.style.display = "block";

  setTimeout(function(){
    popup.style.display = "none";
  }, 2500);
<?php endif; ?>



document.addEventListener("DOMContentLoaded", function(){
  const params = new URLSearchParams(window.location.search);
  const successType = params.get("success");

  if(successType){
    const modal = document.getElementById("successModal");
    const message = document.getElementById("successMessage");

    if(successType === "added"){
      message.textContent = " Dah luh fel an ni e!";
      modal.style.backgroundColor = "#28a745"; // green
    } else if(successType === "deleted"){
      message.textContent = "Paih fel a ni e!";
      modal.style.backgroundColor = "#dc3545"; // red
    }
   

    modal.classList.add("show");

    // Hide after 3 seconds
    setTimeout(() => {
      modal.classList.remove("show");
    }, 3300);

    // Remove ?success= from URL without reload
    const newUrl = window.location.href.split('?')[0];
    window.history.replaceState({}, document.title, newUrl);
  }
});



</script>



</body>
</html>
