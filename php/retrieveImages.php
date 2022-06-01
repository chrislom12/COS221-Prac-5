<?php
include 'connect.php';

    if(isset($_REQUEST["type"])){
        $type = $_REQUEST["type"];
    }


    if($type == "all"){
        echo ('<div class="mainBlock">


        <div class="menuItem"
            style="background-image: url(\'../img/swimmers.png\') !important; background-size: cover;">
        </div>


        <div  class="menuItem"
            style="background-image: url(\'../img/map.png\') !important; background-size: cover;">
        </div>


        <div class="menuItem"
            style="background-image: url(\'../img/score.png\') !important; background-size: cover;">
        </div>
</div>
<div class="mainBlock">


        <div class="menuItem"
            style="background-image: url(\'../img/swimmers.png\') !important; background-size: cover;">
        </div>


        <div  class="menuItem"
            style="background-image: url(\'../img/map.png\') !important; background-size: cover;">
        </div>

</div>');
    }
    else if($type == "people"){

      $sql = "SELECT media_type FROM media";
      $result = $conn->query($sql);

        while ($rows = $result->fetch_assoc()){
          echo ('<div class="mainBlock">


          <div class="menuItem"
              style="background-image: url(' . $rows['media_type'] . ') !important; background-size: cover;">
          </div>
          </div>';
        }

    }
    else if($type == "teams"){
      $sql = "SELECT media_type FROM media";
      $result = $conn->query($sql);

        while ($rows = $result->fetch_assoc()){
          echo ('<div class="mainBlock">


          <div class="menuItem"
              style="background-image: url(' . $rows['media_type'] . ') !important; background-size: cover;">
          </div>
          </div>';
        }

    }
    else if($type == "events"){
      $sql = "SELECT media_type FROM media";
      $result = $conn->query($sql);

        while ($rows = $result->fetch_assoc()){
          echo ('<div class="mainBlock">


          <div class="menuItem"
              style="background-image: url(' . $rows['media_type'] . ') !important; background-size: cover;">
          </div>
          </div>';
        }

    }

?>
