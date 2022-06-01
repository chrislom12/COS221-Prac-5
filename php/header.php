<!--COS221 PerfectStrangers-->
<?php

    require_once 'connect.php';

?>
<header>
    <div class="containerNav">

        <img src="../img/logo.png" alt="logo" class="logo">

        <nav>
            <ul>
                <li><a href="index.php">Home</a></li>
                <?php
                    session_start();
                    $temp = 0;/* if logged in */
                    if(isset($_SESSION['loggedIn'])){
                        if($_SESSION['loggedIn']=="TRUE"){
                            $temp=1;
                        }
                    }
                    if($temp==1){
                        echo "<li><a href='my-account.php'>My Account</a></li>";
                    }
                    else if($temp!=1){
                        echo "<li><a href='login.php'>Log In</a></li>";
                    }
                ?>
                <li><a href="teams.php">Teams</a></li>
                <li><a href="swimmers.php">Swimmers</a></li>
                <li><a href="locations.php">Locations</a></li>
                <li><a href="scores.php">Scores</a></li>
                <li><a href="media.php">Media</a></li>
                <li><a href="stats.php">Statistics</a></li>
            </ul>
        </nav>

    </div>
</header>
