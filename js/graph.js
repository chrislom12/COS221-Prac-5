
var vals = '';

const req = new XMLHttpRequest();
req.open('get', '../php/graph.php', true);
req.onreadystatechange = function () {
if (req.readyState == 4 && req.status == 200){
    res = req.responseText;
    setGraph();
    }
}
req.send();


  function setGraph(){
    vals = JSON.parse(res)['lables'];
    console.log(JSON.parse(res));
    var xyValues = [
    {x:2, y:vals["4/2/22"]},
    {x:1, y:vals["4/1/22"]},
    {x:31, y:vals["3/31/22"]},
    {x:30, y:vals["3/30/22"]},
    {x:29, y:vals["3/29/22"]},
    {x:28, y:vals["3/28/22"]},
    {x:27, y:vals["3/27/22"]},
    {x:26, y:vals["3/26/22"]},
    {x:25, y:vals["3/25/22"]},
    {x:24, y:vals["3/24/22"]},
    {x:23, y:vals["3/23/22"]},
    {x:22, y:vals["3/22/22"]},
    {x:21, y:vals["3/21/22"]},
    {x:20, y:vals["3/20/22"]},
    {x:19, y:vals["3/19/22"]}
  ];


    new Chart("myChart", {
      type: "scatter",
      data: {
        datasets: [{
          pointRadius: 4,
          pointBackgroundColor: "#154c79",
          data: xyValues
        }]
      },
      options: {
        legend: {display: false},
        scales: {
          xAxes: [{ticks: {min: 0, max:31}}],
          yAxes: [{ticks: {min: 0, max:10}}],
        }
      }
    });

  }
