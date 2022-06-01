<?php
include 'swimmers.php';

//foreign keys: publisher_id and locations/residence

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

    if (isset($publisher)){
      $valid = "SELECT id FROM publishers WHERE id=$publisher";
      $res = $conn->query($valid);

      if (!$res){
        echo "<script>alert('You are not a registered user.')</script>";
        header("Location: swimmers.php");
      }

    } else (isset($address)){
      $valid = "SELECT id FROM sites WHERE id=$address";
      $res = $conn->query($valid);

      if (!$res){
        echo "<script>alert('That is not a vaid address ID.')</script>";
        header("Location: swimmers.php");
      }
    }

    $sql = "INSERT INTO persons (id, person_key, publisher_id, gender, birth_date, death_date, final_resting_location_id, birth_location_id, hometown_location_id, residence_location_id, death_location_id) VALUES (NULL, '$key', '$publisher', '$gender', '$DOB', 'N/A', '$locationdef', '$locationdef', '$locationdef', '$address', '$locationdef')";
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
