<?php
include 'swimmers.php';

$type = $_POST['type'];

if (isset($type)){
  if ($type == "insert"){
    //inserting a swimmer


    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $DOB = $_POST['dob'];
    $team = $_POST['team'];
    $address = $_POST['address'];

    echo 'this works';

    //do SQL here

  }else if ($type == "update"){
      //updating a swimmer




  } else if ($type == "delete"){
    //deleting a swimmer
  }
}
?>
<script>
//this suppresses resubmission so that the form wont be resubmitted at refresh
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
</script>
