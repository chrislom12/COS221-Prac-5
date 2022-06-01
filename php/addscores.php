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


    // if (isset($_POST['startBtn'])){
    //   $person = $_POST['person1'];
    //   $position = $_POST['position'];
    //
    //   echo 'start';
    //
    //   // $sql = "INSERT INTO events (event_key, site_id, attendance, series_index) VALUES ('$event', '$site', '$attendance', '$series')";
    // }
    //
    // if (isset($_POST['overtakeBtn'])){
    //   $person1 = $_POST['overtaker'];
    //   $person2 = $_POST['overtakee'];
    //   $newposition = $_POST['position'];
    //   $oldposition = $newposition-1;
    //
    //   echo 'overtake';
    // }
    //
    // if (isset($_POST['finishBtn'])){
    //   $person = $_POST['person1'];
    //   $position = $_POST['position'];
    //
    //   echo 'finish';
    //
    // }
    //
    // if (isset($_POST['disqBtn'])){
    //   $person = $_POST['person1'];
    //   $reason = $_POST['reason'];
    //
    //   echo 'disq';
    //
    // }
  }
?>
<script>
//this suppresses resubmission so that the form wont be resubmitted at refresh
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
</script>
