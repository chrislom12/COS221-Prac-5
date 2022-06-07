<?php


    if(isset($_REQUEST["type"])){
        $type = $_REQUEST["type"];
    }
    


    if($type == "all"){
        $dir_namep = "../img/persons/";
        $images = glob($dir_namep."*jpg");


        foreach($images as $image){
            
            echo '<div class="mainBlock">
                <div class="menuItem"
                    style="background-image: url(' . $image . ') !important; background-size: cover;">
                </div>
            </div>';
        }

        $dir_namet = "../img/teams/";
        $imagest = glob($dir_namet."*jpg");
  
        foreach($imagest as $imaget){
          echo '<div class="mainBlock">
              <div class="menuItem"
                  style="background-image: url(' . $imaget . ') !important; background-size: cover;">
              </div>
          </div>';
        }

        $dir_namee = "../img/Events/";
        $imagese = glob($dir_namee."*jpg");
  
        foreach($imagese as $imagee){
          echo '<div class="mainBlock">
              <div class="menuItem"
                  style="background-image: url(' . $imagee . ') !important; background-size: cover;">
              </div>
          </div>';
        }
    }
    else if($type == "people"){

      $dir_name = "../img/persons/";
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
        $dir_name = "../img/teams/";
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
        $dir_name = "../img/Events/";
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
