<?php
//check value of each hidden element instead
//no way to identify which state we are adding
include 'scores.php';
//test code for type:
  //echo "<script>alert('".$_POST['type']."')</script>";
  // add tournament
  $type = $_POST['type'];

  if ($type == 'tournament'){

    $start_date = $_POST['start'];
    $end_date = $_POST['end'];
    $name = $_POST['name'];
    $location = $_POST['location'];
    $winner = $_POST['winner'];
    $num = 0;
    $nums = 0;

    $canExecute = true;

    $publisher = $_SESSION['PubID'];
    if (!isset($publisher)){
      echo "<script type='text/javascript'>alert('You are not logged in');window.location.href='scores.php';</script>";
      echo "<meta http-equiv = 'refresh' content = '1; url = scores.php' />";
    }


    if($name == '' || $start_date == '' || $end_date == '' || $location == '' || $winner == '')
    {
        $canExecute = false;
    }else{
      
      $ssql = "SELECT id FROM `locations`";
      $siteq = $conn->query($ssql);
      while ($row = $siteq->fetch_assoc()){
        if ($row['id'] == $location){
          $nums++;
        }
      }
      if ($nums<=0){
        $canExecute = false;
      }else{
        $tsql = "SELECT id FROM `teams`";
        $teamq = $conn->query($tsql);
        while ($row = $teamq->fetch_assoc()){
          if ($row['id'] == $winner){
            $num++;
          }
        }
        if ($num<=0){
          $canExecute = false;
        }
      }
    }

    

    if ($canExecute == true){
      $sql = "INSERT INTO swimming_tournament (end_date, location, start_date, winner) VALUES ('$end_date', '$location', '$start_date', '$winner')";
      $result = $conn->query($sql);
    } else {
      echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='scores.php';</script>";
      echo "<meta http-equiv = 'refresh' content = '1; url = scores.php' />"; 
    }

  }

  //add event
  if ($type == 'event'){
    //foreign keys: publisher id, site id
    date_default_timezone_set('Africa/Johannesburg');

    $event_key = $_POST['event'];
    $startdate = null;
    $site = $_POST['site'];
    $sitealign = null;
    $eventstatus = null;
    $duration = null;
    $attendance = $_POST['attendance'];
    $lastUpdate = date('Y/m/d');
    $num = null;
    $round = null;
    $time = null;
    $broadcast = null;
    $local = null;
    $medal = null;
    $series = $_POST['series'];
    $num = 0;
    $nums = 0;
    $canExecute = true;

    $publisher = $_SESSION['PubID'];
    if (!isset($publisher)){
      echo "<script type='text/javascript'>alert('You are not logged in');window.location.href='scores.php';</script>";
      echo "<meta http-equiv = 'refresh' content = '1; url = scores.php' />";
    }

    if($event_key == '' || $attendance == '' || $series == '' || $site == '')
    {
        $canExecute = false;
    }else{
      
      $ssql = "SELECT id FROM `sites`";
      $siteq = $conn->query($ssql);
      while ($row = $siteq->fetch_assoc()){
        if ($row['id'] == $site){
          $nums++;
        }
      }
      if ($nums<=0){
        $canExecute = false;
      }
    }

    if ($canExecute == true){
      $sql = "INSERT INTO events (id, event_key, publisher_id, start_date_time, site_id, site_alignment, event_status, duration, attendance, last_update, event_number, round_number, time_certainty, broadcast_listing, start_date_time_local, medal_event, series_index) VALUES (NULL, '$event_key', '$publisher', NULL, '$site', NULL, NULL, NULL, '$attendance', '$lastUpdate', NULL, NULL, NULL, NULL, NULL, NULL, '$series')";
      $result = $conn->query($sql);
    } else {
      echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='scores.php';</script>";
      echo "<meta http-equiv = 'refresh' content = '1; url = scores.php' />"; 
    }



  }


