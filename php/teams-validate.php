<?php
include 'teams.php';

//Foreign Keys: publisher_id and home_site_id

$type = $_POST['type'];

if (isset($type)){
  if ($type == "insert"){
    //inserting a team

    $name = $_POST['name'];
    $site = $_POST['site'];
    $publisher = '1';

    if (isset($publisher)){
      $valid = "SELECT id FROM publishers WHERE id=$publisher";
      $res = $conn->query($valid);

      if (!$res){
        echo "<script>alert('You are not a registered user.')</script>";
        header("Location: teams.php");
      }

    } else (isset($site)){
      $valid = "SELECT id FROM sites WHERE id=$site";
      $res = $conn->query($valid);

      if (!$res){
        echo "<script>alert('That is not a vaid site ID.')</script>";
        header("Location: teams.php");
      }
    }


    $sql = "INSERT INTO teams (id, team_key, publisher_id, home_site_id) VALUES (NULL, '$name', '$publisher', '$site')";
    $result = $conn->query($sql);

  }else if ($type == "update"){
      //updating a team




  } else if ($type == "delete"){
    //deleting a team
  }
}
?>
<script>
//this suppresses resubmission so that the form wont be resubmitted at refresh
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
</script>
