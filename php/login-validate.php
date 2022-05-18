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
        //require ("header.php");
        session_start();
        include ("connect.php");

        $email = $_POST["email"];
        $password = $_POST["pass"];

      $query = "Select * from users;";
        $result = $conn->query($query);
        $respassword = hash("sha256",$password);
        $valid = false;
        if($result->num_rows>0){
        while($row = $result->fetch_assoc()){
        if($row["email"]==$email&&$respassword == $row["password_hash"]){
            $valid = true;
            break;
        }
    }
}
if($valid == true){
    $_SESSION['loggedIn']="TRUE";
    //include ("home.php");
    //echo '<script> alert("Logged In")</script>';
   echo '<div id= "mainDiv" class="loginBlock">
   <div class="subdiv">
       <form action="login-validate.php" method="post" id="loginForm">
       <div class="loginDiv">
         <br>
         <label for="email" id="emailLabel">Logged In</label>
        <br>
         <a href = "home.php">Continue</a>
         <br>
       </div>       
     </form>
   </div>
   
</div>'; 

}else{

    echo '<div id= "mainDiv" class="loginBlock">
    <div class="subdiv">
        <form action="login-validate.php" method="post" id="loginForm">
        <div class="loginDiv">
          <br>
          <label for="email" id="emailLabel">Invalid</label>
         <br>
          <a href = "login.php">Try Again</a>
          <br>
        </div>       
      </form>
    </div>
    
 </div>'; 
   
}

?>

      
</body>

</html>