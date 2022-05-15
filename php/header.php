<!--COS221 PerfectStrangers-->
<?php

    require_once 'connect.php';

?>
<header>
    <div class="containerNav">
        
        <img src="../img/logo.png" alt="logo" class="logo">
        
        <nav>
            <ul>
                <li><a href="home.php">Home</a></li>
                <?php
                    $temp = 0;/* if logged in */
                    if($temp==1){
                        echo "<li><a href=''>Log in</a></li>";
                    }
                    else if($temp!=1){
                        echo "<li><a href=''>My Account</a></li>";
                    }
                ?>
                <li><a href="teams.php">Teams</a></li>
                <li><a href="">Swimmers</a></li>
                <li><a href="">Locations</a></li>
                <li><a href="">Scores</a></li>
                <li><a href="">Media</a></li>
                <li><a href="">Statistics</a></li>
            </ul>
        </nav>

    </div>
</header>