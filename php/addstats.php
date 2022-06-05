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

  $canExecute = true;

  $num = 0;
  $nums = 0;

  $publisher = $_SESSION['PubID'];
    if (!isset($publisher)){
      echo "<script type='text/javascript'>alert('You are not logged in');window.location.href='swimmers.php';</script>";
      echo "<meta http-equiv = 'refresh' content = '1; url = swimmers.php' />";
    }

    if($person == '' || $event == '' || $timeMin == '' || $timeSec == '' || $speed == '' || $stroke == '' || $heartRate == '')
    {
        $canExecute = false;
    }else{
      
      $ssql = "SELECT id FROM `events`";
      $siteq = $conn->query($ssql);
      while ($row = $siteq->fetch_assoc()){
        if ($row['id'] == $event){
          $nums++;
        }
      }
      if ($nums<=0){
        $canExecute = false;
      }
      else {
        $tsql = "SELECT id FROM `persons`";
        $teamq = $conn->query($ssql);

        while ($row = $teamq->fetch_assoc()){
          if ($row['id'] == $person){
            $num++;
          }
        }
        if ($num<=0){
          $canExecute = false;
        }
      }
    }


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


  if ($canExecute == true){
    $sql = "INSERT INTO swimmer_stats (id, position, speed, points, stroke_count, swim_time, avg_heartrate, distance_per_stroke, event_identity, person_identity) VALUES (NULL, '$position', '$speed', '$points', '$stroke', '$totaltime', '$heartRate', '$distanceStroke', '$event', '$person')";
    $result = $conn->query($sql);
  } else {
    echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='stats.php';</script>";
    echo "<meta http-equiv = 'refresh' content = '1; url = stats.php' />"; 
  }

  


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

  $canExecute = true;
  $num = 0;
  $nums = 0;

  if($teamID == '' || $event == '' || $pointsGained == '' || $pointsMax == '')
  {
      $canExecute = false;
  }else{
    
    $ssql = "SELECT id FROM `events`";
    $siteq = $conn->query($ssql);
    while ($row = $siteq->fetch_assoc()){
      if ($row['id'] == $event){
        $nums++;
      }
    }
    if ($nums<=0){
      $canExecute = false;
    }
    else {
      $tsql = "SELECT id FROM `teams`";
      $teamq = $conn->query($ssql);

      while ($row = $teamq->fetch_assoc()){
        if ($row['id'] == $teamID){
          $num++;
        }
      }
      if ($num<=0){
        $canExecute = false;
      }
    }
  }

  if ($canExecute == true){
    $sql = "INSERT INTO swimming_team_stats (id, points, max_points, best_time, worst_time, event_id, team_id) VALUES (NULL, '$pointsGained', '$pointsMax', '$bestTotaltime', '$worstTotaltime', '$event', '$teamID')";

    $result = $conn->query($sql);
  } else {
    echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='stats.php';</script>";
    echo "<meta http-equiv = 'refresh' content = '1; url = stats.php' />"; 
  }

  


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

  $canExecute = true;
  $nums = 0;

  if($eventID == '' || $distance == '' || $first == '' || $second == '' || $third == '')
  {
      $canExecute = false;
  }else{
    
    $ssql = "SELECT id FROM `events`";
    $siteq = $conn->query($ssql);
    while ($row = $siteq->fetch_assoc()){
      if ($row['id'] == $eventID){
        $nums++;
      }
    }
    if ($nums<=0){
      $canExecute = false;
    }
  }

  if ($canExecute == true){
    $sql = "INSERT INTO swimming_stats_of_events (id, first_place, second_place, third_place, no_swimmers, swim_style, distance, no_finished, race_time, event_number) VALUES (NULL, '$first', '$second', '$third', '$numSwimmers', '$event', '$distance', '$numFinished', '$totaltime', '$eventID')";

    $result = $conn->query($sql);
  } else {
    echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='stats.php';</script>";
    echo "<meta http-equiv = 'refresh' content = '1; url = stats.php' />"; 
  }

  

}




 ?>


 <script>
 //this suppresses resubmission so that the form wont be resubmitted at refresh
 if ( window.history.replaceState ) {
   window.history.replaceState( null, null, window.location.href );
 }
 </script>
