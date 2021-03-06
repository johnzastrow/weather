<?php
// Show PHP errors
ini_set('display_errors',1);
ini_set('display_startup_erros',1);
error_reporting(E_ALL);

require_once 'classes/user.php';

$objnotes = new notes();
// GET
if(isset($_GET['edit_id'])){
    $id = $_GET['edit_id'];
    $stmt = $objnotes->runQuery("SELECT * FROM notes WHERE id=:id");
    $stmt->execute(array(":id" => $id));
    $rownotes = $stmt->fetch(PDO::FETCH_ASSOC);
}else{
  $id = null;
  $rownotes = null;
}

// POST
if(isset($_POST['btn_save'])){
  $comment   = strip_tags($_POST['comment']);
  $type  = strip_tags($_POST['type']);

  try{
     if($id != null){
       if($objnotes->update($comment, $type, $id)){
         $objnotes->redirect('index.php?updated');
       }
     }else{
       if($objnotes->insert($comment, $type)){
         $objnotes->redirect('index.php?inserted');
       }else{
         $objnotes->redirect('index.php?error');
       }
     }
  }catch(PDOException $e){
    echo $e->getMessage();
  }
}

?>
<!doctype html>
<html lang="en">
    <head>
        <!-- Head metas, css, and title -->
        <?php require_once 'includes/head.php'; ?>
    </head>
    <body>
        <!-- Header banner -->
        <?php require_once 'includes/header.php'; ?>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar menu -->
                <?php require_once 'includes/sidebar.php'; ?>
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                  <h1 style="margin-top: 10px">Add / Edit notes</h1>
                  <p>Required fields are in (*)</p>
                  <form  method="post">
                    <div class="form-group">
                        <label for="id">ID</label>
                        <input class="form-control" type="text" comment="id" id="id" value="<?php print($rownotes['id']); ?>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="comment">comment *</label>
                        <input  class="form-control" type="text" comment="comment" id="comment" placeholder="First comment and Last comment" value="<?php print($rownotes['comment']); ?>" required maxlength="100">
                    </div>
                    <div class="form-group">
                        <label for="type">Type *</label>
                        <input  class="form-control" type="text" comment="type" id="type" placeholder="johndoel@gmail.com" value="<?php print($rownotes['type']); ?>" required maxlength="100">
                    </div>
                    <input class="btn btn-primary mb-2" type="submit" comment="btn_save" value="Save">
                  </form>
                </main>
            </div>
        </div>
        <!-- Footer scripts, and functions -->
        <?php require_once 'includes/footer.php'; ?>
    </body>
</html>
