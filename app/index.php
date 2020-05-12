<?php
// Show PHP errors
ini_set('display_errors',1);
ini_set('display_startup_erros',1);
error_reporting(E_ALL);

require_once 'classes/user.php';

$objNotes = new Notes();

// GET
if(isset($_GET['delete_id'])){
  $id = $_GET['delete_id'];
  try{
    if($id != null){
      if($objNotes->delete($id)){
        $objNotes->redirect('index.php?deleted');
      }
    }else{
      var_dump($id);
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
                    <h1 style="margin-top: 10px">DataTable</h1>
                    <?php
                      if(isset($_GET['updated'])){
                        echo '<div class="alert alert-info alert-dismissable fade show" role="alert">
                        <strong>Notes!<trong> Updated with success.
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true"> &times; </span>
                          </button>
                        </div>';
                      }else if(isset($_GET['deleted'])){
                        echo '<div class="alert alert-info alert-dismissable fade show" role="alert">
                        <strong>Notes!<trong> Deleted with success.
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true"> &times; </span>
                          </button>
                        </div>';
                      }else if(isset($_GET['inserted'])){
                        echo '<div class="alert alert-info alert-dismissable fade show" role="alert">
                        <strong>Notes!<trong> Inserted with success.
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true"> &times; </span>
                          </button>
                        </div>';
                      }else if(isset($_GET['error'])){
                        echo '<div class="alert alert-info alert-dismissable fade show" role="alert">
                        <strong>DB Error!<trong> Something went wrong with your action. Try again!
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true"> &times; </span>
                          </button>
                        </div>';
                      }
                    ?>
                      <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                              <tr>
                                <th>#</th>
                                <th>Comment</th>
                                <th>Email</th>
                                <th></th>
                              </tr>
                            </thead>
                            <?php
                              $query = "SELECT * FROM notes";
                              $stmt = $objNotes->runQuery($query);
                              $stmt->execute();
                            ?>
                            <tbody>
                                <?php if($stmt->rowCount() > 0){
                                  while($rowNotes = $stmt->fetch(PDO::FETCH_ASSOC)){
                                 ?>
                                 <tr>
                                    <td><?php print($rowNotes['id']); ?></td>

                                    <td>
                                      <a href="form.php?edit_id=<?php print($rowNotes['id']); ?>">
                                      <?php print($rowNotes['name']); ?>
                                      </a>
                                    </td>

                                    <td><?php print($rowNotes['email']); ?></td>

                                    <td>
                                      <a class="confirmation" href="index.php?delete_id=<?php print($rowNotes['id']); ?>">
                                      <span data-feather="trash"></span>
                                      </a>
                                    </td>
                                 </tr>


                          <?php } } ?>
                            </tbody>
                        </table>

                      </div>


                </main>
            </div>
        </div>
        <!-- Footer scripts, and functions -->
        <?php require_once 'includes/footer.php'; ?>

        <!-- Custom scripts -->
        <script>
            // JQuery confirmation
            $('.confirmation').on('click', function () {
                return confirm('Are you sure you want do delete this user?');
            });
        </script>
    </body>
</html>
