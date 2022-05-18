<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../css/register.css">
    <link rel="stylesheet" href="../css/headfoot.css">
    <title></title>                          
    <script src= "../js/register.js"></script>
</head>

<body>

    <?php
        require ("header.php");
        ?>

    
    <h1 class=headingPage id="heading">Register</h1>
    
    <div id= "mainDiv" class="regBlock">
        <div class="subdiv">
            <form action="register-validate.php" method="post" id="regForm">
            <div class="regDiv">
              <br>
              <label for="name" id="nameLabel">Name</label>
              <input type="text" placeholder="Enter Name" name="name" id="name" class="formInput" required>
              <br>
              <label for="surname" id="surnameLabel">Surname</label>
              <input type="text" placeholder="Enter Surame" name="surname" id="surname" class="formInput" required>
              <br>
              <label for="email" id="emailLabel">Email</label>
              <input type="text" placeholder="Enter Email" name="email" id="email" class="formInput" required>
              <br>
              <label for="pass" id="passLabel">Password</label>
              <input type="password" placeholder="Enter Password" name="pass" id="pass" class="formInput" required>
              <br>
              <label for="reppass" id="reppassLabel">Repeat Password</label>
              <input type="password" placeholder="Repeat Password" name="reppass" id="reppass" class="formInput" required>
              <br>
              <button id="regbtn" type="submit" class="registerbtn" onclick="">Register</button>
            </div>
            
            
              <p>Already have an account? <a href="login.php">Log In</a>.</p>
            
          </form>
        </div>
        
    </div>
    
      
    <?php
        require ("footer.php");
        ?>
</body>

</html>
