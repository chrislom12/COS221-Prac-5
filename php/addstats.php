<?php
include 'stats.php';

if (isset($_POST['swim'])){
  $person = $_POST['person'];
  $event = $_POST['event'];
  $position = $_POST['position'];
  $time = $_POST['time'];
  $speed = $_POST['speed'];
  $stroke = $_POST['stroke'];
  $heartRate = $_POST['heartRate'];
  $distanceStroke = $_POST['distanceStroke'];



}
else if (isset($_POST['team'])){

  $teamID = $_POST['teamID'];
  $event = $_POST['event'];
  $pointsGained = $_POST['pointsGained'];
  $pointsMax = $_POST['pointsMax'];
  $bestTime = $_POST['bestTime'];
  $worstTime = $_POST['worstTime'];



} else if (isset($_POST['event'])){

  $eventID = $_POST['eventID'];
  $event = $_POST['event'];
  $numSwimmers = $_POST['numSwimmers'];
  $numFinished = $_POST['numFinished'];
  $distance = $_POST['distance'];
  $first = $_POST['first'];
  $second = $_POST['second'];
  $third = $_POST['third'];
  $time = $_POST['time'];



}




 ?>


 <script>
 //this suppresses resubmission so that the form wont be resubmitted at refresh
 if ( window.history.replaceState ) {
   window.history.replaceState( null, null, window.location.href );
 }
 </script>
