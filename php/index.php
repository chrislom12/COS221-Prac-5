<!--COS221 PerfectStrangers-->
<!DOCTYPE html>

<head>

    <link rel="stylesheet" href="../css/home.css">
    <link rel="stylesheet" href="../css/headfoot.css">
    <title>COS221 Prac 5</title>

</head>

<body>

    <?php
    include 'header.php';
    ?>

    <div class="mainBlock">
        <div class="menuBlock">

            <a href="teams.php" class="menuItem"
                style="background-image: url('../img/swimmers.png') !important; background-size: cover;">
                <h1 class=menuHead>Teams</h1>
                <p class="menuPar">Manage teams</p>
            </a>

            <a href="swimmers.php" class="menuItem"
                style="background-image: url('../img/swimmer (1).jpg') !important; background-size: cover;">
                <h1 class=menuHead>Swimmer</h1>
                <p class="menuPar">Manage swimmers</p>
            </a>


            <a href="locations.php" class="menuItem"
                style="background-image: url('../img/map.png') !important; background-size: cover;">
                <h1 class=menuHead>Locations</h1>
                <p class="menuPar">Manage addresses and locations</p>
            </a>


            

        </div>
    </div>
    <div class="mainBlock">
        <div class="menuBlock">

            <a href="scores.php" class="menuItem"
                style="background-image: url('../img/score.png') !important; background-size: cover;">
                <h1 class=menuHead>Scores</h1>
                <p class="menuPar">Captures scores for a tournament</p>
            </a>
            <a href="media.php" class="menuItem"
                style="background-image: url('../img/pool.png') !important; background-size: cover;">
                <h1 class=menuHead>Media</h1>
                <p class="menuPar">Upload media for a tournament or swimmer</p>
            </a>


            <a href="stats.php" class="menuItem"
                style="background-image: url('../img/stats.png') !important; background-size: cover;">
                <h1 class=menuHead>Statistics</h1>
                <p class="menuPar">View statistics for tournaments and swimmers</p>
            </a>


            
        </div>
    </div>
    <?php
        require ("footer.php");
    ?>

</body>

</html>
