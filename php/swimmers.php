<!--COS221 PerfectStrangers-->
<!DOCTYPE html>

<head>

    <link rel="stylesheet" href="../css/swimmers.css">
    <link rel="stylesheet" href="../css/headfoot.css">
    <title>COS221 Prac 5</title>
    <script src= "../js/swimmers.js"></script>

</head>

<body onload="insertClick(), tableClick()">

    <?php
    include 'header.php';
    ?>
    <h1 class=headingPage id="heading">Swimmers</h1>
    <div class="mainBlock">
        <div class ="queriesBlock">
            <div class ="optionsBlock">
                <button id="insertBtn" class = "choiceQueryBtn" onclick="insertClick()">Add Swimmer</button>
                <button id="updateBtn" class = "choiceQueryBtn" onclick="updateClick()">Update Swimmer</button>
                <button id="deleteBtn" class = "choiceQueryBtn" onclick="deleteClick()">Delete Swimmer</button>
            </div>
            <div class ="inputBlock">
                <div class="subdiv">
                    <form action="swimmers-validate.php" method="post" id="insertForm">
                        <div class="insertDiv" id = "dataDiv">
                        <input type="hidden" id="type" name="type" value="update">
                        <label for="update" id="updateLabel">What do you need updated?</label>
                        <select name="updateNeeded" id="updateNeeded" class = "formInput">
                            <option value="name">Name</option>
                            <option value="surname">Surname</option>
                            <option value="team">Team ID</option>
                            <option value="address">Address ID</option>
                        </select>
                        <br>
                        <label for="person" id="personLabel">Person ID</label>
                        <input type="text" placeholder="Enter the person ID" name="person" id="person" class="formInput">
                        <br>
                        <label for="newVal" id="newValLabel">New Value</label>
                        <input type="text" placeholder="Enter the new value" name="newVal" id="newVal" class="formInput">
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