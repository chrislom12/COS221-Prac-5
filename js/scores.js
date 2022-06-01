function tournamentClick() {
    //changes the input format and button styles to show selected button for insert
    var btnClicked = document.getElementById("tournamentBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("eventBtn").style.background = "#004e6d";
    document.getElementById("eventStateBtn").style.background = "#004e6d";
    document.getElementById("stateOptions").innerHTML = '';
    document.getElementById("dataDiv").innerHTML = '<br><div class="insertDiv" id = "dataDiv"><input type="hidden" id="torn" name="torn" value="tournament"><label for="name" id="nameLabel">Tournament Name</label><input type="text" placeholder="Enter Tournament Name" name="name" id="name" class="formInput" required><br><label for="start" id="startLabel">Start Date</label><input type="date" name="start" id="start" class="formInput" required><br><label for="end" id="endLabel">End Date</label><input type="date" name="end" id="end" class="formInput" required><br><label for="location" id="locationLabel">Location ID</label><input type="text" placeholder="Enter Location ID" name="location" id="location" class="formInput"><br><label for="winner" id="winnerLabel">Winning Team ID</label><input type="text" placeholder="Enter Winning Team ID" name="winner" id="winner" class="formInput"><br><br>';
}

function eventClick() {
    //changes the input format and button styles to show selected button
    var btnClicked = document.getElementById("eventBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("tournamentBtn").style.background = "#004e6d";
    document.getElementById("eventStateBtn").style.background = "#004e6d";
    document.getElementById("stateOptions").innerHTML = '';
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="addevent" name="addevent" value="event"><label for="event" id="eventLabel">Select an event</label><select name="event" id="event" class = "formInput"><option value="Butterfly">Butterfly</option><option value="Backstroke">Backstroke</option><option value="Breaststroke">Breaststroke</option><option value="Freestyle">Freestyle</option></select><br><label for="site" id="siteLabel">Site ID</label><input type="text" placeholder="Enter Site ID" name="site" id="site" class="formInput" required><br><label for="attendance" id="attendanceLabel">Number of Attendees</label><input type="text" placeholder="Attendance Number" name="attendance" id="attendance" class="formInput" required><br><label for="series" id="seriesLabel">Series Index</label><input type="text" placeholder="Enter Series Index" name="series" id="series" class="formInput" required><br>';
}

function eventStateClick() {
    //changes the input format and button styles to show selected button
    var btnClicked = document.getElementById("eventStateBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("tournamentBtn").style.background = "#004e6d";
    document.getElementById("eventBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<div class="insertDiv"><br><input type="hidden" id="eventState" name="eventState" value="eventState"><label for="event" id="eventLabel">Event ID</label><input type="text" placeholder="Enter Event ID" name="event" id="event" class="formInput"><br><label for="sequence" id="sequenceLabel">Sequence Number</label><input type="text" placeholder="Enter Sequence Number" name="sequence" id="sequence" class="formInput" ><br><label for="time" id="timeLabel">Time Elapsed</label><input id="time" name="time" type="time"><br><label for="raceState" id="raceStateLabel">Current Race State</label><select name="raceState" id="raceState" class = "formInput"><option value="before">before</option><option value="during">during</option><option value="after">after</option></select></div><br><div class="insertDiv" id = "stateDiv"></div><br>';

    document.getElementById("stateOptions").innerHTML = '<button id="startBtn" class = "stateBtn" onclick="startClick()">Start</button><button id="finishBtn" class = "stateBtn" onclick="finishClick()">Finish</button><button id="overtakeBtn" class = "stateBtn" onclick="overtakeClick()">Overtake</button><button id="disqBtn" class = "stateBtn" onclick="disqClick()">Disqualify</button>';
}

function submitForm() {
    /* insert validation */
    document.getElementById("insertForm").submit();

}

function startClick() {
    //changes the input format and button styles to show selected button for insert
    var btnClicked = document.getElementById("startBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("finishBtn").style.background = "#004e6d";
    document.getElementById("overtakeBtn").style.background = "#004e6d";
    document.getElementById("disqBtn").style.background = "#004e6d";
    document.getElementById("stateDiv").innerHTML = '<label for="person1" id="person1Label">Person ID</label><input type="text" placeholder="Enter Person 1 ID" name="person1" id="person1" class="formInput" ><br><label for="position" id="positionLabel">Position after start</label><select name="position" id="position" class = "formInput"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select>';
}

function finishClick() {
    //changes the input format and button styles to show selected button for insert
    var btnClicked = document.getElementById("finishBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("startBtn").style.background = "#004e6d";
    document.getElementById("overtakeBtn").style.background = "#004e6d";
    document.getElementById("disqBtn").style.background = "#004e6d";
    document.getElementById("stateDiv").innerHTML = '<label for="person1" id="person1Label">Person ID</label><input type="text" placeholder="Enter Person 1 ID" name="person1" id="person1" class="formInput" ><br><label for="position" id="positionLabel">Position after finish</label><select name="position" id="position" class = "formInput"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select>';
}

function overtakeClick() {
    //changes the input format and button styles to show selected button for insert
    var btnClicked = document.getElementById("overtakeBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("startBtn").style.background = "#004e6d";
    document.getElementById("finishBtn").style.background = "#004e6d";
    document.getElementById("disqBtn").style.background = "#004e6d";
    document.getElementById("stateDiv").innerHTML = '<label for="overtaker" id="overtakerLabel">Overtaker</label><input type="text" placeholder="Enter Person ID of Overtaker" name="overtaker" id="overtaker" class="formInput" ><br><label for="overtakee" id="overtakeeLabel">Overtakee</label><input type="text" placeholder="Enter Person ID of Overtakee" name="overtakee" id="overtakee" class="formInput" ><br><label for="position" id="positionLabel">New Position of Overtaker</label><select name="position" id="position" class = "formInput"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select>';
}

function disqClick() {
    //changes the input format and button styles to show selected button for insert
    var btnClicked = document.getElementById("disqBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("startBtn").style.background = "#004e6d";
    document.getElementById("finishBtn").style.background = "#004e6d";
    document.getElementById("overtakeBtn").style.background = "#004e6d";
    document.getElementById("stateDiv").innerHTML = '<label for="person1" id="person1Label">Disqualified Person ID</label><input type="text" placeholder="Enter Person ID" name="person1" id="person1" class="formInput" ><br><label for="reason" id="reasonLabel">Reason</label><input type="text" placeholder="Enter the Reason for DQ" name="reason" id="reason" class="formInput" >';
}

/*note to self: on click of button change include to php to change contents of tables  */

function tournamentTableClick() {
    var btnClicked = document.getElementById("tournamentTableBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("eventTableBtn").style.background = "#004e6d";
    document.getElementById("eventStateTableBtn").style.background = "#004e6d";
    /*     document.getElementById("table").innerHTML='<?php require ("tournamentsTable.php") ?>'; */
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "populateTable.php?type=tournament");
    xmlhttp.send();
}

function eventTableClick() {
    var btnClicked = document.getElementById("eventTableBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("tournamentTableBtn").style.background = "#004e6d";
    document.getElementById("eventStateTableBtn").style.background = "#004e6d";
    /*     document.getElementById("table").innerHTML='hello<?php require ("eventsTable.php"); ?>'; */
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "populateTable.php?type=event");
    xmlhttp.send();
}

function eventStateTableClick() {
    var btnClicked = document.getElementById("eventStateTableBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("tournamentTableBtn").style.background = "#004e6d";
    document.getElementById("eventTableBtn").style.background = "#004e6d";
    /*     document.getElementById("table").innerHTML='hello<?php require ("eventsTable.php"); ?>'; */
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "populateTable.php?type=eventState");
    xmlhttp.send();
}