//add state
  if ($type == 'eventState'){
    //foreign keys: play type id, event id

    $playType = $_POST['typeEventState'];

    $event = $_POST['event'];
    $sequence = $_POST['sequence'];
    $timeMin = $_POST['timeMin'];
    $timeSec = $_POST['timeSec'];
    $time = "00:" . $timeMin . ":" . $timeSec;
    $state = $_POST['raceState'];
    $num = 0;
    $nums = 0;

    $canExecute = true;

    $publisher = $_SESSION['PubID'];
    if (!isset($publisher)){
      echo "<script type='text/javascript'>alert('You are not logged in');window.location.href='scores.php';</script>";
      echo "<meta http-equiv = 'refresh' content = '1; url = scores.php' />";
    }

    if($event == '' || $sequence == '' || $time == '' || $state == '')
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
    }

    //start
    if ($playType == 'start'){
      $person = $_POST['person1'];
      $position = $_POST['position'];

      if($person == '' || $position == '')
      {
          $canExecute = false;
      }else{
        
        $psql = "SELECT id FROM `persons`";
        $personq = $conn->query($psql);
        while ($row = $personq->fetch_assoc()){
          if ($row['id'] == $person){
            $num++;
          }
        }
        if ($num<=0){
          $canExecute = false;
        }
      }

      if ($canExecute == true){
        echo "yes";
        $sql = "INSERT INTO swimming_play_type (id) VALUES (NULL)";
        $result = $conn->query($sql);
        $res = $conn->insert_id;

        $sql2 = "INSERT INTO swimming_event_states (id, sequence_nr, time_elapsed, person_1, person_2, current_race_state, play_type_id, event_iden) VALUES (NULL, '$sequence', '$time', '$person', NULL, '$state', '$res', '$event')";
        $result2 = $conn->query($sql2);

        $sql3 = "INSERT INTO swimming_start (start_position, play_type_start_id) VALUES ('$position', '$res')";
        $result3 = $conn->query($sql3);
      } else {
        echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='scores.php';</script>";
        echo "<meta http-equiv = 'refresh' content = '1; url = scores.php' />"; 
      }

      

    }








    //overtake
    if ($playType == 'overtake'){
      $person1 = $_POST['overtaker'];
      $person2 = $_POST['overtakee'];
      $newposition = $_POST['position'];
      $oldposition = $newposition-1;

      if($person1 == '' || $person2 == '')
      {
          $canExecute = false;
      }else{
        
        $psql = "SELECT id FROM `persons`";
        $personq = $conn->query($psql);
        while ($row = $personq->fetch_assoc()){
          if ($row['id'] == $person1){
            $nums++;
          }
        }
        if ($nums<=0){
          $canExecute = false;
        }else{
          $p2sql = "SELECT id FROM `persons`";
          $personq2 = $conn->query($p2sql);
          while ($row = $personq2->fetch_assoc()){
            if ($row['id'] == $person2){
              $num++;
            }
          }
          if ($num<=0){
            $canExecute = false;
          }
        }
      }

      if ($canExecute == true){
        $sql = "INSERT INTO swimming_play_type (id) VALUES (NULL)";
        $result = $conn->query($sql);
        $res = $conn->insert_id;

        $sql2 = "INSERT INTO swimming_event_states (id, sequence_nr, time_elapsed, person_1, person_2, current_race_state, play_type_id, event_iden) VALUES (NULL, '$sequence', '$time', '$person1', '$person2', '$state', '$res', '$event')";
        $result2 = $conn->query($sql2);

        $sql3 = "INSERT INTO swimming_overtake (new_position, old_position, play_type_overtake_id) VALUES ('$newposition', '$oldposition', '$res')";
        $result3 = $conn->query($sql3);
      } else {
        echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='scores.php';</script>";
        echo "<meta http-equiv = 'refresh' content = '1; url = scores.php' />"; 
      }

      


    }


    //finish
    if ($playType == 'finish'){
      $person = $_POST['person1'];
      $position = $_POST['position'];

      if($person == '' || $position == '')
      {
          $canExecute = false;
      }else{
        
        $psql = "SELECT id FROM `persons`";
        $personq = $conn->query($psql);
        while ($row = $personq->fetch_assoc()){
          if ($row['id'] == $person){
            $nums++;
          }
        }
        if ($nums<=0){
          $canExecute = false;
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
        $sql = "INSERT INTO swimming_play_type (id) VALUES (NULL)";
        $result = $conn->query($sql);
        $res = $conn->insert_id;

        $sql2 = "INSERT INTO swimming_event_states (id, sequence_nr, time_elapsed, person_1, person_2, current_race_state, play_type_id, event_iden) VALUES (NULL, '$sequence', '$time', '$person', NULL, '$state', '$res', '$event')";
        $result2 = $conn->query($sql2);

        $sql3 = "INSERT INTO swimming_finish (points_gained, play_type_finish_id) VALUES ('$points', '$res')";
        $result3 = $conn->query($sql3);
      } else {
        echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='scores.php';</script>";
        echo "<meta http-equiv = 'refresh' content = '1; url = scores.php' />"; 
      }

      

    }


    //disqualify
    if ($playType == 'disqualify'){
      $person = $_POST['person1'];
      $reason = $_POST['reason'];

      if($person == '' || $reason == '')
      {
          $canExecute = false;
      }else{
        
        $psql = "SELECT id FROM `persons`";
        $personq = $conn->query($psql);
        while ($row = $personq->fetch_assoc()){
          if ($row['id'] == $person){
            $nums++;
          }
        }
        if ($nums<=0){
          $canExecute = false;
        }
      }

      if ($canExecute == true){
        $sql = "INSERT INTO swimming_play_type (id) VALUES (NULL)";
        $result = $conn->query($sql);
        $res = $conn->insert_id;

        $sql2 = "INSERT INTO swimming_event_states (id, sequence_nr, time_elapsed, person_1, person_2, current_race_state, play_type_id, event_iden) VALUES (NULL, '$sequence', '$time', '$person', NULL, '$state', '$res', '$event')";
        $result2 = $conn->query($sql2);

        $sql3 = "INSERT INTO swimming_disqualified (reason, play_type_disqualified_id) VALUES ('$reason', '$res');";
        $result3 = $conn->query($sql3);
      } else {
        echo "<script type='text/javascript'>alert('You entered invalid data');window.location.href='scores.php';</script>";
        echo "<meta http-equiv = 'refresh' content = '1; url = scores.php' />"; 
      }

      

    }
  }
?>
<script>
//this suppresses resubmission so that the form wont be resubmitted at refresh
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
</script>
