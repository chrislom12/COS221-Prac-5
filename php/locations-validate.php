<?php
include 'locations.php';

$type = $_POST['type'];

//testing for delete site

//locations
if ($type == 'addLocation'){

  $city = $_POST['city'];
  $state = $_POST['state'];
  $area = $_POST['area'];
  $country = $_POST['country'];


  $sql = "INSERT INTO locations (id, city, state, area, country, timezone, latitude, longitude, country_code) VALUES (NULL, '$city', '$state', '$area', '$country', NULL, NULL, NULL, NULL)";
  $result = $conn->query($sql);


} 
else if ($type == 'updateLocation')
{
  $locationID = $_POST['location'];
  $locationNewVal = $_POST['newVal'];

  //validation of filled in data(only checks if the data received is not empty)
  //emptyField($locationID, $locationNewVal);

  //selected option
  if(isset($_POST['updateNeeded']))
  {
      if($_POST['updateNeeded'] === "city")
      {
          $query = "UPDATE `locations` SET city='" . $locationNewVal . "' WHERE id ='".$locationID."' ";
          $statement = mysqli_query($conn, $query);
      }
      else if($_POST['updateNeeded'] === "state")
      {
          $query = "UPDATE `locations` SET state ='".$locationNewVal."' WHERE id ='".$locationID."' ";
          $statement = mysqli_query($conn, $query);
      }
      else if($_POST['updateNeeded'] === "area")
      {
          $query = "UPDATE `locations` SET area='".$locationNewVal."' WHERE id ='".$locationID."' ";
          $statement = mysqli_query($conn, $query);
      }
      else if($_POST['updateNeeded'] === "country")
      {
          $query = "UPDATE `locations` SET country='".$locationNewVal."' WHERE id ='".$locationID."' ";
          $statement = mysqli_query($conn, $query);
      }
  }

  if ($statement) {
    header("location: locations.php");
} else {
    echo '<script>alert("Failed to update location :( "); window.location.href = "locations.php"</script>';
}
} 
else if ($type == 'deleteLocation')
{
  $locationID = $_POST['delete'];

  if (!empty($locationID)) 
  {
    //check if id(primary key is referenced by anything)sites, addresses, persons, media
    //remove it from the tables it references then delete it
    $queryMedia = "SELECT `creation_location_id` FROM `media` WHERE creation_location_id = '" . $locationID . "'";
    $resultFromMedia = mysqli_query($conn, $queryMedia);
        
    $queryAddresses = "SELECT `location_id` FROM `addresses` WHERE location_id = '" . $locationID . "'";
    $resultFromAddresses = mysqli_query($conn, $queryAddresses);

    $querySites = "SELECT `location_id` FROM `sites` WHERE location_id = '" . $locationID . "'";
    $resultFromSites = mysqli_query($conn, $querySites);

    $queryPersons = "SELECT `hometown_location_id` FROM `persons` WHERE hometown_location_id = '" . $locationID . "' AND birth_location_id = '" . $locationID . "' AND residence_location_id = '" . $locationID . "'";
    $resultFromPersons = mysqli_query($conn, $queryPersons);

    if($resultFromMedia)
    {
      $query = "DELETE FROM 'media' WHERE creation_location_id = '" . $locationID . "'";
      $statement = mysqli_query($conn, $query);}

    if($resultFromAddresses)
    {
      $query = "DELETE FROM 'addresses' WHERE location_id = '" . $locationID . "'";
      $statement = mysqli_query($conn, $query);}
    

    if($resultFromSites)
    {
      $query = "DELETE FROM 'sites' WHERE location_id = '" . $locationID . "'";
      $statement = mysqli_query($conn, $query);}
    

    if($resultFromPersons)
    {
      $query = "DELETE FROM 'persons' WHERE hometown_location_id = '" . $locationID . "' AND birth_location_id = '" . $locationID . "' AND residence_location_id = '" . $locationID . "'";
      $statement = mysqli_query($conn, $query);
    }
    

    $query = "DELETE FROM 'locations' WHERE id = '" . $locationID . "'";
    $statement1 = mysqli_query($conn, $query);
    if ($statement1) 
    {
        header("location: locations.php");
    } else 
    {
        echo '<script>alert("Failed to delete location!"); window.location.href = "locations.php"</script>';
    }
  } 
  else 
  {
      echo '<script type="text/javascript"> alert ("Field cannot be empty")</script>';
  }
}



