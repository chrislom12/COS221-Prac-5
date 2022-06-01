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

  $SName = $_POST['streetName'];
  $SNum = $_POST['streetNum'];
  $locId = '5';

  $sql = "INSERT INTO addresses (id, location_id, language, suite, floor, building, street_number, street_prefix, street, street_suffix, neighborhood, district, locality, county, region, postal_code, country) VALUES (NULL, '$locId', NULL, NULL, NULL, NULL, '$SNum', NULL, '$SName', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)";
  $result = $conn->query($sql);


} else if ($type == 'updateAddress'){

} else if ($type == 'deleteAddress'){

}




//sites
else if ($type == 'addSite'){

  $site = $_POST['site'];
  $location = $_POST['location'];
  $publisher = '1';


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
