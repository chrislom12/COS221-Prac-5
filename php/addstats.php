<?php
include 'stats.php';

if (isset($_POST['swim'])){
  //foreign keys: event id, person id

  $person = $_POST['person'];
  $event = $_POST['event'];
  $position = $_POST['position'];
  $timeMin = $_POST['timeMin'];
  $timeSec = $_POST['timeMin'];

  $totaltime = "00:" . $timeMin . ":" . $timeSec;

  $speed = $_POST['speed'];
  $stroke = $_POST['stroke'];
  $heartRate = $_POST['heartRate'];
  $distanceStroke = $_POST['distanceStroke'];


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


  if (isset($event)){
    $valid = "SELECT id FROM events WHERE id=$event";
    $res = $conn->query($valid);

    if (!$res){
      echo "<script>alert('That is not a valid event ID.')</script>";
      header("Location: stats.php");
    }

  } else if (isset($person)){
    $valid = "SELECT id FROM persons WHERE id=$person";
    $res = $conn->query($valid);

    if (!$res){
      echo "<script>alert('That is not a valid swimmer ID.')</script>";
      header("Location: stats.php");
    }

  }

  $sql = "INSERT INTO swimmer_stats (id, position, speed, points, stroke_count, swim_time, avg_heartrate, distance_per_stroke, event_identity, person_identity) VALUES (NULL, '$position', '$speed', '$points', '$stroke', '$totaltime', '$heartRate', '$distanceStroke', '$event', '$person')";

  $result = $conn->query($sql);


}
else if (isset($_POST['team'])){
  //foreign key: eventid and teamid

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

  if (isset($event)){
    $valid = "SELECT id FROM events WHERE id=$event";
    $res = $conn->query($valid);

    if (!$res){
      echo "<script>alert('That is not a valid event ID.')</script>";
      header("Location: stats.php");
    }

  } else if (isset($teamID)){
    $valid = "SELECT id FROM teams WHERE id=$teamID";
    $res = $conn->query($valid);

    if (!$res){
      echo "<script>alert('That is not a valid swimmer ID.')</script>";
      header("Location: stats.php");
    }

  }

  $sql = "INSERT INTO swimming_team_stats (id, points, max_points, best_time, worst_time, event_id, team_id) VALUES (NULL, '$pointsGained', '$pointsMax', '$bestTotaltime', '$worstTotaltime', '$event', '$teamID')";

  $result = $conn->query($sql);


} else if (isset($_POST['event'])){
  //foreign key: event id

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

  if (isset($eventID)){
    $valid = "SELECT id FROM events WHERE id=$eventID";
    $res = $conn->query($valid);

    if (!$res){
      echo "<script>alert('That is not a valid event ID.')</script>";
      header("Location: stats.php");
    }

  }

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
