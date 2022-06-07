<?php
include 'connect.php';
$graph = "SELECT id, points FROM swimming_team_stats ORDER BY points DESC LIMIT 10";
$result = $conn->query($graph);




?>