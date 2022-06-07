<?php


    if(isset($_REQUEST["type"])){
        $type = $_REQUEST["type"];
    }
    


    if($type == "all"){
        $counter=0;
        $dir_namep = "../img/persons/";
        $images = glob($dir_namep."*jpg");

        foreach($images as $image){
            $counter++;
            if($counter%3==1){
                echo '<div class="mainBlock">';
            }
            echo '
                <div class="menuItem"
                    style="background-image: url(' . $image . ') !important; background-size: cover;">
                </div>';
            if($counter%3==0){
                echo '</div>';
            }
        }

        $dir_namet = "../img/teams/";
        $imagest = glob($dir_namet."*jpg");
  
        foreach($imagest as $imaget){
            $counter++;
            if($counter%3==1){
                echo '<div class="mainBlock">';
            }
          echo '
              <div class="menuItem"
                  style="background-image: url(' . $imaget . ') !important; background-size: cover;">
              </div>';
            if($counter%3==0){
                echo '</div>';
            }
        }

        $dir_namee = "../img/Events/";
        $imagese = glob($dir_namee."*jpg");
  
        foreach($imagese as $imagee){
            $counter++;
            if($counter%3==1){
                echo '<div class="mainBlock">';
            }
          echo '
              <div class="menuItem"
                  style="background-image: url(' . $imagee . ') !important; background-size: cover;">
              </div>';

            if($counter%3==0){
                echo '</div>';
            }
        }
        if($counter%3!=0){
            echo '</div>';      
        }

    }
    else if($type == "people"){

        $counter=0;
        $dir_namep = "../img/persons/";
        $images = glob($dir_namep."*jpg");

        foreach($images as $image){
            $counter++;
            if($counter%3==1){
                echo '<div class="mainBlock">';
            }
            echo '
                <div class="menuItem"
                    style="background-image: url(' . $image . ') !important; background-size: cover;">
                </div>';
            if($counter%3==0){
                echo '</div>';
            }
        }
      
    }
    else if($type == "teams"){
        $counter=0;
        $dir_namet = "../img/teams/";
        $imagest = glob($dir_namet."*jpg");
  
        foreach($imagest as $imaget){
            $counter++;
            if($counter%3==1){
                echo '<div class="mainBlock">';
            }
          echo '
              <div class="menuItem"
                  style="background-image: url(' . $imaget . ') !important; background-size: cover;">
              </div>';
            if($counter%3==0){
                echo '</div>';
            }
        }
    }
    else if($type == "events"){
        $counter=0;
        $dir_namee = "../img/Events/";
        $imagese = glob($dir_namee."*jpg");
  
        foreach($imagese as $imagee){
            $counter++;
            if($counter%3==1){
                echo '<div class="mainBlock">';
            }
          echo '
              <div class="menuItem"
                  style="background-image: url(' . $imagee . ') !important; background-size: cover;">
              </div>';

            if($counter%3==0){
                echo '</div>';
            }
        }
        if($counter%3!=0){
            echo '</div>';      
        }

    }

?>
