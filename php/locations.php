<!--COS221 PerfectStrangers-->
<!DOCTYPE html>

<head>

    <link rel="stylesheet" href="../css/locations.css">
    <link rel="stylesheet" href="../css/headfoot.css">
    <title>COS221 Prac 5</title>
    <script src= "../js/locations.js"></script>

</head>

<body onload="insertLocationClick(), locationTableClick()">

    <?php
    include 'header.php';
    ?>
    <h1 class=headingPage id="heading">Locations</h1>
    <div class="mainBlock">
        <div class ="queriesBlock">
            <div class ="optionsBlock">
                <button id="insertLBtn" class = "choiceQueryBtn" onclick="insertLocationClick()">Add Location</button>
                <button id="updateLBtn" class = "choiceQueryBtn" onclick="updateLocationClick()">Update Location</button>
                <button id="deleteLBtn" class = "choiceQueryBtn" onclick="deleteLocationClick()">Delete Location</button>
            </div>
            <div class ="optionsBlock">
                <button id="insertABtn" class = "choiceQueryBtn" onclick="insertAddressClick()">Add Address</button>
                <button id="updateABtn" class = "choiceQueryBtn" onclick="updateAddressClick()">Update Address</button>
                <button id="deleteABtn" class = "choiceQueryBtn" onclick="deleteAddressClick()">Delete Address</button>
            </div>
            <div class ="optionsBlock">
                <button id="insertSBtn" class = "choiceQueryBtn" onclick="insertSiteClick()">Add Site</button>
                <button id="updateSBtn" class = "choiceQueryBtn" onclick="updateSiteClick()">Update Site</button>
                <button id="deleteSBtn" class = "choiceQueryBtn" onclick="deleteSiteClick()">Delete Site</button>
            </div>
            <div class ="inputBlock">
                <div class="subdiv">
                    <form action="locations-validate.php" method="post" id="insertForm">
                        <div class="insertDiv" id = "dataDiv">
                        <input type="hidden" id="type" name="type" value="addSite">
                        <label for="site" id="siteLabel">Site Name</label>
                        <input type="text" placeholder="Enter the Site Name" name="site" id="site" class="formInput">
                        <br>
                        <label for="location" id="locationLabel">Location ID</label>
                        <input type="text" placeholder="Enter the Location ID" name="location" id="location" class="formInput">
                        <br>
                        <label for="area" id="areaLabel">Area</label>
                        <input type="text" placeholder="Enter the area" name="area" id="area" class="formInput">
                        <br>
                        <label for="country" id="countryLabel">Country</label>
                        <input type="text" placeholder="Enter the Country" name="country" id="country" class="formInput">
                        <br>
                        <input type="hidden" id="type" name="type" value="updateSite">
                        <label for="update" id="updateLabel">What do you need updated?</label>
                        <select name="updateNeeded" id="updateNeeded" class = "formInput">
                            <option value="site">Site Name</option>
                            <option value="location">Location ID</option>
                        </select>
                        <br>
                        <label for="site" id="siteLabel">Site ID</label>
                        <input type="text" placeholder="Enter the site ID" name="site" id="site" class="formInput">
                        <br>
                        <label for="newVal" id="newValLabel">New Value</label>
                        <input type="text" placeholder="Enter the new value" name="newVal" id="newVal" class="formInput">
                        <br>
                        <input type="hidden" id="type" name="type" value="deleteSite">
                        <label for="delete" id="deleteLabel">Site ID</label>
                        <input type="text" placeholder="Enter the site ID to delete" name="delete" id="delete" class="formInput">
                        <br>
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
                <button id="locationTableBtn" class = "choiceQueryBtn" onclick="locationTableClick()">Locations</button>
                <button id="addressTableBtn" class = "choiceQueryBtn" onclick="addressTableClick()">Addresses</button>
                <button id="siteTableBtn" class = "choiceQueryBtn" onclick="siteTableClick()">Sites</button>
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
