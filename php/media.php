<!--COS221 PerfectStrangers-->
<!DOCTYPE html>

<head>

    <link rel="stylesheet" href="../css/media.css">
    <link rel="stylesheet" href="../css/headfoot.css">
    <title>COS221 Prac 5</title>
    <script src= "../js/media.js"></script>

</head>

<body onload="allClick()">

    <?php
    include 'header.php';
    ?>
    <h1 class=headingPage id="heading">Media Upload</h1>
    <div class="mainBlock">
        <div class ="queriesBlock">
        <div class ="optionsBlock">

            </div>
            <div class ="inputBlock">
                <div class="subdiv">
                    <form action="addImage.php" method="post" id="insertForm" enctype="multipart/form-data">
                        <div class="insertDiv" id = "dataDiv">
                        <input type="hidden" id="type" name="type" value="addImage">
                        <label for="imageType" id="imageTypeLabel">What are you uploading?</label>
                        <select name="imageType" id="imageType" class = "formInput">
                            <option value="Person">Person Image</option>
                            <option value="Team">Team Image</option>
                            <option value="Event">Event Image</option>
                        </select>
                        <br>
                        <label for="id" id="idLabel">Relevant ID</label>
                        <input type="text" placeholder="Person/Team/Event" name="id" id="id" class="formInput">
                        <br>
                        <label for="img">Select image:</label>
                        <input type="file" class="formInput"id="img" name="img" accept="image/*">
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
                <button id="allBtn" class = "choiceQueryBtn" onclick="allClick()">All</button>
                <button id="peopleBtn" class = "choiceQueryBtn" onclick="peopleClick()">People</button>
                <button id="teamsBtn" class = "choiceQueryBtn" onclick="teamsClick()">Teams</button>
                <button id="eventsBtn" class = "choiceQueryBtn" onclick="eventsClick()">Events</button>
                <button id="tournamentsBtn" class = "choiceQueryBtn" onclick="tournamentsClick()">Tournaments</button>
            </div>

            <div class= "innerTableBlock" id="table">
            <div class="mainBlock">


            <div class="menuItem"
                style="background-image: url('../img/swimmers.png') !important; background-size: cover;">
</div>


            <div  class="menuItem"
                style="background-image: url('../img/map.png') !important; background-size: cover;">
</div>


            <div class="menuItem"
                style="background-image: url('../img/score.png') !important; background-size: cover;">
</div>
</div>
<div class="mainBlock">


            <div class="menuItem"
                style="background-image: url('../img/swimmers.png') !important; background-size: cover;">
</div>


            <div  class="menuItem"
                style="background-image: url('../img/map.png') !important; background-size: cover;">
</div>


            <div class="menuItem"
                style="background-image: url('../img/score.png') !important; background-size: cover;">
</div>
</div>
        </div>
            </div>
        </div>
    </div>
    
    <?php
        require ("footer.php");
    ?>

</body>

</html>