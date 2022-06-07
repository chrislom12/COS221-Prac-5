<?php
include 'connect.php';
$type = $_REQUEST["type"];

if($type == "tournament")
{
  $sql = "SELECT * FROM swimming_tournament";
  $result = $conn->query($sql);

  while ($rows = $result->fetch_assoc()){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>series_index</th>
        <th>start_date</th>
        <th>end_date</th>
        <th>location</th>
        <th>winner</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>' . $rows['series_index'] . '</td>
            <td>' .  $rows['start_date'] . '</td>
            <td>' . $rows['end_date'] . '</td>
            <td>' .  $rows['location'] . '</td>
            <td>' . $rows['winner'] . '</td>
        </tr>
    </tbody>
</table>';
  }




}
else if ($type == "event"){
  $sql = "SELECT * FROM events";
  $result = $conn->query($sql);

  while ($rows = $result->fetch_assoc()){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>id</th>
        <th>event_key</th>
        <th>publisher_id</th>
        <th>attendance</th>
        <th>last_update</th>
        <th>series_index</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>' . $rows['id'] . '</td>
            <td>' . $rows['event_key'] . '</td>
            <td>' .  $rows['publisher_id'] . '</td>
            <td>' . $rows['attendance'] . '</td>
            <td>' . $rows['last_update'] . '</td>
            <td>' . $rows['series_index'] . '</td>
        </tr>
    </tbody>
    </table>';

  }
}

else if($type == "eventState"){
  $sql = "SELECT * FROM swimming_event_states";
  $result = $conn->query($sql);

  while ($rows = $result->fetch_assoc()){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>id</th>
        <th>sequence_nr</th>
        <th>time_elapsed</th>
        <th>person1</th>
        <th>person2</th>
        <th>current_race_state</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>' . $rows['id'] . '</td>
            <td>' . $rows['sequence_nr'] . '</td>
            <td>' .  $rows['time_elapsed'] . '</td>
            <td>' . $rows['person_1'] . '</td>
            <td>' . $rows['person_2'] . '</td>
            <td>' . $rows['current_race_state'] . '</td>
        </tr>
    </tbody>
    </table>';

  }


}
else if($type=="team"){
  $sql = "SELECT * FROM teams";
  $result = $conn->query($sql);

  while ($rows = $result->fetch_assoc()){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>id</th>
        <th>team_key</th>
        <th>publisher_id</th>
        <th>home_site_id</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>' . $rows['id'] . '</td>
            <td>' . $rows['team_key'] . '</td>
            <td>' .  $rows['publisher_id'] . '</td>
            <td>' . $rows['home_site_id'] . '</td>
        </tr>
    </tbody>
    </table>';

  }
}
else if($type=="swimmer"){
  $sql = "SELECT * FROM persons";
  $result = $conn->query($sql);

  while ($rows = $result->fetch_assoc()){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>id</th>
        <th>person_key</th>
        <th>publisher_id</th>
        <th>DOB</th>
        <th>Residence</th>
        <th>Team id</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>' . $rows['id'] . '</td>
            <td>' . $rows['person_key'] . '</td>
            <td>' .  $rows['publisher_id'] . '</td>
            <td>' . $rows['birth_date'] . '</td>
            <td>' . $rows['residence_location_id'] . '</td>
            <td>' . $rows['team_id'] . '</td>
        </tr>
    </tbody>
    </table>';

  }
}
else if($type=="location"){
  $sql = "SELECT * FROM locations";
  $result = $conn->query($sql);

  while ($rows = $result->fetch_assoc()){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>id</th>
        <th>city</th>
        <th>state</th>
        <th>area</th>
        <th>country</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>' . $rows['id'] . '</td>
            <td>' . $rows['city'] . '</td>
            <td>' .  $rows['state'] . '</td>
            <td>' . $rows['area'] . '</td>
            <td>' . $rows['country'] . '</td>
        </tr>
    </tbody>
    </table>';

  }
}
else if($type=="address"){
  $sql = "SELECT * FROM addresses";
  $result = $conn->query($sql);

  while ($rows = $result->fetch_assoc()){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>id</th>
        <th>street</th>
        <th>street_number</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>' . $rows['id'] . '</td>
            <td>' . $rows['street'] . '</td>
            <td>' .  $rows['street_number'] . '</td>
        </tr>
    </tbody>
    </table>';

  }
}
else if($type=="swimmerStats"){
  $sql = "SELECT * FROM swimmer_stats";
  $result = $conn->query($sql);

  echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>id</th>
        <th>position</th>
        <th>speed</th>
        <th>points</th>
        <th>stroke_count</th>
        <th>swim_time</th>
        <th>avg_heartrate</th>
        <th>distance_per_stroke</th>
        <th>event_id</th>
        <th>person_id</th>
        </tr>
    </thead>';
      while ($rows = $result->fetch_assoc()){
        echo '<tr>
            <td>' . $rows['id'] . '</td>
            <td>' . $rows['position'] . '</td>
            <td>' .  $rows['speed'] . '</td>
            <td>' . $rows['points'] . '</td>
            <td>' . $rows['stroke_count'] . '</td>
            <td>' . $rows['swim_time'] . '</td>
            <td>' . $rows['avg_heartrate'] . '</td>
            <td>' .  $rows['distance_per_stroke'] . '</td>
            <td>' . $rows['event_identity'] . '</td>
            <td>' . $rows['person_identity'] . '</td>
        </tr>';
      }
      echo '
    </tbody>
    </table>';

 

}
else if($type=="teamStats"){
  $sql = "SELECT * FROM swimming_team_stats";
  $result = $conn->query($sql);


  while ($rows = $result->fetch_assoc()){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>id</th>
        <th>points</th>
        <th>max_points</th>
        <th>best_time</th>
        <th>worst_time</th>
        <th>event_id</th>
        <th>team_id</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>' . $rows['id'] . '</td>
            <td>' . $rows['points'] . '</td>
            <td>' .  $rows['max_points'] . '</td>
            <td>' . $rows['best_time'] . '</td>
            <td>' . $rows['worst_time'] . '</td>
            <td>' . $rows['event_id'] . '</td>
            <td>' . $rows['team_id'] . '</td>
        </tr>
    </tbody>
    </table>';

  }
}