//addresses
else if ($type == 'addAddress'){
  //foreign keys: locatiod id

  $SName = $_POST['streetName'];
  $SNum = $_POST['streetNum'];
  $locId = '5';

  if (isset($locId)){
    $valid = "SELECT id FROM locations WHERE id=$locId";
    $res = $conn->query($valid);

    if (!$res){
      echo "<script>alert('That is not a valid location.')</script>";
      header("Location: locations.php");
    }
  }

  $sql = "INSERT INTO addresses (id, location_id, language, suite, floor, building, street_number, street_prefix, street, street_suffix, neighborhood, district, locality, county, region, postal_code, country) VALUES (NULL, '$locId', NULL, NULL, NULL, NULL, '$SNum', NULL, '$SName', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)";
  $result = $conn->query($sql);


} 
else if ($type == 'updateAddress')
{
  $addressID = $_POST['address'];
  $addressNewVal = $_POST['newVal'];

  //validation of filled in data(only checks if the data received is not empty)
  //emptyField($addressID, $addressNewVal);

  if(isset($_POST['updateNeeded']))
  {
      if($_POST['updateNeeded'] === "streetName")
      {
          $query = "UPDATE `addresses` SET street='" . $addressNewVal . "' where id ='".$addressID."' "; // used "street" because there's no "street name"
          $statement = mysqli_query($conn, $query);
      }
      else if($_POST['updateNeeded'] === "streetNum")
      {
          $query = "UPDATE `addresses` SET street_number='".$addressNewVal."' where id ='".$addressID."' ";
          $statement = mysqli_query($conn, $query);
      }
  }

  if ($statement) {
      header("location: locations.php");
  } else {
      echo '<script>alert("Failed to update address"); window.location.href = "locations.php"</script>';
  }
} 
else if ($type == 'deleteAddress')
{
  $addressID = $_POST['delete'];

  if (!empty($addressID)) 
  {
    //check which tables reference address(did not find any)
      $query = "DELETE FROM 'addresses' WHERE id = '" . $addressID . "'";
      $statement = mysqli_query($conn, $query);
      if ($statement) {
          header("location: locations.php");
      } else {
          echo '<script>alert("Failed to delete address!"); window.location.href = "locations.php"</script>';
      }
  } else {
      echo '<script type="text/javascript"> alert ("Field cannot be empty")</script>';
  }
}




//sites
else if ($type == 'addSite'){
  //foreign keys: publisher id and location id

  $site = $_POST['site'];
  $location = $_POST['location'];
  $publisher = '1';

    if (isset($publisher)){
      $valid = "SELECT id FROM publishers WHERE id=$publisher";
      $res = $conn->query($valid);

      if (!$res){
        echo "<script>alert('You are not a registered user.')</script>";
        header("Location: locations.php");
      }

    } else if (isset($location)){
      $valid = "SELECT id FROM locations WHERE id=$location";
      $res = $conn->query($valid);

      if (!$res){
        echo "<script>alert('That is not a valid location.')</script>";
        header("Location: locations.php");
      }
  }

  $sql = "INSERT INTO sites (id, site_key, publisher_id, location_id) VALUES (NULL, '$site', '$publisher', '$location');";
  $result = $conn->query($sql);

}

else if ($type == 'updateSite')
{
  $siteID = $_POST['site'];
  $siteNewVal = $_POST['newVal'];

  //validation of filled in data(only checks if the data received is not empty)
  //emptyField($siteID, $siteNewVal);

  if ($_POST['updateNeeded'] === "site") {
      //Site name is selected
      $query = "UPDATE `sites` SET site_key='" . $siteNewVal . "' WHERE id ='".$siteID."' ";
      $statement = mysqli_query($conn, $query);
  } 
  else if ($_POST['updateNeeded'] === "location") 
  {
      //Location ID is selected(foreign key)
      $querySite = "SELECT `id` FROM `locations` WHERE id = '".$siteID."'";
      $resultsFromSite = mysqli_query($conn, $querySite);

      if($resultsFromSite)
      {
        $query = "UPDATE `sites` SET location_id='".$siteNewVal."' WHERE id ='".$siteID."' ";
        $statement = mysqli_query($conn, $query);
      }
      else
      {
        //add it in the original table(locations) then update(sites)
        $query = "UPDATE `sites` SET location_id='".$siteNewVal."' WHERE id ='".$siteID."' ";
        $statement = mysqli_query($conn, $query);
      }
  }

  if ($statement) {
      header("location: locations.php");
  } else {
      echo '<script>alert("Failed to update site!"); window.location.href = "locations.php"</script>';
  }
} 
else if ($type == 'deleteSite')
{
  $siteID = $_POST['delete'];

  if (!empty($siteID)) 
  {
    //is site being referenced by id?events and teams
    $queryEvents = "SELECT `site_id` FROM `events` WHERE  site_id = '" . $siteID . "'";
    $queryFromEvents = mysqli_query($conn, $queryEvents);

    $queryTeams = "SELECT `home_site_id` FROM `events` WHERE  home_site_id = '" . $siteID . "'";
    $queryFromTeams = mysqli_query($conn, $queryTeams);

    if($queryFromEvents)
    {
      $query = "DELETE FROM `events` WHERE site_id = '" . $siteID . "'";
      $statement = mysqli_query($conn, $query);
    }

    if($queryFromTeams)
    {
      $query = "DELETE FROM `teams` WHERE home_site_id = '" . $siteID . "'";
      $statement = mysqli_query($conn, $query);
    }


    $query = "DELETE FROM `sites` WHERE id = '" . $siteID . "'";
    $statement = mysqli_query($conn, $query);
    if ($statement) {
        header("location: locations.php");
    } else {
        echo '<script>alert("Failed to delete site"); window.location.href = "locations.php"</script>';
    }
  } 
  else 
  {
      echo '<script type="text/javascript"> alert ("Field cannot be empty")</script>';
  }
}
?>




<script>
//this suppresses resubmission so that the form wont be resubmitted at refresh
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
</script>
