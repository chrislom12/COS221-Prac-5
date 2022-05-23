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

    }
    else if($type == "teams"){
        
    }
    else if($type == "events"){
        
    }
    else if($type == "tournaments"){
        
    }
?>