<!--COS221 PerfectStrangers-->
<!DOCTYPE html>

<head>

    <link rel="stylesheet" href="../css/teams.css">
    <link rel="stylesheet" href="../css/headfoot.css">
    <title>COS221 Prac 5</title>
    <script src= "../js/teams.js"></script>

</head>

<body onload="insertClick(), tableClick()">

    <?php
    include 'header.php';
    ?>
    <h1 class=headingPage id="heading">Teams</h1>
    <div class="mainBlock">
        <div class ="queriesBlock">
            <div class ="optionsBlock">
                <button id="insertBtn" class = "choiceQueryBtn" onclick="insertClick()">Add a Team</button>
                <button id="updateBtn" class = "choiceQueryBtn" onclick="updateClick()">Update a Team</button>
                <button id="deleteBtn" class = "choiceQueryBtn" onclick="deleteClick()">Delete a Team</button>
            </div>
            <div class ="inputBlock">
                <div class="subdiv">
                    <form action="teams-validate.php" method="post" id="insertForm">
                        <div class="insertDiv" id = "dataDiv">
                          
                        </div>
                    </form>
                </div>
            </div>
            <div class ="confirmBlock">
                <button class = "choiceQueryBtn" id="confirmBtn" onclick="submitForm()">Confirm</button>
            </div>
        </div>
        <div class ="tableBlock" id="table">

        </div>
    </div>

    <?php
        require ("footer.php");
    ?>

</body>

</html>
