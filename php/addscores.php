<?php
//check value of each hidden element instead
function addScores($conn){
  //add tournament
  if (isset($_POST['torn'])){
    echo "home.php";
    // $start_date = $_POST['start'];
    // $end_date = $_POST['end'];
    // $name = $_POST['name'];
    // $location = $_POST['location'];
    // $winner = $_POST['winner'];
    //
    // $sql = "INSERT INTO test (name) VALUES ($name)";
    // $sql = "INSERT INTO swimming_tournament (series_index, end_date, location, start_date, winner) VALUES ($name, $end_date, $location, $start_date, $winner)";
    //
    // $result = $conn->query($sql);
    //
    // $name = '';
    // $location = '';
    // $winner = '';
  }
  else{
    echo "media.php";
  }
//   //add event
//   if (isset($_POST['addevent'])){
//     $event = $_POST['event'];
//     $site = $_POST['site'];
//     $attendance = $_POST['attendance'];
//     $series = $_POST['series'];
//
//
//
//     $sql = "INSERT INTO events (event_key, site_id, attendance, series_index) VALUES ('$event', '$site', '$attendance', '$series')";
//
//     $result = $conn->query($sql);
//
//     $site = '';
//     $attendance = '';
//     $series = '';
//   }
//
//
// //add state
//   if (isset($_POST['eventState'])){
//     $event = $_POST['event'];
//     $sequence = $_POST['sequence'];
//     $time = $_POST['time'];
//     $state = $_POST['raceState'];
//
//     if (isset($_POST['startBtn'])){
//       $person = $_POST['person1'];
//       $position = $_POST['position'];
//
//       $sql = "INSERT INTO events (event_key, site_id, attendance, series_index) VALUES ('$event', '$site', '$attendance', '$series')";
//     }
//
//     if (isset($_POST['overtakeBtn'])){
//       $person1 = $_POST['overtaker'];
//       $person2 = $_POST['overtakee'];
//       $newposition = $_POST['position'];
//       $oldposition = $newposition-1;
//     }
//
//     if (isset($_POST['finishBtn'])){
//       $person = $_POST['person1'];
//       $position = $_POST['position'];
//     }
//
//     if (isset($_POST['disqBtn'])){
//       $person = $_POST['person1'];
//       $reason = $_POST['reason'];
//     }
//   }


}
