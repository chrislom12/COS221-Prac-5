<!--COS221 PerfectStrangers-->
<!DOCTYPE html>

<head>

    <link rel="stylesheet" href="../css/stats.css">
    <link rel="stylesheet" href="../css/headfoot.css">
    <title>COS221 Prac 5</title>
    <script src= "../js/stats.js"></script>
    <script type="text/javascript" src="../js/graph.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

</head>

<body onload="swimmerClick(), swimmerTableClick()">

    <?php
    include 'header.php';
    ?>
    <h1 class=headingPage id="heading">Statistics</h1>
    <div class="mainBlock">
        <div class ="queriesBlock">
            <div class ="optionsBlock">
                <button id="swimmerBtn" class = "choiceQueryBtn" onclick="swimmerClick()">Swimmer Stats</button>
                <button id="teamBtn" class = "choiceQueryBtn" onclick="teamClick()">Team Stats</button>
                <button id="eventBtn" class = "choiceQueryBtn" onclick="eventClick()">Event Stats</button>
            </div>
            <div class ="inputBlock">
                <div class="subdiv">
                     <form action="addstats.php" method="post" id="insertForm">
                        <div class="insertDiv" id = "dataDiv">

                        </div>
                    </form>
                </div>
            </div>
            <div class ="confirmBlock">
                <button class = "choiceQueryBtn" id="confirmBtn" onclick="submitForm()">Add Stats</button>
            </div>
        </div>
        <div class ="tableBlock">
            <div class ="optionsBlock">
                <button id="swimmerTableBtn" class = "choiceQueryBtn" onclick="swimmerTableClick()">View Swimmers</button>
                <button id="teamTableBtn" class = "choiceQueryBtn" onclick="teamTableClick()">View Teams</button>
                <button id="eventTableBtn" class = "choiceQueryBtn" onclick="eventTableClick()">View Events</button>
            </div>

            <div class= "innerTableBlock" id="table">

            </div>
        </div>
    </div>
    <div class="graph">
        
    </div>  

    <?php
        require ("footer.php");
    ?>

</body>

</html>
