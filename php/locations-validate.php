<?php
include 'locations.php';

$type = $_POST['type'];

//testing for delete site

//locations
if ($type == 'addLocation') {

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

  //selected option
  if (isset($_POST['updateNeeded'])) 
  {
    if ($_POST['updateNeeded'] === "city") 
    {
      $query = "UPDATE `locations` SET city='" . $locationNewVal . "' WHERE id ='" . $locationID . "' ";
      $statement = mysqli_query($conn, $query);
    } 
    else if ($_POST['updateNeeded'] === "state") 
    {
      $query = "UPDATE `locations` SET state ='" . $locationNewVal . "' WHERE id ='" . $locationID . "' ";
      $statement = mysqli_query($conn, $query);
    } 
    else if ($_POST['updateNeeded'] === "area") 
    {
      $query = "UPDATE `locations` SET area='" . $locationNewVal . "' WHERE id ='" . $locationID . "' ";
      $statement = mysqli_query($conn, $query);
    } 
    else if ($_POST['updateNeeded'] === "country") 
    {
      $query = "UPDATE `locations` SET country='" . $locationNewVal . "' WHERE id ='" . $locationID . "' ";
      $statement = mysqli_query($conn, $query);
    }
  }

  if ($statement) {
    header("location: locations.php");
  } else {
    echo '<script>alert("Failed to update location!"); window.location.href = "locations.php"</script>';
  }
} 
else if ($type == 'deleteLocation') 
{
  $locationID = $_POST['delete'];

  if (!empty($locationID)) {

    $checkIfExists = "SELECT `id` FROM `locations` WHERE id = '" . $locationID . "'";
    $resultFromLocations = mysqli_query($conn, $checkIfExists);
    $rowFromLocations = mysqli_num_rows($resultFromLocations);
    //echo '<script>alert("' . $rowFromLocations . '"); </script>';

    if($rowFromLocations > 0)
    {
      $query = "DELETE FROM `locations` WHERE id = '" . $locationID . "'";
      $statement = mysqli_query($conn, $query);
    }
    else
    {
      echo '<script>alert("Invalid location ID!"); window.location.href = "locations.php"</script>';
    }

    if ($statement) {
      header("location: locations.php");
    } else {
      echo '<script>alert("Failed to delete location!"); window.location.href = "locations.php"</script>';
    }
  } else {
    echo '<script type="text/javascript"> alert ("Location ID cannot be empty")</script>';
  }
}



//addresses
else if ($type == 'addAddress') {
  //foreign keys: locatiod id

  $SName = $_POST['streetName'];
  $SNum = $_POST['streetNum'];
  $locId = '5';

  if (isset($locId)) {
    $valid = "SELECT id FROM locations WHERE id=$locId";
    $res = $conn->query($valid);

    if (!$res) {
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

  if (isset($_POST['updateNeeded'])) 
  {
    if ($_POST['updateNeeded'] === "streetName") 
    {
      $query = "UPDATE `addresses` SET street='" . $addressNewVal . "' where id ='" . $addressID . "' "; // used "street" because there's no "street name"
      $statement = mysqli_query($conn, $query);
    } 
    else if ($_POST['updateNeeded'] === "streetNum") 
    {
      $query = "UPDATE `addresses` SET street_number='" . $addressNewVal . "' where id ='" . $addressID . "' ";
      $statement = mysqli_query($conn, $query);
    }
  }

  if ($statement) {
    header("location: locations.php");
  } else {
    echo '<script>alert("Failed to update address"); window.location.href = "locations.php"</script>';
  }
} 


else if ($type == 'deleteAddress') {
  $addressID = $_POST['delete'];

  if (!empty($addressID)) 
  {
    $checkIfExists = "SELECT `id` FROM `addresses` WHERE id = '" . $addressID . "'";
    $resultFromAddresses = mysqli_query($conn, $checkIfExists);
    $rowFromAddresses = mysqli_num_rows($resultFromAddresses);
    //echo '<script>alert("' . $rowFromAddresses . '"); </script>';

    if($rowFromAddresses > 0)
    {
      $query = "DELETE FROM `addresses` WHERE id = '" . $addressID . "'";
      $statement = mysqli_query($conn, $query);
    }
    else
    {
      echo '<script>alert("Invalid address ID!"); window.location.href = "locations.php"</script>';
    }
    
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
else if ($type == 'addSite') {
  //foreign keys: publisher id and location id

  $site = $_POST['site'];
  $location = $_POST['location'];
  $publisher = '1';

  if (isset($publisher)) {
    $valid = "SELECT id FROM publishers WHERE id=$publisher";
    $res = $conn->query($valid);

    if (!$res) {
      echo "<script>alert('You are not a registered user.')</script>";
      header("Location: locations.php");
    }
  } else if (isset($location)) {
    $valid = "SELECT id FROM locations WHERE id=$location";
    $res = $conn->query($valid);

    if (!$res) {
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

  if ($_POST['updateNeeded'] === "site") 
  {
    $query = "UPDATE `sites` SET site_key='" . $siteNewVal . "' WHERE id ='" . $siteID . "' ";
    $statement = mysqli_query($conn, $query);
  } 
  else if ($_POST['updateNeeded'] === "location") 
  {
    //Location ID is selected(foreign key)
    $checkIfExists = "SELECT `id` FROM `locations` WHERE id = '" . $siteNewVal . "'";
    $resultFromLocations = mysqli_query($conn, $checkIfExists);
    $rowFromLocations = mysqli_num_rows($resultFromLocations);
    //echo '<script>alert("' . $rowFromLocations . '"); </script>';

    if ($rowFromLocations > 0) 
    {
      $query = "UPDATE `sites` SET location_id='" . $siteNewVal . "' WHERE id ='" . $siteID . "' ";
      $statement = mysqli_query($conn, $query);
    } 
    else 
    {
      //might be confusing: the user is updating the location ID from sites table
      echo '<script>alert("Invalid location ID!"); window.location.href = "locations.php"</script>';
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

    $checkIfExists = "SELECT `id` FROM `sites` WHERE id = '" . $siteID . "'";
    $resultFromSites = mysqli_query($conn, $checkIfExists);
    $rowFromSites = mysqli_num_rows($resultFromSites);
    //echo '<script>alert("' . $rowFromSites . '"); </script>';

    if($rowFromSites > 0)
    {
      $query = "DELETE FROM `sites` WHERE id = '" . $siteID . "'";
      $statement = mysqli_query($conn, $query);
    }
    else
    {
      echo '<script>alert("Invalid sites ID!"); window.location.href = "locations.php"</script>';
    }
    
    if ($statement) {
      header("location: locations.php");
    } else {
      echo '<script>alert("Failed to delete site!"); window.location.href = "locations.php"</script>';
    }
  } else {
    echo '<script type="text/javascript"> alert ("Site ID cannot be empty")</script>';
  }
}
?>




<script>
  //this suppresses resubmission so that the form wont be resubmitted at refresh
  if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);
  }
</script>