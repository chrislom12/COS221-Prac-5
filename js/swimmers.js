function insertClick() {
    //changes the input format and button styles to show selected button for insert
    var btnInsert = document.getElementById("insertBtn");
    btnInsert.style.background = "#003347";
    document.getElementById("updateBtn").style.background = "#004e6d";
    document.getElementById("deleteBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="type" name="type" value="insert"><label for="name" id="nameLabel">Name</label><input type="text" placeholder="Enter Name" name="name" id="name" class="formInput"><br><label for="surname" id="surnameLabel">Surname</label><input type="text" placeholder="Enter Surname" name="surname" id="surname" class="formInput"><br><label for="dob" id="dobLabel">Date of Birth</label><input type="date" name="dob" id="dob" class="formInput"><br><label for="team" id="teamLabel">Team ID</label><input type="text" placeholder="Enter Team ID" name="teamid" id="teamid" class="formInput"><br><label for="address" id="addressLabel">Address ID</label><input type="text" placeholder="Enter Address ID" name="address" id="address" class="formInput">';
}

function updateClick() {
    //changes the input format and button styles to show selected button
    var btnInsert = document.getElementById("updateBtn");
    btnInsert.style.background = "#003347";
    document.getElementById("insertBtn").style.background = "#004e6d";
    document.getElementById("deleteBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<div class="insertDiv" id = "dataDiv"><input type="hidden" id="type" name="type" value="update"><label for="update" id="updateLabel">What do you need updated?</label><select name="updateNeeded" id="updateNeeded" class = "formInput"><option value="name">Name</option><option value="surname">Surname</option><option value="team">Team ID</option><option value="address">Residence ID</option></select><br><label for="person" id="personLabel">Person ID</label><input type="text" placeholder="Enter the person ID" name="person" id="person" class="formInput"><br><label for="newVal" id="newValLabel">New Value</label><input type="text" placeholder="Enter the new value" name="newVal" id="newVal" class="formInput">';
}

function deleteClick() {
    //changes the input format and button styles to show selected button
    var btnInsert = document.getElementById("deleteBtn");
    btnInsert.style.background = "#003347";
    document.getElementById("updateBtn").style.background = "#004e6d";
    document.getElementById("insertBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="type" name="type" value="delete"><label for="delete" id="deleteLabel">Swimmer ID</label><input type="text" placeholder="Enter the Person ID to delete" name="delete" id="delete" class="formInput" required>';
}

function submitForm() {
    /* insert validation */
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "populateTable.php?type=team");
    xmlhttp.send();
    document.getElementById("insertForm").submit();
}

function tableClick() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "populateTable.php?type=swimmer");
    xmlhttp.send();
}