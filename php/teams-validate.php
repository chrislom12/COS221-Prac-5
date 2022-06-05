<?php
include 'teams.php';

if(isset($_SESSION['PubID'])){
  echo $_SESSION['PubID'];
}else{
  echo "no";
}

//Foreign Keys: team_key, publisher_id and home_site_id

$type = $_POST['type'];
if (isset($type)) {



  if ($type == "insert") {
    //inserting a team
    $canExecute = true;
    $name = $_POST['name'];
    $site = $_POST['site'];
    $publisher = $_SESSION['PubID'];

    if (!isset($publisher)){
      echo "<script type='text/javascript'>alert('You are not logged in');window.location.href='swimmers.php';</script>";
      echo "<meta http-equiv = 'refresh' content = '1; url = teams.php' />";
    }
    

    if($name == '' || $site == '')
    {
        $canExecute = false;
    }else{
      $ssql = "SELECT id FROM `sites`";
      $siteq = $conn->query($ssql);
      while ($row = $siteq->fetch_assoc()){
        if ($row['id'] == $site){
          $num++;
        }
      }
      if ($num<=0){
        $canExecute = false;
      }
    }

    if ($canExecute == true){
      $sql = "INSERT INTO teams (id, team_key, publisher_id, home_site_id) VALUES (NULL, '$name', '$publisher', '$site')";
      $result = $conn->query($sql);
    } else {
      echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='teams.php';</script>";
      echo "<meta http-equiv = 'refresh' content = '1; url = teams.php' />"; 
    }
    
  } 
  
  else if ($type == "update") {
    //updating a team 
    $teamID = $_POST['team'];
    $teamNewVal = $_POST['newVal'];

    //emptyField($teamID, $teamNewVal);

    if (isset($_POST['updateNeeded'])) {
      if ($_POST['updateNeeded'] === "teamName") {
        //changing team_key(index key)
        $checkIfExists = "SELECT `id` FROM `teams` WHERE id = '" . $teamID . "'";
        $resultFromTeams = mysqli_query($conn, $checkIfExists);
        $rowFromTeams = mysqli_num_rows($resultFromTeams);

        if ($rowFromTeams > 0) {
          $query = "UPDATE `teams` SET team_key='" . $teamNewVal . "' WHERE id ='" . $teamID . "' ";
          $statement = mysqli_query($conn, $query);
        } else {
          echo '<script>alert("Invalid team ID!"); window.location.href = "teams.php"</script>';
        }

        if ($statement) {
          header("location: teams.php");
        } else {
          echo '<script type="text/javascript"> alert ("Failed to update team name!"); window.location.href = "teams.php"</script>';
        }
      } else if ($_POST['updateNeeded'] === "teamHomeSite") {
        //changing home_site_id(foreign key)
        //check if it exists in the original table
        $querySite = "SELECT `id` FROM `sites` WHERE id = '" . $teamID . "'";
        $resultsFromSite = mysqli_query($conn, $querySite);
        $rowsFromSite = mysqli_num_rows($resultsFromSite);
        //if it does, simply update

        if ($rowsFromSite > 0) {
          $query = "UPDATE `teams` SET home_site_id='" . $teamNewVal . "' where id ='" . $teamID . "' ";
          $statement = mysqli_query($conn, $query);

          if ($statement) {
            header("location: teams.php");
          } else {
            echo '<script type="text/javascript"> alert ("Failed to update team home site id!"); window.location.href = "teams.php"</script>';
          }
        } else {
          echo '<script>alert("Invalid team home site ID!"); window.location.href = "teams.php"</script>';
        }
      }
    }
  } else if ($type == "delete") {
    //deleting a team
    $teamID = $_POST['delete'];

    if (!empty($teamID)) {
      //check if id(primary key) is referenced by anything.....teams_media && swimming_teams
      //remove it from the tables it references then delete it
      $checkIfExists = "SELECT `id` FROM `teams` WHERE id = '" . $teamID . "'";
      $resultFromTeams = mysqli_query($conn, $checkIfExists);
      $rowFromTeams = mysqli_num_rows($resultFromTeams);
      if ($rowFromTeams > 0) {
        $queryTeams = "DELETE FROM `teams` WHERE id = '" . $teamID . "'";
        $statementFromTeams = mysqli_query($conn, $queryTeams);
      } else {
        echo '<script>alert("Invalid team ID!"); window.location.href = "teams.php"</script>';
      }


      if ($statementFromTeams) {
        header("location: teams.php");
      } else {
        echo '<script type="text/javascript"> alert ("Failed to delete data!"); window.location.href = "teams.php"</script>';
      }
    } else {
      echo '<script type="text/javascript"> alert ("Field cannot be empty")</script>';
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