<?php
include 'teams.php';

$type = $_POST['type'];

if (isset($type)){
  if ($type == "insert"){
    //inserting a team

    $name = $_POST['name'];
    $site = $_POST['site'];

    echo 'this works';

    //do SQL here

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
