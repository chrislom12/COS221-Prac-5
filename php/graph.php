<?php
include 'connect.php';
$firstsql = "SELECT id, points FROM swimming_team_stats ORDER BY points DESC LIMIT 0,1";
$firstresult = $conn->query($firstsql);

$row1 = $firstresult->fetch_assoc();
$first = $row1['id'];


$secondsql = "SELECT id, points FROM swimming_team_stats ORDER BY points DESC LIMIT 1,1";
$secondresult = $conn->query($secondsql);

$row2 = $secondresult->fetch_assoc();
$second = $row2['id'];


$thirdsql = "SELECT id, points FROM swimming_team_stats ORDER BY points DESC LIMIT 2,1";
$thirdresult = $conn->query($thirdsql);

$row3 = $thirdresult->fetch_assoc();
$third = $row3['id'];


echo '<style> .graph {
    
  display: flex;
  background-color: white;
  border-radius: 20px;
  border-color: #fff;
  width: 60%;
  height: 500px;
  margin: auto;
  box-shadow: 10px 10px 47px -8px rgba(0, 0, 0, 0.75);
} 


</style>';


  echo '<style>
  
  .second {
    height: 240px;
    width: 250px;
    background-color: #1e468a;
    margin-top: 265px;
    margin-left: 20px;
    
  }

  .second p {
    margin-left: 90px;
    color: white;
    font-size:70px;
  }
  </style>
  <div class="second"><p>' . $second . '</p></div><br>';
  echo '<style>
  
  .first {
    height: 400px;
    width: 250px;
    background-color: #8a251e;
    margin-top: 100px;
    margin-left: 20px;
    
  }

  .first p {
    margin-left: 110px;
    color: white;
    font-size:70px;
  }
  </style>
  <div class="first"><p>' . $first . '</p></div><br>';

  echo '<style>
  
  .third {
    height: 150px;
    width: 250px;
    background-color: #8a611e;
    margin-top: 350px;
    margin-left: 20px;
    
  }

  .third p {
    margin-left: 90px;
    color: white;
    font-size:70px;
  }
  </style>
  <div class="third"><p>' . $third . '</p></div><br>';

  

?>