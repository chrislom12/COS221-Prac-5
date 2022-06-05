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

    $imageType = $_POST['imageType'];

    if($imageType=="Person"){


        $target_file = $target_dir ."persons/".$image['name'];


        if (move_uploaded_file($_FILES["img"]["tmp_name"], $target_file)) {
            /* echo "The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded."; */
            echo "<script>alert('The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded.')</script>";
          } else {
            /* echo "Sorry, there was an error uploading your file."; */
            echo "<script>alert('Sorry, there was an error uploading your file.')</script>";
          }

          $media_type = $target_file;
          $date = date('Y/m/d'); //date taken
          $id = $_POST['id'];
          $credit = $_POST['credit'];
          $loadtime = date('Y/m/d');
          $location = $_POST['location'];
          $canExecute = true;
          $num = 0;
          $nums = 0;
          $nr = 0;

          $publisher = $_SESSION['PubID'];
          if (!isset($publisher)){
            echo "<script type='text/javascript'>alert('You are not logged in');window.location.href='media.php';</script>";
            echo "<meta http-equiv = 'refresh' content = '1; url = media.php' />";
          }

          
          if($id == '' || $credit == '' || $location == '')
          {
              $canExecute = false;
          }else{
            
            $ssql = "SELECT id FROM `persons`";
            $siteq = $conn->query($ssql);
            while ($row = $siteq->fetch_assoc()){
              if ($row['id'] == $id){
                $nums++;
              }
            }
            if ($nums<=0){
              $canExecute = false;
            }
            else {
              $tsql = "SELECT id FROM persons";
              $teamq = $conn->query($ssql);

              while ($row = $teamq->fetch_assoc()){
                if ($row['id'] == $credit){
                  $num++;
                }
              }
              if ($num<=0){
                $canExecute = false;
              }
              else {
                $lsql = "SELECT id FROM locations";
                $locq = $conn->query($lsql);

                while ($row = $locq->fetch_assoc()){
                  if ($row['id'] == $location){
                    $nr++;
                  }
                }
                if ($nr<=0){
                  $canExecute = false;
                }
              }
            }
          }

          if ($canExecute == true){
            $sql = "INSERT INTO media (id, object_id, source_id, revision_id, media_type, publisher_id, date_time, credit_id, db_loading_date_time, creation_location_id) VALUES (NULL, NULL, NULL, NULL, '$media_type', '$publisher', '$date', '$credit', '$loadtime', '$location');";
            $result = $conn->query($sql);
            $media = $conn->insert_id;

            $sql2 = "INSERT INTO persons_media (person_id, media_id) VALUES ('$credit', '$media')";
            $result2 = $conn->query($sql2);
          } else {
            echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='media.php';</script>";
            echo "<meta http-equiv = 'refresh' content = '1; url = media.php' />"; 
          }

          

    } else if($imageType=="Team"){


        $target_file = $target_dir ."teams/".$image['name'];


        if (move_uploaded_file($_FILES["img"]["tmp_name"], $target_file)) {
            /* echo "The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded."; */
            echo "<script>alert('The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded.')</script>";
          } else {
            /* echo "Sorry, there was an error uploading your file."; */
            echo "<script>alert('Sorry, there was an error uploading your file.')</script>";
          }

          $media_type = $target_file;
          $date = date('Y/m/d'); //date taken
          $credit = $_POST['id'];
          $loadtime = date('Y/m/d');
          $location = $_POST['location'];
          $canExecute = true;
          $num = 0;
          $nums = 0;
          $nr = 0;

          $publisher = $_SESSION['PubID'];
          if (!isset($publisher)){
            echo "<script type='text/javascript'>alert('You are not logged in');window.location.href='media.php';</script>";
            echo "<meta http-equiv = 'refresh' content = '1; url = media.php' />";
          }

          
          if($id == '' || $credit == '' || $location == '')
          {
              $canExecute = false;
          }else{
            
            $ssql = "SELECT id FROM `persons`";
            $siteq = $conn->query($ssql);
            while ($row = $siteq->fetch_assoc()){
              if ($row['id'] == $id){
                $nums++;
              }
            }
            if ($nums<=0){
              $canExecute = false;
            }
            else {
              $tsql = "SELECT id FROM persons";
              $teamq = $conn->query($ssql);

              while ($row = $teamq->fetch_assoc()){
                if ($row['id'] == $credit){
                  $num++;
                }
              }
              if ($num<=0){
                $canExecute = false;
              }else {
                $lsql = "SELECT id FROM locations";
                $locq = $conn->query($lsql);

                while ($row = $teamq->fetch_assoc()){
                  if ($row['id'] == $location){
                    $nr++;
                  }
                }
                if ($nr<=0){
                  $canExecute = false;
                }
              }
            }
          }

          if ($canExecute == true){
            $sql = "INSERT INTO media (id, object_id, source_id, revision_id, media_type, publisher_id, date_time, credit_id, db_loading_date_time, creation_location_id) VALUES (NULL, NULL, NULL, NULL, '$media_type', '$publisher', '$date', '$credit', '$loadtime', '$location');";
            $result = $conn->query($sql);
            $media = $conn->insert_id;

            $sql2 = "INSERT INTO teams_media (team_id, media_id) VALUES ('$credit', '$media');";
            $result2 = $conn->query($sql2);
          } else {
            echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='media.php';</script>";
            echo "<meta http-equiv = 'refresh' content = '1; url = media.php' />"; 
          }

          

    } else if($imageType=="Event"){


        $target_file = $target_dir ."Events/".$image['name'];


        if (move_uploaded_file($_FILES["img"]["tmp_name"], $target_file)) {
            /* echo "The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded."; */
            echo "<script>alert('The file ". htmlspecialchars( basename( $_FILES["img"]["name"])). " has been uploaded.')</script>";
          } else {
            /* echo "Sorry, there was an error uploading your file."; */
            echo "<script>alert('Sorry, there was an error uploading your file.')</script>";
          }

          $media_type = $target_file;
          $publisher = '1';
          $date = date('Y/m/d'); //date taken
          $credit = $_POST['id'];
          $loadtime = date('Y/m/d');
          $location = $_POST['location'];
          $canExecute = true;
          $num = 0;
          $nums = 0;
          $nr = 0;

          $publisher = $_SESSION['PubID'];
          if (!isset($publisher)){
            echo "<script type='text/javascript'>alert('You are not logged in');window.location.href='media.php';</script>";
            echo "<meta http-equiv = 'refresh' content = '1; url = media.php' />";
          }

          
          if($id == '' || $credit == '' || $location == '')
          {
              $canExecute = false;
          }else{
            
            $ssql = "SELECT id FROM `persons`";
            $siteq = $conn->query($ssql);
            while ($row = $siteq->fetch_assoc()){
              if ($row['id'] == $id){
                $nums++;
              }
            }
            if ($nums<=0){
              $canExecute = false;
            }
            else {
              $tsql = "SELECT id FROM persons";
              $teamq = $conn->query($ssql);

              while ($row = $teamq->fetch_assoc()){
                if ($row['id'] == $credit){
                  $num++;
                }
              }
              if ($num<=0){
                $canExecute = false;
              }else {
                $lsql = "SELECT id FROM locations";
                $locq = $conn->query($lsql);

                while ($row = $teamq->fetch_assoc()){
                  if ($row['id'] == $location){
                    $nr++;
                  }
                }
                if ($nr<=0){
                  $canExecute = false;
                }
              }
            }
          }

          if ($canExecute == true){
            $sql = "INSERT INTO media (id, object_id, source_id, revision_id, media_type, publisher_id, date_time, credit_id, db_loading_date_time, creation_location_id) VALUES (NULL, NULL, NULL, NULL, '$media_type', '$publisher', '$date', '$credit', '$loadtime', '$location');";
            $result = $conn->query($sql);
            $media = $conn->insert_id;

            $sql2 = "INSERT INTO events_media (event_id, media_id) VALUES ('$credit', '$media');";
            $result2 = $conn->query($sql2);
          } else {
            echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='media.php';</script>";
            echo "<meta http-equiv = 'refresh' content = '1; url = media.php' />"; 
          }

          

    }

?>
<script>
//this suppresses resubmission so that the form wont be resubmitted at refresh
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
</script>
