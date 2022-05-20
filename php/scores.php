<!--COS221 PerfectStrangers-->
<!DOCTYPE html>

<head>

    <link rel="stylesheet" href="../css/scores.css">
    <link rel="stylesheet" href="../css/headfoot.css">
    <title>COS221 Prac 5</title>
    <script src= "../js/scores.js"></script>

</head>

<body onload="insertClick()">

    <?php
    include 'header.php';
    ?>
    <h1 class=headingPage id="heading">Scores</h1>
    <div class="mainBlock">
        <div class ="queriesBlock">
            <div class ="optionsBlock">
                <button id="tournamentBtn" class = "choiceQueryBtn" onclick="tournamentClick()">Add Tournament</button>
                <button id="eventBtn" class = "choiceQueryBtn" onclick="eventClick()">Add Event</button>
                <button id="eventStateBtn" class = "choiceQueryBtn" onclick="eventStateClick()">Add Event State</button>
            </div>
            <div class ="inputBlock">
                <div class="subdiv">
                    <div class ="optionsBlock">
                        <button id="startBtn" class = "stateBtn" onclick="startClick()">Start</button>
                        <button id="finishBtn" class = "stateBtn" onclick="finishClick()">Finish</button>
                        <button id="overtakeBtn" class = "stateBtn" onclick="overtakeClick()">Overtake</button>
                        <button id="disqBtn" class = "stateBtn" onclick="disqClick()">Disqualify</button>
                    </div>
                    <form action="teams-validate.php" method="post" id="insertForm">
                        <div class="insertDiv" id = "dataDiv">
                            <div class="insertDiv">
                                <br>
                                <input type="hidden" id="type" name="type" value="eventState">
                                <label for="event" id="eventLabel">Event ID</label>
                                <input type="text" placeholder="Enter Event ID" name="event" id="event" class="formInput">
                                <br>
                                <label for="time" id="timeLabel">Seconds Elapsed</label>
                                <input type="text" placeholder="Enter Seconds Elapsed" name="time" id="time" class="formInput">
                                <br>
                                <label for="raceState" id="raceStateLabel">Current Race State</label>
                                <select name="raceState" id="raceState" class = "formInput">
                                    <option value="before">before</option>
                                    <option value="during">during</option>
                                    <option value="after">after</option>
                                </select>
                                
                            </div>
                            
                            <div class="insertDiv" id = "stateDiv">
                                <label for="person1" id="person1Label">Person ID</label>
                                <input type="text" placeholder="Enter Person 1 ID" name="person1" id="person1" class="formInput" >
                                <br>
                                <label for="sequence" id="sequenceLabel">Sequence Number</label>
                                <input type="text" placeholder="Enter Sequence Number" name="sequence" id="sequence" class="formInput" >
                                <br>
                                <label for="position" id="positionLabel">Position after start</label>
                                <select name="position" id="position" class = "formInput">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                </select>
                            </div>  
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