<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../css/login.css">
    <title></title>                          
    <script src= "../js/login.js"></script>
</head>

<body>

    <?php
        require ("header.php");
        ?>

    
    <h1 class=headingPage id="heading">Log In</h1>
    
    <div id= "mainDiv" class="loginBlock">
        <div class="subdiv">
            <form action="login-validate.php" method="post" id="loginForm">
            <div class="loginDiv">
              <br>
              <label for="email" id="emailLabel">Email</label>
              <input type="text" placeholder="Enter Email" name="email" id="email" class="formInput" required>
              <br>
              <label for="pass" id="passLabel">Password</label>
              <input type="password" placeholder="Enter Password" name="pass" id="pass" class="formInput" required>
              <br>
              <button id="loginbtn" type="submit" class="loginbtn" onclick="">Log In</button>
            </div>
            
            
              <p>Don't have an account? <a href="register.php">Register</a>.</p>
            
          </form>
        </div>
        
    </div>
    
      
    <?php
        require ("footer.php");
        ?>
</body>

</html>
