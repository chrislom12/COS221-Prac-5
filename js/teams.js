function insertClick(){
    var btnInsert= document.getElementById("insertBtn");
    btnInsert.style.background="#003347";
    document.getElementById("updateBtn").style.background="#004e6d";
    document.getElementById("deleteBtn").style.background="#004e6d";
    document.getElementById("dataDiv").innerHTML='<input type="hidden" id="type" name="type" value="insert"><label for="name" id="nameLabel">Team Name</label><input type="text" placeholder="Enter Team Name" name="name" id="name" class="formInput" required><br><label for="publisher" id="publisherLabel">Publisher ID</label><input type="text" placeholder="Enter Publisher ID" name="publisher" id="publisher" class="formInput" required><br><label for="site" id="siteLabel">Home Site ID</label><input type="text" placeholder="Enter Home Site ID" name="site" id="site" class="formInput" required>';
}

function updateClick(){
    var btnInsert= document.getElementById("updateBtn");
    btnInsert.style.background="#003347";
    document.getElementById("insertBtn").style.background="#004e6d";
    document.getElementById("deleteBtn").style.background="#004e6d";
    document.getElementById("dataDiv").innerHTML='';
}

function deleteClick(){
    var btnInsert= document.getElementById("deleteBtn");
    btnInsert.style.background="#003347";
    document.getElementById("updateBtn").style.background="#004e6d";
    document.getElementById("insertBtn").style.background="#004e6d";
    document.getElementById("dataDiv").innerHTML='';
}