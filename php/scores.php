<!--COS221 PerfectStrangers-->
<!DOCTYPE html>

<head>

    <link rel="stylesheet" href="../css/scores.css">
    <link rel="stylesheet" href="../css/headfoot.css">
    <title>COS221 Prac 5</title>
    <script src= "../js/scores.js"></script>

</head>

<body onload="tournamentClick(), tournamentTableClick()">

    <?php
    include 'header.php';
    ?>
    <h1 class=headingPage id="heading">Scores</h1>
    <div class="mainBlock">
        <div class ="queriesBlock">
            <div class ="optionsBlock">
                <button id="tournamentBtn" class = "choiceQueryBtn" onclick="tournamentClick()">Add Tournament</button>
                <button id="eventBtn" class = "choiceQueryBtn" onclick="eventClick()">Add Event</button>
                <button id="eventStateBtn" class = "choiceQueryBtn" onclick="eventStateClick()">Add Event State</button>
            </div>
            <div class ="inputBlock">
                <div class="subdiv">
                    <div class ="stateOptionsBlock" id = "stateOptions">

                    </div>
                    <form method="POST" action="addscores.php" id="insertForm">
                        <div class="insertDiv" id = "dataDiv">

                        </div>
                    </form>
                </div>
            </div>
            <div class ="confirmBlock">
                <button class = "choiceQueryBtn" id="confirmBtn" name="confirmBtn" onclick="submitForm()">Confirm</button>
            </div>
        </div>
        <div class ="tableBlock">
            <div class ="optionsBlock">
                <button id="tournamentTableBtn" class = "choiceQueryBtn" onclick="tournamentTableClick()">Tournaments</button>
                <button id="eventTableBtn" class = "choiceQueryBtn" onclick="eventTableClick()">Events</button>
                <button id="eventStateTableBtn" class = "choiceQueryBtn" onclick="eventStateTableClick()">Event States</button>
            </div>

            <div class= "innerTableBlock" id="table">

            </div>
        </div>
    </div>

    <?php
        require ("footer.php");
    ?>

</body>

</html>
