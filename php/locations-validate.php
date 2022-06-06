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
  $canExecute = true;


  $publisher = $_SESSION['PubID'];
  if (!isset($publisher)) {
    echo "<script type='text/javascript'>alert('You are not logged in');window.location.href='locations.php';</script>";
    echo "<meta http-equiv = 'refresh' content = '1; url = locations.php' />";
  }

  if ($city == '' || $state == '' || $area == '' || $country == '') {
    $canExecute = false;
  }

  if ($canExecute == true) {
    $sql = "INSERT INTO locations (id, city, state, area, country, timezone, latitude, longitude, country_code) VALUES (NULL, '$city', '$state', '$area', '$country', NULL, NULL, NULL, NULL)";
    $result = $conn->query($sql);
  } else {
    echo "<script type='text/javascript'>alert('Fields cannot be empty.');window.location.href='locations.php';</script>";
    echo "<meta http-equiv = 'refresh' content = '1; url = locations.php' />";
  }
} else if ($type == 'updateLocation') {
  $locationID = $_POST['location'];
  $locationNewVal = $_POST['newVal'];

  if (empty($locationID) && empty($locationNewVal)) {
    echo '<script>alert("Location ID and New Value cannot be empty!"); window.location.href = "locations.php"</script>';
    die();
  } else if (empty($locationID)) {
    echo '<script>alert("Location ID cannot be empty!"); window.location.href = "locations.php"</script>';
    die();
  } else if ($locationNewVal == '') {
    echo '<script>alert("New Value cannot be empty!"); window.location.href = "locations.php"</script>';
    die();
  }

  //selected option
  if (isset($_POST['updateNeeded'])) {
    $checkIfExists = "SELECT `id` FROM `locations` WHERE id = '" . $locationID . "'";
    $resultFromLocations = mysqli_query($conn, $checkIfExists);
    $rowFromLocations = mysqli_num_rows($resultFromLocations);


    if ($rowFromLocations > 0) {
      if ($_POST['updateNeeded'] === "city") {
        $query = "UPDATE `locations` SET city='" . $locationNewVal . "' WHERE id ='" . $locationID . "' ";
        $statement = mysqli_query($conn, $query);
      } else if ($_POST['updateNeeded'] === "state") {
        $query = "UPDATE `locations` SET state ='" . $locationNewVal . "' WHERE id ='" . $locationID . "' ";
        $statement = mysqli_query($conn, $query);
      } else if ($_POST['updateNeeded'] === "area") {
        $query = "UPDATE `locations` SET area='" . $locationNewVal . "' WHERE id ='" . $locationID . "' ";
        $statement = mysqli_query($conn, $query);
      } else if ($_POST['updateNeeded'] === "country") {
        $query = "UPDATE `locations` SET country='" . $locationNewVal . "' WHERE id ='" . $locationID . "' ";
        $statement = mysqli_query($conn, $query);
      }
    } else {
      echo '<script>alert("Invalid Location ID!"); window.location.href = "locations.php"</script>';
    }
  }

  if ($statement) {
    header("location: locations.php");
  } else {
    echo '<script>alert("Failed to update location!"); window.location.href = "locations.php"</script>';
  }
} else if ($type == 'deleteLocation') {
  $locationID = $_POST['delete'];

  if (!empty($locationID)) {

    $checkIfExists = "SELECT `id` FROM `locations` WHERE id = '" . $locationID . "'";
    $resultFromLocations = mysqli_query($conn, $checkIfExists);
    $rowFromLocations = mysqli_num_rows($resultFromLocations);

    if ($rowFromLocations > 0) {
      $query = "DELETE FROM `locations` WHERE id = '" . $locationID . "'";
      $statement = mysqli_query($conn, $query);
    } else {
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
  $canExecute = true;

  $publisher = $_SESSION['PubID'];
  if (!isset($publisher)) {
    echo "<script type='text/javascript'>alert('You are not logged in');window.location.href='locations.php';</script>";
    echo "<meta http-equiv = 'refresh' content = '1; url = locations.php' />";
  }

  if ($SName == '' || $SNum == '' || $locId == '') {
    $canExecute = false;
  } else {

    $valid = "SELECT id FROM locations";
    $res = $conn->query($valid);
    while ($row = $res->fetch_assoc()) {
      if ($row['id'] == $locId) {
        $nums++;
      }
    }
    if ($nums <= 0) {
      $canExecute = false;
    }
  }

  if ($canExecute == true) {
    $sql = "INSERT INTO addresses (id, location_id, language, suite, floor, building, street_number, street_prefix, street, street_suffix, neighborhood, district, locality, county, region, postal_code, country) VALUES (NULL, '$locId', NULL, NULL, NULL, NULL, '$SNum', NULL, '$SName', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)";
    $result = $conn->query($sql);
  } else {
    echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='locations.php';</script>";
    echo "<meta http-equiv = 'refresh' content = '1; url = locations.php' />";
  }
} else if ($type == 'updateAddress') {
  $addressID = $_POST['address'];
  $addressNewVal = $_POST['newVal'];

  if (empty($addressID) && empty($addressNewVal)) {
    echo '<script>alert("Address ID and New Value cannot be empty!"); window.location.href = "locations.php"</script>';
    die();
  } else if (empty($addressID)) {
    echo '<script>alert("Address ID cannot be empty!"); window.location.href = "locations.php"</script>';
    die();
  } else if ($addressNewVal == '') {
    echo '<script>alert("New Value cannot be empty!"); window.location.href = "locations.php"</script>';
    die();
  }

  if (isset($_POST['updateNeeded'])) {

    $checkIfExists = "SELECT `id` FROM `addresses` WHERE id = '" . $addressID . "'";
    $resultFromAddresses = mysqli_query($conn, $checkIfExists);
    $rowFromAddresses = mysqli_num_rows($resultFromAddresses);

    if ($rowFromAddresses > 0) {
      if ($_POST['updateNeeded'] === "streetName") {
        $query = "UPDATE `addresses` SET street='" . $addressNewVal . "' where id ='" . $addressID . "' "; // used "street" because there's no "street name"
        $statement = mysqli_query($conn, $query);
      } else if ($_POST['updateNeeded'] === "streetNum") {
        $query = "UPDATE `addresses` SET street_number='" . $addressNewVal . "' where id ='" . $addressID . "' ";
        $statement = mysqli_query($conn, $query);
      }
    } else {
      echo '<script>alert("Invalid Address ID"); window.location.href = "locations.php"</script>';
    }
  }

  if ($statement) {
    header("location: locations.php");
  } else {
    echo '<script>alert("Failed to update address"); window.location.href = "locations.php"</script>';
  }
} else if ($type == 'deleteAddress') {
  $addressID = $_POST['delete'];

  if (!empty($addressID)) {
    $checkIfExists = "SELECT `id` FROM `addresses` WHERE id = '" . $addressID . "'";
    $resultFromAddresses = mysqli_query($conn, $checkIfExists);
    $rowFromAddresses = mysqli_num_rows($resultFromAddresses);
    //echo '<script>alert("' . $rowFromAddresses . '"); </script>';

    if ($rowFromAddresses > 0) {
      $query = "DELETE FROM `addresses` WHERE id = '" . $addressID . "'";
      $statement = mysqli_query($conn, $query);
    } else {
      echo '<script>alert("Invalid address ID!"); window.location.href = "locations.php"</script>';
    }

    if ($statement) {
      header("location: locations.php");
    } else {
      echo '<script>alert("Failed to delete address!"); window.location.href = "locations.php"</script>';
    }
  } else {
    echo '<script type="text/javascript"> alert ("Address ID cannot be empty")</script>';
  }
}




//sites
else if ($type == 'addSite') {
  //foreign keys: publisher id and location id

  $site = $_POST['site'];
  $location = $_POST['location'];
  $canExecute = true;

  $publisher = $_SESSION['PubID'];
  if (!isset($publisher)) {
    echo "<script type='text/javascript'>alert('You are not logged in');window.location.href='locations.php';</script>";
    echo "<meta http-equiv = 'refresh' content = '1; url = locations.php' />";
  }

  if ($site == '' || $location == '') {
    $canExecute = false;
  } else {

    $valid = "SELECT id FROM locations";
    $res = $conn->query($valid);
    while ($row = $res->fetch_assoc()) {
      if ($row['id'] == $location) {
        $nums++;
      }
    }
    if ($nums <= 0) {
      $canExecute = false;
    }
  }

  if ($canExecute == true) {
    $sql = "INSERT INTO sites (id, site_key, publisher_id, location_id) VALUES (NULL, '$site', '$publisher', '$location');";
    $result = $conn->query($sql);
  } else {
    echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='locations.php';</script>";
    echo "<meta http-equiv = 'refresh' content = '1; url = locations.php' />";
  }
} else if ($type == 'updateSite') {
  $siteID = $_POST['site'];
  $siteNewVal = $_POST['newVal'];


  if (empty($siteID) && empty($siteNewVal)) {
    echo '<script>alert("Site ID and New Value cannot be empty!"); window.location.href = "locations.php"</script>';
    die();
  } else if (empty($siteID)) {
    echo '<script>alert("Site ID cannot be empty!"); window.location.href = "locations.php"</script>';
    die();
  } else if ($siteNewVal == '') {
    echo '<script>alert("New Value cannot be empty!"); window.location.href = "locations.php"</script>';
    die();
  }

  if (isset($_POST['updateNeeded'])) {

    $querySite = "SELECT `id` FROM `sites` WHERE id = '" . $siteID . "'";
    $resultsFromSite = mysqli_query($conn, $querySite);
    $rowsFromSite = mysqli_num_rows($resultsFromSite);


    if ($rowsFromSite > 0) {
      if ($_POST['updateNeeded'] === "site") {
        $query = "UPDATE `sites` SET site_key='" . $siteNewVal . "' WHERE id ='" . $siteID . "' ";
        $statement = mysqli_query($conn, $query);
      } else if ($_POST['updateNeeded'] === "location") {
        //Location ID is selected(foreign key)
        $checkIfExists = "SELECT `id` FROM `locations` WHERE id = '" . $siteNewVal . "'";
        $resultFromLocations = mysqli_query($conn, $checkIfExists);
        $rowFromLocations = mysqli_num_rows($resultFromLocations);
        //echo '<script>alert("' . $rowFromLocations . '"); </script>';

        if ($rowFromLocations > 0) {
          $query = "UPDATE `sites` SET location_id='" . $siteNewVal . "' WHERE id ='" . $siteID . "' ";
          $statement = mysqli_query($conn, $query);
        } else {
          //might be confusing: the user is updating the location ID from sites table
          echo '<script>alert("Invalid location ID!"); window.location.href = "locations.php"</script>';
        }
      }

      if ($statement) {
        header("location: locations.php");
      } else {
        echo '<script>alert("Failed to update site!"); window.location.href = "locations.php"</script>';
      }
    } else {
      echo '<script>alert("Invalid Site ID!"); window.location.href = "locations.php"</script>';
    }
  }
} else if ($type == 'deleteSite') {
  $siteID = $_POST['delete'];

  if (!empty($siteID)) {

    $checkIfExists = "SELECT `id` FROM `sites` WHERE id = '" . $siteID . "'";
    $resultFromSites = mysqli_query($conn, $checkIfExists);
    $rowFromSites = mysqli_num_rows($resultFromSites);
    //echo '<script>alert("' . $rowFromSites . '"); </script>';

    if ($rowFromSites > 0) {
      $query = "DELETE FROM `sites` WHERE id = '" . $siteID . "'";
      $statement = mysqli_query($conn, $query);
    } else {
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