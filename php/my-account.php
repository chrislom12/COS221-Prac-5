<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="../css/headfoot.css">
    <title></title>                          
    <script src= "../js/login.js"></script>
</head>

<body>

    <?php
        require ("header.php");
        ?>

    
    <h1 class=headingPage id="heading">Welcome<?php if(isset($_SESSION['name']) AND isset($_SESSION['surname'])){echo ' '.$_SESSION['name']. ' ' . $_SESSION['surname'];}?>!</h1>
    
    
    <div id= "mainDiv" class="loginBlock">
        <div class="subdiv">
            <br>
            <a href="register.php"><button id="loginbtn" class="loginbtn" onclick="">Register</button></a>
            <br>
            <!-- implement log out below -->
            <a href="logout.php"><button id="loginbtn" type="submit" class="loginbtn" onclick="">Log out</button></a>
            <br>
        </div>
        
    </div>
    
      
    <?php
        require ("footer.php");
        ?>
</body>

</html>
