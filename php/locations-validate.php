<?php
include 'locations.php';

$type = $_POST['type'];

//testing for delete site
echo $type;

//locations
if ($type == 'addLocation'){

  $city = $_POST['name'];
  $state = $_POST['state'];
  $area = $_POST['area'];
  $country = $_POST['country'];

} else if ($type == 'updateLocation'){

} else if ($type == 'deleteLocation'){

}



//addresses
else if ($type == 'addAddress'){

  $SName = $_POST['streetName'];
  $SNum = $_POST['streetNum'];


} else if ($type == 'updateAddress'){

} else if ($type == 'deleteAddress'){

}




//sites
else if ($type == 'addSite'){

  $site = $_POST['site'];
  $location = $_POST['location'];

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
