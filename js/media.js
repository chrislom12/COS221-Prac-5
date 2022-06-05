
function allClick(){
    document.getElementById("allBtn").style.background="#003347";
    document.getElementById("peopleBtn").style.background = "#004e6d";
    document.getElementById("teamsBtn").style.background = "#004e6d";
    document.getElementById("eventsBtn").style.background = "#004e6d";


    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "retrieveImages.php?type=all");
    xmlhttp.send();
}

function peopleClick(){
    document.getElementById("peopleBtn").style.background="#003347";
    document.getElementById("allBtn").style.background = "#004e6d";
    document.getElementById("teamsBtn").style.background = "#004e6d";
    document.getElementById("eventsBtn").style.background = "#004e6d";


    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "retrieveImages.php?type=people");
    xmlhttp.send();
}

function teamsClick(){
    document.getElementById("teamsBtn").style.background="#003347";
    document.getElementById("peopleBtn").style.background = "#004e6d";
    document.getElementById("allBtn").style.background = "#004e6d";
    document.getElementById("eventsBtn").style.background = "#004e6d";


    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "retrieveImages.php?type=teams");
    xmlhttp.send();
}

function eventsClick(){
    document.getElementById("eventsBtn").style.background="#003347";
    document.getElementById("peopleBtn").style.background = "#004e6d";
    document.getElementById("teamsBtn").style.background = "#004e6d";
    document.getElementById("allBtn").style.background = "#004e6d";

    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "retrieveImages.php?type=events");
    xmlhttp.send();
}




function submitForm() {
    /* insert validation */
    /* const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        //document.getElementById("table").innerHTML = this.responseText;
    }
    xmlhttp.open("GET", "retrieveImages.php?type=all");
    xmlhttp.send(); */
    document.getElementById("insertForm").submit();
}
