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
        $name = '';
        $surname = '';

        $query = "Select * from users;";
        $result = $conn->query($query);
        $respassword = hash("sha256",$password);
        $valid = false;
        if($result->num_rows>0){
        while($row = $result->fetch_assoc()){
        if($row["email"]==$email&&$respassword == $row["password_hash"]){
            $valid = true;
            $name = $row['name'];
            $surname = $row['surname'];
            break;
        }
    }
}
if($valid == true){
    $_SESSION['loggedIn']="TRUE";
    $_SESSION['name']=$name;
    $_SESSION['surname']=$surname;

    $query = "Select * from publishers;";
    $result = $conn->query($query);

    if($result->num_rows>0){
      while($row = $result->fetch_assoc()){
      if($row["publisher_name"]==$name){
        $_SESSION['PubID']= $row["publisher_key"];
          break;
      }
  }
}

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