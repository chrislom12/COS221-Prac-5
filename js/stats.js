function swimmerClick() {
    //changes the input format and button styles to show selected button for insert
    var btnClicked = document.getElementById("swimmerBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("eventBtn").style.background = "#004e6d";
    document.getElementById("teamBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="swim" name="swim" value="swim"><br><label for="person" id="personLabel">Person ID</label><input type="text" placeholder="Enter Person ID" name="person" id="person" class="formInput"><br><label for="event" id="eventLabel">Event ID</label><input type="text" placeholder="Enter Event ID" name="event" id="event" class="formInput"><br><label for="position" id="positionLabel">Finishing Position</label><select name="position" id="position" class = "formInput"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select><br><label for="time" id="timeLabel">Swim Time</label><input id="time" name="time" type="time"><br><label for="speed" id="speedLabel">Speed</label><input type="text" placeholder="Enter Speed" name="speed" id="speed" class="formInput"><br><label for="stroke" id="strokeLabel">Stroke count</label><input type="text" placeholder="Enter stroke count" name="stroke" id="stroke" class="formInput"><br><label for="heartRate" id="heartRateLabel">Average Heart Rate</label><input type="text" placeholder="Enter average heart rate" name="heartRate" id="heartRate" class="formInput"><br><label for="distanceStroke" id="distanceStrokeLabel">Stroke count</label><input type="text" placeholder="Enter distance per stroke" name="distanceStroke" id="distanceStroke" class="formInput"><br>';
}

function eventClick() {
    //changes the input format and button styles to show selected button
    var btnClicked = document.getElementById("eventBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("swimmerBtn").style.background = "#004e6d";
    document.getElementById("teamBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="event" name="event" value="event"><br><label for="eventID" id="eventIDLabel">Event ID</label><input type="text" placeholder="Enter Event ID" name="eventID" id="eventID" class="formInput"><br><label for="event" id="eventLabel">Select an event</label><select name="event" id="event" class = "formInput"><option value="Butterfly">Butterfly</option><option value="Backstroke">Backstroke</option><option value="Breaststroke">Breaststroke</option><option value="Freestyle">Freestyle</option></select><br><label for="numSwimmers" id="numSwimmersLabel">Number of Swimmers</label><select name="numSwimmers" id="numSwimmers" class = "formInput"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select><br><label for="numFinished" id="numFinishedLabel">Number of Swimmers Finished</label><select name="numFinished" id="numFinished" class = "formInput"><option value="1">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select><br><label for="distance" id="distanceLabel">Distance</label><input type="text" placeholder="Enter Distance in Meters" name="distance" id="distance" class="formInput"><br><label for="first" id="firstLabel">First</label><input type="text" placeholder="Enter Swimmer ID in First" name="first" id="first" class="formInput"><br><label for="second" id="secondLabel">Second</label><input type="text" placeholder="Enter Swimmer ID in Second" name="second" id="second" class="formInput"><br><label for="third" id="thirdLabel">Third</label><input type="text" placeholder="Enter Swimmer ID in Third" name="third" id="third" class="formInput"><br><label for="time" id="timeLabel">Race Time</label><input id="time" name="time" type="time"><br>';
}

function teamClick() {
    //changes the input format and button styles to show selected button
    var btnClicked = document.getElementById("teamBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("eventBtn").style.background = "#004e6d";
    document.getElementById("swimmerBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="team" name="team" value="team"><br><label for="teamID" id="teamIDLabel">Team ID</label><input type="text" placeholder="Enter Team ID" name="teamID" id="teamID" class="formInput"><br><label for="event" id="eventLabel">Event ID</label><input type="text" placeholder="Enter Event ID" name="event" id="event" class="formInput"><br><label for="pointsGained" id="pointsGainedLabel">Points Gained</label><input type="text" placeholder="Enter Points Gained" name="pointsGained" id="pointsGained" class="formInput"><br><label for="pointsMax" id="pointsMaxLabel">Points Gained</label><input type="text" placeholder="Enter Maximum Points Possible" name="pointsMax" id="pointsMax" class="formInput"><br><label for="bestTime" id="bestTimeLabel">Best Swim Time</label><input id="bestTime" name="bestTime" type="time"><br><label for="worstTime" id="worstTimeLabel">Swim Time</label><input id="worstTime" name="worstTime" type="time"><br>';
    
}

function submitForm() {
    /* insert validation */
    document.getElementById("insertForm").submit();
}

function swimmerTableClick() {
    var btnClicked = document.getElementById("swimmerTableBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("eventTableBtn").style.background = "#004e6d";
    document.getElementById("teamTableBtn").style.background = "#004e6d";
    /*     document.getElementById("table").innerHTML='<?php require ("tournamentsTable.php") ?>'; */
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "populateTable.php?type=swimmerStats");
    xmlhttp.send();
}

function eventTableClick() {
    var btnClicked = document.getElementById("eventTableBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("swimmerTableBtn").style.background = "#004e6d";
    document.getElementById("teamTableBtn").style.background = "#004e6d";
    /*     document.getElementById("table").innerHTML='hello<?php require ("eventsTable.php"); ?>'; */
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "populateTable.php?type=eventStats");
    xmlhttp.send();
}

function teamTableClick() {
    var btnClicked = document.getElementById("teamTableBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("swimmerTableBtn").style.background = "#004e6d";
    document.getElementById("eventTableBtn").style.background = "#004e6d";
    /*     document.getElementById("table").innerHTML='hello<?php require ("eventsTable.php"); ?>'; */
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "populateTable.php?type=teamStats");
    xmlhttp.send();
}
