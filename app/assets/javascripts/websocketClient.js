var changeTemp = function(temp) {
  var tempBackground = document.getElementById('tempBackground');
  var tempDisplay = document.getElementById('tempNumber');
  if (temp > 72) {
    tempBackground.style.backgroundColor= "red";
    tempDisplay.innerHTML = temp;
  } else {
    tempBackground.style.backgroundColor= "lightgreen";
    tempDisplay.innerHTML = temp;
  }
}



var sensorMonitorMash = function() {
  var startButton = document.getElementById('startMonitor');
  var stopButton = document.getElementById('stopMonitor')
  startButton.addEventListener('click', function() {
    var client = new WebSocket("ws://localhost:2000");

    client.addEventListener("open", function(evt) {
      console.log("you are connected!");

    });

    client.addEventListener("message", function(evt) {
      // console.log(evt.data);
      var processedMessage = JSON.parse(evt.data);
      console.log(processedMessage);
      if (processedMessage.temps) {
        var tempsArray = processedMessage.temps
        var xhr = new XMLHttpRequest();
        // /user/:user_id/beer/:beer_id/mash
        xhr.open('POST', 'http://localhost:3000/user/'+user_id+'/beer/'+beer_id+'/mash');
        xhr.setRequestHeader('Content-Type', "application/json;charset=UTF-8")
        xhr.addEventListener('load', function() {});
        var newMashPhase = {authenticity_token:auth_token, temps: tempsArray, user_id: user_id, beer_id: beer_id};
        xhr.send(JSON.stringify(newMashPhase));
      }else {
        changeTemp(processedMessage);
        console.log(processedMessage);
      }

    });
    stopButton.addEventListener('click', function() {
      // var obj = {
      //   phase: "mash",
      //   user_id: user_id,
      //   beer_id: beer_id
      // }
      var obj = {
        msg: "stop",
      }
      client.send(JSON.stringify(obj));
    });
  });
}
