<?php
include 'connect.php';
$graph = "SELECT id, swim_time FROM swimmer_stats";
  $Rgraph = $conn->query($graph);
  $jsonarray = array();

  if ($Rgraph->num_rows > 0){
    while($row = $Rgraph->fetch_assoc()){
        $jsonitem = array(
            'lable' => $row['id'],
            'value' => $row['swim_time']
        );

        array_push($jsonarray, $jsonitem);
    }
  }
  
  echo json_encode($jsonarray);
  ?>