else if($type=="eventStats"){
  $sql = "SELECT * FROM swimming_stats_of_events";
  $result = $conn->query($sql);

  while ($rows = $result->fetch_assoc()){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>id</th>
        <th>first_place</th>
        <th>second_place</th>
        <th>third_place</th>
        <th>no_swimmers</th>
        <th>swim_style</th>
        <th>distance</th>
        <th>no_finished</th>
        <th>race_time</th>
        <th>event_id</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>' . $rows['id'] . '</td>
            <td>' . $rows['first_place'] . '</td>
            <td>' .  $rows['second_place'] . '</td>
            <td>' . $rows['third_place'] . '</td>
            <td>' . $rows['no_swimmers'] . '</td>
            <td>' . $rows['swim_style'] . '</td>
            <td>' . $rows['distance'] . '</td>
            <td>' . $rows['no_finished'] . '</td>
            <td>' . $rows['race_time'] . '</td>
            <td>' . $rows['event_number'] . '</td>
        </tr>
    </tbody>
    </table>';

  }
}

else if($type=="site"){
  $sql = "SELECT * FROM sites";
  $result = $conn->query($sql);

  while ($rows = $result->fetch_assoc()){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>id</th>
        <th>site_key</th>
        <th>publisher_id</th>
        <th>location_id</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>' . $rows['id'] . '</td>
            <td>' . $rows['site_key'] . '</td>
            <td>' .  $rows['publisher_id'] . '</td>
            <td>' . $rows['location_id'] . '</td>
        </tr>
    </tbody>
    </table>';

  }
}


?>
