var sensorMonitor = function() {
  var client = new WebSocket("ws://localhost:2000");
  var five = require("johnny-five");
  var board = new five.Board();

  client.addEventListener("open", function(evt) {
    console.log("I'm here bitches!");
    client.send("I'm here bitches.")
  });


  board.on("ready", function() {
    var temperature = new five.Temperature({
      controller: "TMP36",
      pin: "A0",
    });

    var temp_y = 0;

    temperature.on("change", function(err, data) {
      var temp_x = Math.floor(data.fahrenheit);
      if (temp_y != temp_x) {
        console.log(temp_x);

        temp_y = temp_x
      }
      // console.log(data.celsius + "°C", data.fahrenheit + "°F");
    });
  });
  // @markdown
  // - [TMP36 - Temperature Sensor](https://www.sparkfun.com/products/10988)
  // @markdown
}


var tempMonitor = function() {
  var startButton = document.getElementById('startMonitor');

  startButton.addEventListener('click', function() {
    var client = new WebSocket("ws://localhost:2000");

    client.addEventListener("open", function(evt) {
      sensorMonitor();
      console.log("you are connected!");
      // client.send({})
    });

  });
}
