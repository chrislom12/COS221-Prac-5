<!--COS221 PerfectStrangers-->
<?php

    //get environment variables
    //MAKE SURE ENV VARIABLES ARE SET
    $server = getenv("SPORTS_DB_HOST");
    $username = getenv("SPORTS_DB_USERNAME");
    $password = getenv("SPORTS_DB_PASSWORD");
    $databasename = getenv("SPORTS_DB_NAME");

    //make connection
    $conn = mysqli_connect($server, $username, $password, $databasename);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } 

?>
