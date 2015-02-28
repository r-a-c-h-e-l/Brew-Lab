var calculateUnit = function(total) {
    var unit;
    var totalPhases = total
    console.log(totalPhases);
    if (totalPhases === 6) {
      unit = 16.67
    }
    if (totalPhases === 5) {
      unit = 20
    }
    if (totalPhases === 4) {
      unit = 25
    }
    if (totalPhases === 3) {
      unit = 33.33
    }
  return unit
}

var generateProgressBar = function(phase,total) {
  var unit = calculateUnit(total);
  var parent = document.getElementById("progressBarDiv");
  var phase = phase;
  console.log(phase);
  for (var i = 0; i<phase; i++) {
    var div = document.createElement('div');
    div.id = "phase" + i;
    div.setAttribute("class", "progress-bar");
    div.style.width = unit +"%"
    parent.appendChild(div);
  }
}
