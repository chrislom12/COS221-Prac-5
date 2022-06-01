<?php
include 'stats.php';

if (isset($_POST['swim'])){
  $person = $_POST['person'];
  $event = $_POST['event'];
  $position = $_POST['position'];
  $timeMin = $_POST['timeMin'];
  $timeSec = $_POST['timeMin'];

  $totaltime = "00:" . $timeMin . ":" . $timeSec;
  $SWOLFtime = $timeMin*60 + $timeSec;

  $speed = $_POST['speed'];
  $stroke = $_POST['stroke'];
  $heartRate = $_POST['heartRate'];
  $distanceStroke = $_POST['distanceStroke'];

  $SWOLF = $SWOLFtime+$stroke;

  $personalbest = NULL;

  if ($position == 1){
    $points =6;

  } else if ($position == 2){
    $points =5;

  } else if ($position == 3){
    $points =4;

  } else if ($position == 4){
    $points =3;

  } else if ($position == 5){
    $points =2;

  } else if ($position == 6){
    $points =1;

  } else{
    $points = 0;
  }

  $sql = "INSERT INTO swimmer_stats (id, position, speed, SWOLF, points, stroke_count, swim_time, avg_heartrate, distance_per_stroke, personal_best, event_identity, person_identity) VALUES (NULL, '$position', '$speed', '$SWOLF', '$points', '$stroke', '$totaltime', '$heartRate', '$distanceStroke', '$personalbest', '$event', '$person')";

  $result = $conn->query($sql);



}
else if (isset($_POST['team'])){

  $teamID = $_POST['teamID'];
  $event = $_POST['event'];
  $pointsGained = $_POST['pointsGained'];
  $pointsMax = $_POST['pointsMax'];
  $bestTimeMin = $_POST['bestTimeMin'];
  $bestTimeSec = $_POST['bestTimeSec'];

  $bestTotaltime = "00:" . $bestTimeMin . ":" . $bestTimeSec;

  $worstTimeMin = $_POST['worstTimeMin'];
  $worstTimeSec = $_POST['worstTimeSec'];


  $worstTotaltime = "00:" . $worstTimeMin . ":" . $worstTimeSec;

  $sql = "INSERT INTO swimming_team_stats (id, points, max_points, best_time, worst_time, event_id, team_id) VALUES (NULL, '$pointsGained', '$pointsMax', '$bestTotaltime', '$worstTotaltime', '$event', '$teamID')";

  $result = $conn->query($sql);


} else if (isset($_POST['event'])){

  $eventID = $_POST['eventID'];
  $event = $_POST['event'];
  $numSwimmers = $_POST['numSwimmers'];
  $numFinished = $_POST['numFinished'];
  $distance = $_POST['distance'];
  $first = $_POST['first'];
  $second = $_POST['second'];
  $third = $_POST['third'];
  $timeMin = $_POST['timeMin'];
  $timeSec = $_POST['timeSec'];

  $totaltime = "00:" . $timeMin . ":" . $timeSec;

  $sql = "INSERT INTO swimming_stats_of_events (id, first_place, second_place, third_place, no_swimmers, swim_style, distance, no_finished, race_time, event_number) VALUES (NULL, '$first', '$second', '$third', '$numSwimmers', '$event', '$distance', '$numFinished', '$totaltime', '$eventID')";

  $result = $conn->query($sql);

}




 ?>


 <script>
 //this suppresses resubmission so that the form wont be resubmitted at refresh
 if ( window.history.replaceState ) {
   window.history.replaceState( null, null, window.location.href );
 }
 </script>
