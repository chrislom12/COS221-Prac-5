function insertClick(){
        //changes the input format and button styles to show selected button
    var btnInsert= document.getElementById("insertBtn");
    btnInsert.style.background="#003347";
    document.getElementById("updateBtn").style.background="#004e6d";
    document.getElementById("deleteBtn").style.background="#004e6d";
    document.getElementById("dataDiv").innerHTML='<input type="hidden" id="type" name="type" value="insert"><label for="name" id="nameLabel">Team Name</label><input type="text" placeholder="Enter Team Name" name="name" id="name" class="formInput" required><br><label for="publisher" id="publisherLabel">Publisher ID</label><input type="text" placeholder="Enter Publisher ID" name="publisher" id="publisher" class="formInput" required><br><label for="site" id="siteLabel">Home Site ID</label><input type="text" placeholder="Enter Home Site ID" name="site" id="site" class="formInput" required>';
}

function updateClick(){
        //changes the input format and button styles to show selected button
    var btnInsert= document.getElementById("updateBtn");
    btnInsert.style.background="#003347";
    document.getElementById("insertBtn").style.background="#004e6d";
    document.getElementById("deleteBtn").style.background="#004e6d";
    document.getElementById("dataDiv").innerHTML='<input type="hidden" id="type" name="type" value="update"><label for="update" id="updateLabel">What do you need updated?</label><select name="updateNeeded" id="updateNeeded" class = "formInput"><option value="name">Team Name</option><option value="site">Team Home Site ID</option><option value="publisher">Team Publisher ID</option></select><br><label for="currVal" id="currValLabel">Current Value</label><input type="text" placeholder="Enter the current value" name="currVal" id="currVal" class="formInput" required><br><label for="newVal" id="newValLabel">New Value</label><input type="text" placeholder="Enter the new value" name="newVal" id="newVal" class="formInput" required>';
}

function deleteClick(){
    //changes the input format and button styles to show selected button
    var btnInsert= document.getElementById("deleteBtn");
    btnInsert.style.background="#003347";
    document.getElementById("updateBtn").style.background="#004e6d";
    document.getElementById("insertBtn").style.background="#004e6d";
    document.getElementById("dataDiv").innerHTML='<input type="hidden" id="type" name="type" value="delete"><label for="delete" id="deleteLabel">Team ID</label><input type="text" placeholder="Enter the team ID to delete" name="delete" id="delete" class="formInput" required>';
}

function submitForm(){
    /* insert validation */
    document.getElementById("insertForm").submit();
}