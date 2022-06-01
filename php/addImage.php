<?php
//store in correct file locations a picture of a person called person.png
    include "media.php";
    if(isset($_REQUEST["imageType"])){
        $imageType=$_REQUEST["imageType"];
    }
    if(isset($_FILES["img"])){
        $image=$_FILES['img'];
;
    }
    

    $target_dir = "../img/";

    if($imageType=="Person"){

  
        $target_file = $target_dir ."people/".$image['name'];


        if (move_uploaded_file($_FILES["img"]["tmp_name"], $target_file)) {
            /* echo "The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded."; */
            echo "<script>alert('The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded.')</script>";
          } else {
            /* echo "Sorry, there was an error uploading your file."; */
            echo "<script>alert('Sorry, there was an error uploading your file.')</script>";
          }
    }
    else if($imageType=="Team"){

  
        $target_file = $target_dir ."teams/".$image['name'];


        if (move_uploaded_file($_FILES["img"]["tmp_name"], $target_file)) {
            /* echo "The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded."; */
            echo "<script>alert('The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded.')</script>";
          } else {
            /* echo "Sorry, there was an error uploading your file."; */
            echo "<script>alert('Sorry, there was an error uploading your file.')</script>";
          }
    }
    else if($imageType=="Event"){

  
        $target_file = $target_dir ."events/".$image['name'];


        if (move_uploaded_file($_FILES["img"]["tmp_name"], $target_file)) {
            /* echo "The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded."; */
            echo "<script>alert('The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded.')</script>";
          } else {
            /* echo "Sorry, there was an error uploading your file."; */
            echo "<script>alert('Sorry, there was an error uploading your file.')</script>";
          }
    }
    else if($imageType=="Tournament"){

  
        $target_file = $target_dir ."tournaments/".$image['name'];


        if (move_uploaded_file($_FILES["img"]["tmp_name"], $target_file)) {
            /* echo "The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded."; */
            echo "<script>alert('The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded.')</script>";
          } else {
            /* echo "Sorry, there was an error uploading your file."; */
            echo "<script>alert('Sorry, there was an error uploading your file.')</script>";
          }
    }
    
    
?>