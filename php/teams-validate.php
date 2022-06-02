<?php
include 'teams.php';

//Foreign Keys: team_key, publisher_id and home_site_id

$type = $_POST['type'];
if (isset($type))
{
  if ($type == "insert")
  {
    //inserting a team

    $name = $_POST['name'];
    $site = $_POST['site'];
    $publisher = '1';

    if (isset($publisher))
    {
      $valid = "SELECT id FROM publishers WHERE id=$publisher";
      $res = $conn->query($valid);

      if (!$res)
      {
        echo "<script>alert('You are not a registered user.')</script>";
        header("Location: teams.php");
      }

    } 
    else (isset($site))
    {
      $valid = "SELECT id FROM sites WHERE id=$site";
      $res = $conn->query($valid);

      if (!$res)
      {
        echo "<script>alert('That is not a valid site ID.')</script>";
        header("Location: teams.php");
      }
    }


    $sql = "INSERT INTO teams (id, team_key, publisher_id, home_site_id) VALUES (NULL, '$name', '$publisher', '$site')";
    $result = $conn->query($sql);

  }
  else if ($type == "update")
  {
    //updating a team 
    $teamID = $_POST['team'];
    $teamNewVal = $_POST['newVal'];
    
    emptyField($teamID, $teamNewVal);

    if(isset($_POST['updateNeeded']))
    {
        if($_POST['updateNeeded'] === "teamName")
        {
          //changing team_key(index key)
            $query = "UPDATE `teams` SET team_key='" . $teamNewVal . "' WHERE id ='".$teamID."' ";
            $statement = mysqli_query($conn, $query);
        }
        else if($_POST['updateNeeded'] === "teamHomeSite")
        {
          //changing home_site_id(foreign key)
          //check if it exists in the original table
          $querySite = "SELECT `id` FROM `sites` WHERE id = '".$teamID."'";
          $resultsFromSite = mysqli_query($conn, $querySite);
          //if it does, simply update
          if($resultsFromSite)
          {
            $query = "UPDATE `teams` SET home_site_id='".$teamNewVal."' where id ='".$teamID."' ";
            $statement = mysqli_query($conn, $query);
          }
          else
          {
            //insert it then update OR reject query
            $sql = "INSERT INTO sites (id, site_key, publisher_id, location_id) VALUES ('$teamID', '$name', '$publisher', '$site')";//PROBLEM(variables will be null if type is update)
            $result = $conn->query($sql);

            $queryTeams = "UPDATE `teams` SET home_site_id='".$teamNewVal."' where id ='".$teamID."' ";
            $queryFromTeams = mysqli_query($conn, $queryTeams);
          } 
        }
    }

    if ($queryFromTeams) {
        header("location: teams.php");
    } 
    else 
    {
        echo '<script type="text/javascript"> alert ("Failed to update data!")</script>';
    }
  } 
  else if ($type == "delete")
  {
    //deleting a team
    $teamID = $_POST['delete'];

    if (!empty($teamID)) 
    {
        //check if id(primary key is referenced by anything)teams_media && swimming_teams
        //remove it from the tables it references then delete it
        $queryTM = "SELECT `team_id` FROM `teams_media` WHERE team_id = '" . $teamID . "'";
        $resultFromTM = mysqli_query($conn, $queryTM);
        
        $queryST = "SELECT `team_number` FROM `swimming_teams` WHERE team_number= '" . $teamID . "'";
        $resultFromST = mysqli_query($conn, $queryST);

        if($queryTM)
        {
          $query = "DELETE FROM `teams_media` WHERE teamID = '" . $teamID . "'";
          $statement = mysqli_query($conn, $query);
        }

        if($resultFromST)
        {
          $query = "DELETE FROM `swimming_teams` WHERE teamID = '" . $teamID . "'";
          $statement = mysqli_query($conn, $query);
        }

        $queryTeams = "DELETE FROM `teams` WHERE teamID = '" . $teamID . "'";
        $statementFromTeams = mysqli_query($conn, $queryTeams);
        if ($statementFromTeams) {
            header("location: teams.php");
        } 
        else {
            echo '<script type="text/javascript"> alert ("Failed to delete data!")</script>';
        }
    } 
    else 
    {
        echo '<script type="text/javascript"> alert ("Field cannot be empty")</script>';
    }
 

  }

  function emptyField($TeamID, $TeamNewVal)
{
    if (empty($TeamID) && empty($TeamNewVal)) {
        echo '<script>alert("Fields cannot be empty"); window.location.href = "teams.php"</script>';
    }

    if (empty($TeamID)) {
        echo '<script>alert("Team ID cannot be empty."); window.location.href = "teams.php"</script>';
    }

    if (empty($TeamNewVal)) {
        echo '<script>alert("New Value cannot be empty."); window.location.href = "teams.php"</script>';
    }
}

}
?>
<script>
//this suppresses resubmission so that the form wont be resubmitted at refresh
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
</script>
