var sensorMonitor = function() {
  var startButton = document.getElementById('startMonitor');

  startButton.addEventListener('click', function() {
    var client = new WebSocket("ws://localhost:2000");

    client.addEventListener("open", function(evt) {
      console.log("you are connected!");

    });

    client.addEventListener("message", function(evt) {
      console.log(evt.data);
      var processedMessage = JSON.parse(evt.data);
      console.log(processedMessage);
    });
  });
}
