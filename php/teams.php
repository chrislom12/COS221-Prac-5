<!--COS221 PerfectStrangers-->
<!DOCTYPE html>

<head>

    <link rel="stylesheet" href="../css/teams.css">
    <title>COS221 Prac 5</title>
    <script src= "../js/teams.js"></script>

</head>

<body onload="insertClick()">

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
                            <input type="hidden" id="type" name="type" value="insert">
                            <label for="name" id="nameLabel">Team Name</label>
                            <input type="text" placeholder="Enter Team Name" name="name" id="name" class="formInput" required>
                            <br>
                            <label for="publisher" id="publisherLabel">Publisher ID</label>
                            <input type="text" placeholder="Enter Publisher ID" name="publisher" id="publisher" class="formInput" required>
                            <br>
                            <label for="site" id="siteLabel">Home Site ID</label>
                            <input type="text" placeholder="Enter Home Site ID" name="site" id="site" class="formInput" required>
                        </div>     
                    </form>
                </div>   
            </div>
            <div class ="confirmBlock">
                <button class = "choiceQueryBtn">Confirm</button>
            </div>
        </div>
        <div class ="tableBlock">
            <table class="content-table">
                <thead>
                    <tr>
                    <th>Value 1</th>
                    <th>Value 2</th>
                    <th>Value 3</th>
                    <th>Value 4</th>
                    <th>Value 5</th>
                    <th>Value 6</th> 
                    <th>Value 7</th>
                    <th>Value 8</th>  
                    <th>Value 6</th> 
                    <th>Value 7</th>
                    <th>Value 8</th>                     
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    <tr>
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>
                    <td>1</td>
                    <td>lol idk</td>
                    <td>150</td>
                    <td>1</td>
                    <td>lol idk</td>      
                    <td>Name Here</td>
                    <td>Something Here</td>
                    <td>Sample Text Here</td>             
                    </tr>
                    
                    
                    
                </tbody>
            </table>
        </div>
    </div>
    
    <?php
        require ("footer.php");
    ?>

</body>

</html>