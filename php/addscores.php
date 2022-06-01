<?php
//check value of each hidden element instead
//no way to identify which state we are adding
include 'scores.php';

  // add tournament
  if (isset($_POST['torn'])){

    $start_date = $_POST['start'];
    $end_date = $_POST['end'];
    $name = $_POST['name'];
    $location = $_POST['location'];
    $winner = $_POST['winner'];

    //tournament name

    $sql = "INSERT INTO swimming_tournament (end_date, location, start_date, winner) VALUES ('$end_date', '$location', '$start_date', '$winner')";

    $result = $conn->query($sql);

  }

  //add event
  if (isset($_POST['addevent'])){
    $event_key = $_POST['event'];
    $publisher = '1';
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


    $sql = "INSERT INTO events (id, event_key, publisher_id, start_date_time, site_id, site_alignment, event_status, duration, attendance, last_update, event_number, round_number, time_certainty, broadcast_listing, start_date_time_local, medal_event, series_index) VALUES ('NULL', '$event_key', '$publisher', 'NULL', '$site', 'NULL', 'NULL', 'NULL', '$attendance', '$lastUpdate', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', '$series')";

    $result = $conn->query($sql);



  }


//add state
  if (isset($_POST['eventState'])){

    $event = $_POST['event'];
    $sequence = $_POST['sequence'];
    $time = $_POST['time'];
    $state = $_POST['raceState'];


    if (isset($_POST['startBtn'])){
      $person = $_POST['person1'];
      $position = $_POST['position'];

      $sql = "INSERT INTO swimming_play_type (id) VALUES ('NULL')";
      $result = $conn->query($sql);
      $res = $conn->insert_id;

      $sql2 = "INSERT INTO swimming_event_states (id, sequence_nr, time_elapsed, person_1, person_2, current_race_state, play_type_id, event_iden) VALUES ('NULL', '$sequence', '$time', '$person', 'NULL', '$state', '$res', '$event')";
      $result2 = $conn->query($sql2);

      $sql3 = "INSERT INTO swimming_start (start_position, play_type_start_id) VALUES ('$position', '$res')";
      $result3 = $conn->query($sql3);

    }

    if (isset($_POST['overtakeBtn'])){
      $person1 = $_POST['overtaker'];
      $person2 = $_POST['overtakee'];
      $newposition = $_POST['position'];
      $oldposition = $newposition-1;

      $sql = "INSERT INTO swimming_play_type (id) VALUES ('NULL')";
      $result = $conn->query($sql);
      $res = $conn->insert_id;

      $sql2 = "INSERT INTO swimming_event_states (id, sequence_nr, time_elapsed, person_1, person_2, current_race_state, play_type_id, event_iden) VALUES ('NULL', '$sequence', '$time', '$person1', '$person2', '$state', '$res', '$event')";
      $result2 = $conn->query($sql2);

      $sql3 = "INSERT INTO swimming_overtake (new_position, old_position, play_type_overtake_id) VALUES ('$newposition', '$oldposition', '$res')";
      $result3 = $conn->query($sql3);


    }

    if (isset($_POST['finishBtn'])){
      $person = $_POST['person1'];
      $position = $_POST['position'];

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

      $sql = "INSERT INTO swimming_play_type (id) VALUES ('NULL')";
      $result = $conn->query($sql);
      $res = $conn->insert_id;

      $sql2 = "INSERT INTO swimming_event_states (id, sequence_nr, time_elapsed, person_1, person_2, current_race_state, play_type_id, event_iden) VALUES ('NULL', '$sequence', '$time', '$person', 'NULL', '$state', '$res', '$event')";
      $result2 = $conn->query($sql2);

      $sql3 = "INSERT INTO swimming_finish (points_gained, play_type_finish_id) VALUES ('$points', '$res')";
      $result3 = $conn->query($sql3);

    }

    if (isset($_POST['disqBtn'])){
      $person = $_POST['person1'];
      $reason = $_POST['reason'];

      $sql = "INSERT INTO swimming_play_type (id) VALUES ('NULL')";
      $result = $conn->query($sql);
      $res = $conn->insert_id;

      $sql2 = "INSERT INTO swimming_event_states (id, sequence_nr, time_elapsed, person_1, person_2, current_race_state, play_type_id, event_iden) VALUES ('NULL', '$sequence', '$time', '$person', 'NULL', '$state', '$res', '$event')";
      $result2 = $conn->query($sql2);

      $sql3 = "INSERT INTO swimming_disqualified (reason, play_type_disqualified_id) VALUES ('$reason', '$res');";
      $result3 = $conn->query($sql3);

    }
  }
?>
<script>
//this suppresses resubmission so that the form wont be resubmitted at refresh
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
</script>
