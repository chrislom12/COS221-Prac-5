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
        <th>end_date</th>
        <th>location</th>
        <th>start_date</th>
        <th>winner</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>' . $rows['series_index'] . '</td>
            <td>' . $rows['end_date'] . '</td>
            <td>' .  $rows['location'] . '</td>
            <td>' .  $rows['start_date'] . '</td>
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
        <th>publisher_id</th>
        <th>attendance</th>
        <th>last_update</th>
        <th>series_index</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>' . $rows['id'] . '</td>
            <td>' . $rows['sequence_nr'] . '</td>
            <td>' .  $rows['time_elapsed'] . '</td>
            <td>' . $rows['person1'] . '</td>
            <td>' . $rows['person2'] . '</td>
            <td>' . $rows['current_race_state'] . '</td>
        </tr>
    </tbody>
    </table>';

  }


}
else if($type=="team"){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>team</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>team</td>
        </tr>
    </tbody>
</table>';
}
else if($type=="swimmer"){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>swimmer</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>swimmer</td>
        </tr>
    </tbody>
</table>';
}
else if($type=="location"){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>location</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>location</td>
        </tr>
    </tbody>
</table>';
}
else if($type=="address"){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>address</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>address</td>
        </tr>
    </tbody>
</table>';
}
else if($type=="swimmerStats"){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>Swimmer Stats</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Swimmer Stats</td>
        </tr>
    </tbody>
</table>';
}
else if($type=="teamStats"){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>teamStats</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>teamStats</td>
        </tr>
    </tbody>
</table>';
}

else if($type=="eventStats"){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>eventStats</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>eventStats</td>
        </tr>
    </tbody>
</table>';
}

else if($type=="site"){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>site</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>site</td>
        </tr>
    </tbody>
</table>';
}


?>
