<?php
include 'teams.php';

$type = $_POST['type'];

if (isset($type)){
  if ($type == "insert"){
    //inserting a team

    $name = $_POST['name'];
    $site = $_POST['site'];
    $publisher = '1';

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
