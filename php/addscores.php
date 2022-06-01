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


    // $sql = "INSERT INTO swimming_tournament (end_date, location, start_date, winner) VALUES ('$end_date', '$location', '$start_date', '$winner')";
    //
    // $result = $conn->query($sql);
  }

  //add event
  if (isset($_POST['addevent'])){
    $event = $_POST['event'];
    $site = $_POST['site'];
    $attendance = $_POST['attendance'];
    $series = $_POST['series'];

    //
    // $sql = "INSERT INTO events (event_key, site_id, attendance, series_index) VALUES ('$event', '$site', '$attendance', '$series')";
    //
    // $result = $conn->query($sql);
    //
    // $site = '';
    // $attendance = '';
    // $series = '';
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
