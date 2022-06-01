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

    $key = $name . " " . $surname;
    $publisher = '1';
    $gender = 'N/A';
    $locationdef = "1";

    $sql = "INSERT INTO persons (id, person_key, publisher_id, gender, birth_date, death_date, final_resting_location_id, birth_location_id, hometown_location_id, residence_location_id, death_location_id) VALUES ('NULL', '$key', '$publisher', '$gender', '$DOB', 'N/A', '$locationdef', '$locationdef', '$locationdef', '$address', '$locationdef')";
    $result = $conn->query($sql);

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
