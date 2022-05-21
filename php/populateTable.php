<?php

$type = $_REQUEST["type"];

if($type == "tournament")
{
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>tournaments</th>                  
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>tournaments</td>
        </tr>       
    </tbody>
</table>';

}
else if ($type == "event"){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>event</th>                  
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>event</td>
        </tr>       
    </tbody>
</table>';
}
else if($type == "eventState"){
    echo '<table class="content-table" id="table">
    <thead>
        <tr>
        <th>eventState</th>                  
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>eventState</td>
        </tr>       
    </tbody>
</table>';
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

?>