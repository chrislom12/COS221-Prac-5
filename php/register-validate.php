<?php
include "connect.php";
$name = "";
$surname = "";
$email = "";
$password = "";
$confirmPassword = "";
$canExecute = true;

if($_SERVER["REQUEST_METHOD"] == "POST")
{
    $name = $_POST["name"];
    $surname = $_POST["surname"];
    $email = $_POST["email"];
    $password = $_POST["pass"];
    $confirmPassword = $_POST["reppass"];
    
    if($name == '')
    {
        $canExecute = false;
        echo "<script type='text/javascript'>alert('Name Is Empty');window.location.href='register.php';</script>";
        echo "<meta http-equiv = 'refresh' content = '1; url = register.php' />"; 
    }
    
    if($surname == '')
    {
        $canExecute = false;
        echo "<script type='text/javascript'>alert('Surname Is Empty');window.location.href='register.php';</script>";
        echo "<meta http-equiv = 'refresh' content = '1; url = register.php' />";
    }
    
    if($email == '')
    {
        $canExecute = false;
        echo "<script type='text/javascript'>alert('Email Is Empty');window.location.href='register.php';</script>";
        echo "<meta http-equiv = 'refresh' content = '1; url = register.php' />";
    }
    
    if(!filter_var($email, FILTER_VALIDATE_EMAIL))
    {
        $canExecute = false;
        echo "<script type='text/javascript'>alert('Email is not in correct format');window.location.href='register.php';</script>";
        echo "<meta http-equiv = 'refresh' content = '1; url = register.php' />";
    }
    
    if($password == '')
    {
        $canExecute = false;
        echo "<script type='text/javascript'>alert('Password Is Empty');window.location.href='register.php';</script>";
        echo "<meta http-equiv = 'refresh' content = '1; url = register.php' />";
    }
    
    if(strlen($password) < 8)
    {
        $canExecute = false;
        echo "<script type='text/javascript'>alert('Passsword needs to be greater than 8 characters');window.location.href='register.php';</script>";
        echo "<meta http-equiv = 'refresh' content = '1; url = register.php' />";
    }
    
    if($confirmPassword == '')
    {
        $canExecute = false;
        echo "<script type='text/javascript'>alert('Confirm Password Is Empty');window.location.href='register.php';</script>";
        echo "<meta http-equiv = 'refresh' content = '1; url = register.php' />";
    }
    
    if($password !== $confirmPassword)
    {
        $canExecute = false;
        echo "<script type='text/javascript'>alert('Passwords Do Not Match');window.location.href='register.php';</script>";
        echo "<meta http-equiv = 'refresh' content = '1; url = register.php' />";
    }
    
    if($canExecute == true)
    {
        $hashedPassword = hash("sha256", $password);
    
        $sql = "SELECT* FROM users WHERE email LIKE '$email'";
        $result = $conn->query($sql);
        
        if ($result->num_rows > 0) 
        {
            echo "<meta http-equiv = 'refresh' content = '1; url = register.php' />"; 
            echo "<script type='text/javascript'>alert('User Already Exists');window.location.href='register.php';</script>";
        }
    
        else 
        {
            $sqlInsert = "INSERT INTO users(email, name, surname, password_hash) VALUES('$email', '$name', '$surname', '$hashedPassword');";
        
            if($conn->query($sqlInsert) === TRUE)
            {
                echo "<meta http-equiv = 'refresh' content = '1; url = login.php' />"; 
                echo "<script type='text/javascript'>alert('User Successfully Created');window.location.href='login.php';</script>";
            }
        
            else
            {
                echo "<meta http-equiv = 'refresh' content = '1; url = signup.php' />"; 
                echo "<script type='text/javascript'>alert('Error Creating User');window.location.href='register.php';</script>";
            }
        }
    }
}
?>