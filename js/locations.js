function insertLocationClick() {
    //changes the input format and button styles to show selected button for insert
    var btnInsert = document.getElementById("insertLBtn");
    btnInsert.style.background = "#003347";
    document.getElementById("updateABtn").style.background = "#004e6d";
    document.getElementById("deleteABtn").style.background = "#004e6d";
    document.getElementById("updateLBtn").style.background = "#004e6d";
    document.getElementById("deleteLBtn").style.background = "#004e6d";
    document.getElementById("insertABtn").style.background = "#004e6d";
    document.getElementById("updateSBtn").style.background = "#004e6d";
    document.getElementById("deleteSBtn").style.background = "#004e6d";
    document.getElementById("insertSBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<div class="insertDiv" id = "dataDiv"><input type="hidden" id="type" name="type" value="addLocation"><label for="city" id="cityLabel">City</label><input type="text" placeholder="Enter the City" name="city" id="city" class="formInput"><br><label for="state" id="stateLabel">State/Province</label><input type="text" placeholder="Enter the state/province" name="state" id="state" class="formInput"><br><label for="area" id="areaLabel">Area</label><input type="text" placeholder="Enter the area" name="area" id="area" class="formInput"><br><label for="country" id="countryLabel">Country</label><input type="text" placeholder="Enter the Country" name="country" id="country" class="formInput"><br>';
}

function updateLocationClick() {
    //changes the input format and button styles to show selected button
    var btnInsert = document.getElementById("updateLBtn");
    btnInsert.style.background = "#003347";
    document.getElementById("updateABtn").style.background = "#004e6d";
    document.getElementById("deleteABtn").style.background = "#004e6d";
    document.getElementById("insertLBtn").style.background = "#004e6d";
    document.getElementById("deleteLBtn").style.background = "#004e6d";
    document.getElementById("insertLBtn").style.background = "#004e6d";
    document.getElementById("updateSBtn").style.background = "#004e6d";
    document.getElementById("deleteSBtn").style.background = "#004e6d";
    document.getElementById("insertSBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="type" name="type" value="updateLocation"><label for="update" id="updateLabel">What do you need updated?</label><select name="updateNeeded" id="updateNeeded" class = "formInput"><option value="city">City</option><option value="state">State/Province</option><option value="area">Area</option><option value="country">Country</option></select><br><label for="location" id="locationLabel">Location ID</label><input type="text" placeholder="Enter the location ID" name="location" id="location" class="formInput"><br><label for="newVal" id="newValLabel">New Value</label><input type="text" placeholder="Enter the new value" name="newVal" id="newVal" class="formInput"><br>';
}

function deleteLocationClick() {
    //changes the input format and button styles to show selected button
    var btnInsert = document.getElementById("deleteLBtn");
    btnInsert.style.background = "#003347";
    document.getElementById("updateABtn").style.background = "#004e6d";
    document.getElementById("deleteABtn").style.background = "#004e6d";
    document.getElementById("updateLBtn").style.background = "#004e6d";
    document.getElementById("insertABtn").style.background = "#004e6d";
    document.getElementById("insertLBtn").style.background = "#004e6d";
    document.getElementById("updateSBtn").style.background = "#004e6d";
    document.getElementById("deleteSBtn").style.background = "#004e6d";
    document.getElementById("insertSBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="type" name="type" value="deleteLocation"><label for="delete" id="deleteLabel">Location ID</label><input type="text" placeholder="Enter the location ID to delete" name="delete" id="delete" class="formInput">';
}

function insertAddressClick() {
    //changes the input format and button styles to show selected button for insert
    var btnInsert = document.getElementById("insertABtn");
    btnInsert.style.background = "#003347";
    document.getElementById("updateABtn").style.background = "#004e6d";
    document.getElementById("deleteABtn").style.background = "#004e6d";
    document.getElementById("updateLBtn").style.background = "#004e6d";
    document.getElementById("deleteLBtn").style.background = "#004e6d";
    document.getElementById("insertLBtn").style.background = "#004e6d";
    document.getElementById("updateSBtn").style.background = "#004e6d";
    document.getElementById("deleteSBtn").style.background = "#004e6d";
    document.getElementById("insertSBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="type" name="type" value="addAddress"><label for="streetName" id="streetNameLabel">Street Name</label><input type="text" placeholder="Enter the Street" name="streetName" id="streetName" class="formInput"><br><label for="streetNum" id="streetNumLabel">Street Name</label><input type="text" placeholder="Enter the Street Nr." name="streetNum" id="streetNum" class="formInput"><br>';
}

function updateAddressClick() {
    //changes the input format and button styles to show selected button
    var btnInsert = document.getElementById("updateABtn");
    btnInsert.style.background = "#003347";
    document.getElementById("insertABtn").style.background = "#004e6d";
    document.getElementById("deleteABtn").style.background = "#004e6d";
    document.getElementById("updateLBtn").style.background = "#004e6d";
    document.getElementById("deleteLBtn").style.background = "#004e6d";
    document.getElementById("insertLBtn").style.background = "#004e6d";
    document.getElementById("updateSBtn").style.background = "#004e6d";
    document.getElementById("deleteSBtn").style.background = "#004e6d";
    document.getElementById("insertSBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="type" name="type" value="updateAddress"><label for="update" id="updateLabel">What do you need updated?</label><select name="updateNeeded" id="updateNeeded" class = "formInput"><option value="streetName">Street Name</option><option value="streetNum">Street Number</option></select><br><label for="address" id="addressLabel">Address ID</label><input type="text" placeholder="Enter the address ID" name="address" id="address" class="formInput"><br><label for="newVal" id="newValLabel">New Value</label><input type="text" placeholder="Enter the new value" name="newVal" id="newVal" class="formInput"><br>';
}

function deleteAddressClick() {
    //changes the input format and button styles to show selected button
    var btnInsert = document.getElementById("deleteABtn");
    btnInsert.style.background = "#003347";
    document.getElementById("updateABtn").style.background = "#004e6d";
    document.getElementById("insertABtn").style.background = "#004e6d";
    document.getElementById("updateLBtn").style.background = "#004e6d";
    document.getElementById("deleteLBtn").style.background = "#004e6d";
    document.getElementById("insertLBtn").style.background = "#004e6d";
    document.getElementById("updateSBtn").style.background = "#004e6d";
    document.getElementById("deleteSBtn").style.background = "#004e6d";
    document.getElementById("insertSBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="type" name="type" value="deleteAddress"><label for="delete" id="deleteLabel">Address ID</label><input type="text" placeholder="Enter the address ID to delete" name="delete" id="delete" class="formInput"><br>';
}

function insertSiteClick() {
    //changes the input format and button styles to show selected button for insert
    var btnInsert = document.getElementById("insertSBtn");
    btnInsert.style.background = "#003347";
    document.getElementById("updateABtn").style.background = "#004e6d";
    document.getElementById("deleteABtn").style.background = "#004e6d";
    document.getElementById("updateLBtn").style.background = "#004e6d";
    document.getElementById("deleteLBtn").style.background = "#004e6d";
    document.getElementById("insertLBtn").style.background = "#004e6d";
    document.getElementById("updateSBtn").style.background = "#004e6d";
    document.getElementById("deleteSBtn").style.background = "#004e6d";
    document.getElementById("insertABtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="type" name="type" value="addSite"><label for="site" id="siteLabel">Site Name</label><input type="text" placeholder="Enter the Site Name" name="site" id="site" class="formInput"><br><label for="location" id="locationLabel">Location ID</label><input type="text" placeholder="Enter the Location ID" name="location" id="location" class="formInput"><br>';
}

function updateSiteClick() {
    //changes the input format and button styles to show selected button
    var btnInsert = document.getElementById("updateSBtn");
    btnInsert.style.background = "#003347";
    document.getElementById("insertABtn").style.background = "#004e6d";
    document.getElementById("deleteABtn").style.background = "#004e6d";
    document.getElementById("updateLBtn").style.background = "#004e6d";
    document.getElementById("deleteLBtn").style.background = "#004e6d";
    document.getElementById("insertLBtn").style.background = "#004e6d";
    document.getElementById("updateABtn").style.background = "#004e6d";
    document.getElementById("deleteSBtn").style.background = "#004e6d";
    document.getElementById("insertSBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<input type="hidden" id="type" name="type" value="updateSite"><label for="update" id="updateLabel">What do you need updated?</label><select name="updateNeeded" id="updateNeeded" class = "formInput">    <option value="site">Site Name</option>    <option value="location">Location ID</option></select><br><label for="site" id="siteLabel">Site ID</label><input type="text" placeholder="Enter the site ID" name="site" id="site" class="formInput"><br><label for="newVal" id="newValLabel">New Value</label><input type="text" placeholder="Enter the new value" name="newVal" id="newVal" class="formInput"><br>';
}

function deleteSiteClick() {
    //changes the input format and button styles to show selected button
    var btnInsert = document.getElementById("deleteSBtn");
    btnInsert.style.background = "#003347";
    document.getElementById("updateABtn").style.background = "#004e6d";
    document.getElementById("insertABtn").style.background = "#004e6d";
    document.getElementById("updateLBtn").style.background = "#004e6d";
    document.getElementById("deleteLBtn").style.background = "#004e6d";
    document.getElementById("insertLBtn").style.background = "#004e6d";
    document.getElementById("updateSBtn").style.background = "#004e6d";
    document.getElementById("deleteABtn").style.background = "#004e6d";
    document.getElementById("insertSBtn").style.background = "#004e6d";
    document.getElementById("dataDiv").innerHTML = '<label for="delete" id="deleteLabel">Site ID</label><input type="text" placeholder="Enter the site ID to delete" name="delete" id="delete" class="formInput"><br>';
}

function submitForm() {
    /* insert validation */
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "populateTable.php?type=address");
    xmlhttp.send();
    document.getElementById("insertForm").submit();
}

function locationTableClick() {
    var btnClicked = document.getElementById("locationTableBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("addressTableBtn").style.background = "#004e6d";
    document.getElementById("siteTableBtn").style.background = "#004e6d";
    /*     document.getElementById("table").innerHTML='<?php require ("locationsTable.php") ?>'; */
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "populateTable.php?type=location");
    xmlhttp.send();
}

function addressTableClick() {
    var btnClicked = document.getElementById("addressTableBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("locationTableBtn").style.background = "#004e6d";
    document.getElementById("siteTableBtn").style.background = "#004e6d";
    /*     document.getElementById("table").innerHTML='hello<?php require ("addresssTable.php"); ?>'; */
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "populateTable.php?type=address");
    xmlhttp.send();
}

function siteTableClick() {
    var btnClicked = document.getElementById("siteTableBtn");
    btnClicked.style.background = "#003347";
    document.getElementById("locationTableBtn").style.background = "#004e6d";
    document.getElementById("addressTableBtn").style.background = "#004e6d";
    /*     document.getElementById("table").innerHTML='hello<?php require ("addresssTable.php"); ?>'; */
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "populateTable.php?type=site");
    xmlhttp.send();
}