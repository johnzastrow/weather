<?php

require_once 'database.php';

class notes {
    private $conn;

    // Constructor
    public function __construct(){
      $database = new Database();
      $db = $database->dbConnection();
      $this->conn = $db;
    }


    // Execute queries SQL
    public function runQuery($sql){
      $stmt = $this->conn->prepare($sql);
      return $stmt;
    }

    // Insert
    public function insert($comment, $type){
      try{
        $stmt = $this->conn->prepare("INSERT INTO notes (comment, type) VALUES(:comment, :type)");
        $stmt->bindparam(":comment", $comment);
        $stmt->bindparam(":type", $type);
        $stmt->execute();
        return $stmt;
      }catch(PDOException $e){
        echo $e->getMessage();
      }
    }


    // Update
    public function update($comment, $type, $id){
        try{
          $stmt = $this->conn->prepare("UPDATE notes SET comment = :comment, type = :type WHERE id = :id");
          $stmt->bindparam(":comment", $comment);
          $stmt->bindparam(":type", $type);
          $stmt->bindparam(":id", $id);
          $stmt->execute();
          return $stmt;
        }catch(PDOException $e){
          echo $e->getMessage();
        }
    }


    // Delete
    public function delete($id){
      try{
        $stmt = $this->conn->prepare("DELETE FROM notes WHERE id = :id");
        $stmt->bindparam(":id", $id);
        $stmt->execute();
        return $stmt;
      }catch(PDOException $e){
          echo $e->getMessage();
      }
    }

    // Redirect URL method
    public function redirect($url){
      header("Location: $url");
    }
}
?>
