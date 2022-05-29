<!--COS221 PerfectStrangers-->
<!DOCTYPE html>

<head>

    <link rel="stylesheet" href="../css/stats.css">
    <link rel="stylesheet" href="../css/headfoot.css">
    <title>COS221 Prac 5</title>
    <script src= "../js/stats.js"></script>

</head>

<body onload="swimmerClickz(), swimmerTableClickz()">

    <?php
    include 'header.php';
    ?>
    <h1 class=headingPage id="heading">Statistics</h1>
    <div class="mainBlock">
        <div class ="queriesBlock">
            <div class ="optionsBlock">
                <button id="swimmerBtn" class = "choiceQueryBtn" onclick="swimmerClick()">Add Swimmer Stats</button>
                <button id="teamBtn" class = "choiceQueryBtn" onclick="teamClick()">Add Team Stats</button>
            </div>
            <div class ="inputBlock">
                <div class="subdiv">
                    <div class ="stateOptionsBlock" id = "stateOptions">
                    '<br>
                    <div class="insertDiv" id = "dataDiv">
                        <input type="hidden" id="swimLabel" name="swim" value="swim">
                        <label for="person" id="person">Person ID</label>
                        <input type="text" placeholder="Enter Person ID" name="person" id="person" class="formInput">
                        <br>
                        <label for="event" id="eventLabel">Event ID</label>
                        <input type="text" placeholder="Enter Event ID" name="event" id="event" class="formInput">
                        <br>
                        <label for="position" id="positionLabel">Finishing Position</label>
                        <select name="position" id="position" class = "formInput">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                        </select>
                        <label for="speed" id="speedLabel">Speed</label>
                        <input type="text" placeholder="Enter Speed" name="speed" id="speed" class="formInput">
                        <br>
                        <label for="stroke" id="strokeLabel">Stroke count</label>
                        <input type="text" placeholder="Enter stroke count" name="stroke" id="stroke" class="formInput">
                        <br>
                        <label for="heartRate" id="heartRateLabel">Average Heart Rate</label>
                        <input type="text" placeholder="Enter average heart rate" name="heartRate" id="heartRate" class="formInput">
                        <br>
                        <label for="start" id="startLabel">Start Date</label>
                        <input type="date" name="start" id="start" class="formInput" required>
                        <br>
                        <label for="end" id="endLabel">End Date</label>
                        <input type="date" name="end" id="end" class="formInput" required>
                        <br>
                        <label for="location" id="locationLabel">Location ID</label>
                        <input type="text" placeholder="Enter Location ID" name="location" id="location" class="formInput">
                        <br>
                        <label for="winner" id="winnerLabel">Winning Team ID</label>
                        <input type="text" placeholder="Enter Winning Team ID" name="winner" id="winner" class="formInput">
                        <br><br>
                    </div>
                    <form action="" method="post" id="insertForm">
                        <div class="insertDiv" id = "dataDiv">

                        </div>
                    </form>
                </div>
            </div>
            <div class ="confirmBlock">
                <button class = "choiceQueryBtn" id="confirmBtn" onclick="submitForm()">Confirm</button>
            </div>
        </div>
        <div class ="tableBlock">
            <div class ="optionsBlock">
                <button id="swimmerTableBtn" class = "choiceQueryBtn" onclick="swimmerTableClick()">swimmers</button>
                <button id="teamTableBtn" class = "choiceQueryBtn" onclick="teamTableClick()">teams</button>
                <button id="teamStateTableBtn" class = "choiceQueryBtn" onclick="teamStateTableClick()">team States</button>
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
