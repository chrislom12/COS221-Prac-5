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


} else if ($type == 'updateLocation'){

} else if ($type == 'deleteLocation'){

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


} else if ($type == 'updateAddress'){

} else if ($type == 'deleteAddress'){

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

} else if ($type == 'updateSite'){


} else if ($type == 'deleteSite'){

}
?>




<script>
//this suppresses resubmission so that the form wont be resubmitted at refresh
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
</script>
