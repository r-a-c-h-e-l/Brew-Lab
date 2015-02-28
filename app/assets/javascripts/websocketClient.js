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

var sensorMonitorMash = function(user_id, beer_id) {
  var user_id = user_id
  var beer_id = beer_id
  var startButton = document.getElementById('startMonitor');
  var stopButton = document.getElementById('stopMonitor')

  startButton.addEventListener('click', function() {
    var client = new WebSocket("ws://localhost:2000");

    client.addEventListener("open", function(evt) {
      console.log("you are connected!");

    });

    client.addEventListener("message", function(evt) {
      var processedMessage = JSON.parse(evt.data);
      console.log(processedMessage);
      if (processedMessage.temps) {
        var tempsArray = processedMessage.temps
        // send get request for auth_token
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'http://localhost:3000/user/'+user_id+'.json');
        // /user/1.json
        xhr.addEventListener('load', function() {
          var token = xhr.responseText;
          console.log(token);

          //send post with token
          var xhr2 = new XMLHttpRequest();
          // /user/:user_id/beer/:beer_id/mash mashes#show
          xhr2.open('POST', 'http://localhost:3000/user/'+user_id+'/beer/'+beer_id+'/mash');
          xhr2.setRequestHeader('Content-Type', "application/json;charset=UTF-8")
          xhr2.addEventListener('load', function() {
            var statusResponse = JSON.parse(xhr2.responseText);
            if (statusResponse.status === "success") {
              window.location.replace('/user/'+user_id+'/beer/'+beer_id+'/phases');
            } else {
              alert("there was an error saving your data")
              window.location.replace('/user/'+user_id+'/beer/'+beer_id+'/phases');
            }
          });
          var newMashPhase = {authenticity_token:token, temps: tempsArray, user_id: user_id, beer_id: beer_id};
          xhr2.send(JSON.stringify(newMashPhase));
        });
        xhr.send();
      }else {
        changeTemp(processedMessage);
      }
    });
    stopButton.addEventListener('click', function() {
      var obj = {
        msg: "stop",
      }
      client.send(JSON.stringify(obj));
    });
  });
}
