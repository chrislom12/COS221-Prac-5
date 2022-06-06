<?php


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

      $dir_name = "../img/persons";
      $images = glob($dir_name."*jpg");

      foreach($images as $image){
        echo '<div class="mainBlock">
            <div class="menuItem"
                style="background-image: url(' . $image . ') !important; background-size: cover;">
            </div>
        </div>';
      }
      


    }
    else if($type == "teams"){
        $dir_name = "../img/teams";
        $images = glob($dir_name."*jpg");
  
        foreach($images as $image){
          echo '<div class="mainBlock">
              <div class="menuItem"
                  style="background-image: url(' . $image . ') !important; background-size: cover;">
              </div>
          </div>';
        }

    }
    else if($type == "events"){
        $dir_name = "../img/Events";
        $images = glob($dir_name."*jpg");
  
        foreach($images as $image){
          echo '<div class="mainBlock">
              <div class="menuItem"
                  style="background-image: url(' . $image . ') !important; background-size: cover;">
              </div>
          </div>';
        }

    }

?>
