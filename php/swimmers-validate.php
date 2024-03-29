<?php
include 'swimmers.php';

//foreign keys: publisher_id and locations/residence

$type = $_POST['type'];

if (isset($type)) {
  if ($type == "insert") {
    //inserting a swimmer
    $num = 0;
    $nums = 0;


    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $teamid = $_POST['teamid'];
    $DOB = $_POST['dob'];
    $site = $_POST['address'];


    $canExecute = true;

    $key = $name . " " . $surname;

    $gender = 'N/A';
    $locationdef = "1";

    $publisher = $_SESSION['PubID'];
    if (!isset($publisher)) {
      echo "<script type='text/javascript'>alert('You are not logged in');window.location.href='swimmers.php';</script>";
      echo "<meta http-equiv = 'refresh' content = '1; url = swimmers.php' />";
    }


    if ($name == '' || $surname == '' || $DOB == '' || $teamid == '' || $site == '') {
      $canExecute = false;
    } else {

      $ssql = "SELECT id FROM `sites`";
      $siteq = $conn->query($ssql);
      while ($row = $siteq->fetch_assoc()) {
        if ($row['id'] == $site) {
          $nums++;
        }
      }
      if ($nums <= 0) {
        $canExecute = false;
      } else {
        $tsql = "SELECT id FROM `teams`";
        $teamq = $conn->query($ssql);

        while ($row = $teamq->fetch_assoc()) {
          if ($row['id'] == $teamid) {
            $num++;
          }
        }
        if ($num <= 0) {
          $canExecute = false;
        }
      }
    }



    if ($canExecute == true) {
      $sql = "INSERT INTO persons (id, person_key, publisher_id, gender, birth_date, death_date, final_resting_location_id, birth_location_id, hometown_location_id, residence_location_id, death_location_id, team_id) VALUES (NULL, '$key', '$publisher', '$gender', '$DOB', 'N/A', '$locationdef', '$locationdef', '$locationdef', '$site', '$locationdef', '$teamid')";
      $result = $conn->query($sql);
    } else {
      echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='swimmers.php';</script>";
      echo "<meta http-equiv = 'refresh' content = '1; url = swimmers.php' />";
    }
  } else if ($type == "update") {
    //updating a swimmer
    $personID = $_POST['person'];
    $swimmerNewVal = $_POST['newVal'];

    if (empty($personID) && empty($swimmerNewVal)) {
      echo '<script>alert("Person ID and New Value cannot be empty!"); window.location.href = "swimmers.php"</script>';
      die();
    } else if (empty($personID)) {
      echo '<script>alert("Person ID cannot be empty!"); window.location.href = "swimmers.php"</script>';
      die();
    } else if ($swimmerNewVal == '') {
      echo '<script>alert("New Value cannot be empty!"); window.location.href = "swimmers.php"</script>';
      die();
    }

    if ($_POST['updateNeeded'] === "name") {
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
    } else if ($_POST['updateNeeded'] === "surname") {
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
    } else if ($_POST['updateNeeded'] === "team") //swimming_team_members
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
    } else if ($_POST['updateNeeded'] === "site") {
      echo '<script> alert(In site"); </script>';
      $checkIfExists = "SELECT `id` FROM `persons` WHERE id = '" . $personID . "'";
      $resultFromPersons = mysqli_query($conn, $checkIfExists);
      $rowFromPersons = mysqli_num_rows($resultFromPersons);

      if ($rowFromPersons > 0) {
        $checkIfAddExists = "SELECT `id` FROM `locations` WHERE id = '" . $swimmerNewVal . "'";
        $resultFromLocations = mysqli_query($conn, $checkIfAddExists);
        $rowFromLocations = mysqli_num_rows($resultFromLocations);
        echo '<script> alert(' . $rowFromLocations . '); </script>';

        if ($rowFromLocations > 0) {
          $query = "UPDATE `persons` SET residence_location_id = '" . $swimmerNewVal . "' WHERE id ='" . $personID . "' ";
          $statement = mysqli_query($conn, $query);
          $row = mysqli_num_rows($statement);
          echo '<script> alert(' . $row . '); </script>';
        } else {
          //might be confusing: changing the residence_location_id(foreign key.... references location ID in locations)
          echo '<script>alert("Invalid residence ID!"); window.location.href = "swimmers.php"</script>';
        }

        if ($statement) {
          header("location: swimmers.php");
        } else {
          echo '<script>alert("Failed to update residence ID!"); window.location.href = "swimmers.php"</script>';
        }
      } else {
        echo '<script>alert("Swimmer does not exist!"); window.location.href = "swimmers.php"</script>';
      }
    }
  } else if ($type == "delete") {
    //deleting a swimmer
    $personID = $_POST['delete'];

    if (!empty($personID)) {
      $checkIfExists = "SELECT `id` FROM `persons` WHERE id = '" . $personID . "'";
      $resultFromPersons = mysqli_query($conn, $checkIfExists);
      $rowFromPersons = mysqli_num_rows($resultFromPersons);

      if ($rowFromPersons > 0) {
        $query = "DELETE FROM `persons` WHERE id = '" . $personID . "' ";
        $statement = mysqli_query($conn, $query);
      } else {
        echo '<script>alert("Invalid swimmer ID!"); window.location.href = "swimmers.php"</script>';
      }

      if ($statement) {
        header("location: swimmers.php");
      } else {
        echo '<script>alert("Failed to delete location!"); window.location.href = "swimmers.php"</script>';
      }
    } else {
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