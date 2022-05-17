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
    $_SESSION['loggedIn']="True";
    include ("home.php");
    echo '<script> alert("Logged In")</script>';
}else{
  
    include ("login.php");
    echo '<script> alert("INVALID CREDENTIALS")</script>';
}

?>

      
</body>

</html>