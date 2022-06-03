<?php
include 'swimmers.php';

//foreign keys: publisher_id and locations/residence

$type = $_POST['type'];

if (isset($type)) {
  if ($type == "insert") {
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

    if (isset($publisher))
    {
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
        echo "<script>alert('That is not a valid address ID.')</script>";
        header("Location: swimmers.php");
      }
    }

    $sql = "INSERT INTO persons (id, person_key, publisher_id, gender, birth_date, death_date, final_resting_location_id, birth_location_id, hometown_location_id, residence_location_id, death_location_id) VALUES (NULL, '$key', '$publisher', '$gender', '$DOB', 'N/A', '$locationdef', '$locationdef', '$locationdef', '$address', '$locationdef')";
    $result = $conn->query($sql);

    //do SQL here

  } 
  else if ($type == "update") 
  {
    //updating a swimmer
    $personID = $_POST['person'];
    $swimmerNewVal = $_POST['newVal'];
    // echo '<script>alert("'.$personID.'");</script>';
    // echo '<script>alert("'.$swimmerNewVal.'");</script>';

    if ($_POST['updateNeeded'] === "name") 
    {
      $checkIfExists = "SELECT `id` FROM `persons` WHERE id = '" . $personID . "'";
      $resultFromPersons = mysqli_query($conn, $checkIfExists);
      $rowFromPersons = mysqli_num_rows($resultFromPersons);

      if ($rowFromPersons > 0) {
        $query = "UPDATE `persons` SET person_key='" . $swimmerNewVal . "' WHERE id ='" . $personID . "' ";
        $statement = mysqli_query($conn, $query);
      } else {
        echo '<script>alert("Swimmer does not exist!"); window.location.href = "swimmers.php"</script>';
      }

      if ($statement) {
        header("location: swimmers.php");
      } else {
        echo '<script>alert("Failed to delete location!"); window.location.href = "swimmers.php"</script>';
      }
    } 
    else if ($_POST['updateNeeded'] === "surname") 
    {
      $checkIfExists = "SELECT `id` FROM `persons` WHERE id = '" . $personID . "'";
      $resultFromPersons = mysqli_query($conn, $checkIfExists);
      $rowFromPersons = mysqli_num_rows($resultFromPersons);

      if ($rowFromPersons > 0) {
        $query = "UPDATE `persons` SET person_key='" . $swimmerNewVal . "' WHERE id ='" . $personID . "' ";
        $statement = mysqli_query($conn, $query);
      } else {
        echo '<script>alert("Swimmer does not exist!"); window.location.href = "swimmers.php"</script>';
      }

      if ($statement) {
        header("location: swimmers.php");
      } else {
        echo '<script>alert("Failed to delete location!"); window.location.href = "swimmers.php"</script>';
      }
    } 
    else if ($_POST['updateNeeded'] === "team") //swimming_team_members
    {
      $checkIfExists = "SELECT `id` FROM `persons` WHERE id = '" . $personID . "'";
      $resultFromPersons = mysqli_query($conn, $checkIfExists);
      $rowFromPersons = mysqli_num_rows($resultFromPersons);

      if ($rowFromPersons > 0) {
        $query = "UPDATE `persons` SET team_id='" . $swimmerNewVal . "' WHERE id ='" . $personID . "' ";
        $statement = mysqli_query($conn, $query);
      } else {
        echo '<script>alert("Swimmer does not exist!"); window.location.href = "swimmers.php"</script>';
      }

      if ($statement) {
        header("location: swimmers.php");
      } else {
        echo '<script>alert("Failed to delete location!"); window.location.href = "swimmers.php"</script>';
      }
    } 
    else if ($_POST['updateNeeded'] === "address") 
    {
      echo '<script> alert(In address"); </script>';
      $checkIfExists = "SELECT `id` FROM `persons` WHERE id = '" . $personID . "'";
      $resultFromPersons = mysqli_query($conn, $checkIfExists);
      $rowFromPersons = mysqli_num_rows($resultFromPersons);

      if ($rowFromPersons > 0) 
      {
        $checkIfAddExists = "SELECT `id` FROM `locations` WHERE id = '" . $swimmerNewVal . "'";
        $resultFromLocations = mysqli_query($conn, $checkIfAddExists);
        $rowFromLocations = mysqli_num_rows($resultFromLocations);
        echo '<script> alert('.$rowFromLocations.'); </script>';

        if ($rowFromLocations > 0) 
        {
          $query = "UPDATE `persons` SET residence_location_id = '" . $swimmerNewVal . "' WHERE id ='" . $personID . "' ";
          $statement = mysqli_query($conn, $query);
          $row = mysqli_num_rows($statement);
          echo '<script> alert('.$row.'); </script>';
        } 
        else 
        {
          //might be confusing: changing the residence_location_id(foreign key.... references location ID in locations)
          echo '<script>alert("Invalid residence ID!"); window.location.href = "swimmers.php"</script>';
        }

        if ($statement) 
        {
          header("location: swimmers.php");
        } 
        else 
        {
          echo '<script>alert("Failed to update residence ID!"); window.location.href = "swimmers.php"</script>';
        }
      } 
      else 
      {
        echo '<script>alert("Swimmer does not exist!"); window.location.href = "swimmers.php"</script>';
      }
    }
  } 
  else if ($type == "delete") 
  {
    //deleting a swimmer
    $personID = $_POST['delete'];

    if(!empty($personID))
    {
      $checkIfExists = "SELECT `id` FROM `persons` WHERE id = '" . $personID . "'";
      $resultFromPersons = mysqli_query($conn, $checkIfExists);
      $rowFromPersons = mysqli_num_rows($resultFromPersons);

      if ($rowFromPersons > 0) 
      {
        $query = "DELETE FROM `persons` WHERE id = '".$personID."' ";
        $statement = mysqli_query($conn, $query);
      } 
      else 
      {
        echo '<script>alert("Invalid swimmer ID!"); window.location.href = "swimmers.php"</script>';
      }

      if ($statement) {
        header("location: swimmers.php");
      } else {
        echo '<script>alert("Failed to delete location!"); window.location.href = "swimmers.php"</script>';
      }
    }
    else
    {
      echo '<script type="text/javascript"> alert ("Swimmer ID cannot be empty")</script>';
    }
    
  }
}
?>
<script>
  //this suppresses resubmission so that the form wont be resubmitted at refresh
  if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);
  }
</script>