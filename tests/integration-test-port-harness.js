var ports = Elm.Test.Integration.PortParserTest.worker().ports;

ports.displayModel.subscribe(function(model) {
  var $el = document.getElementById('model');
  $el.innerText = JSON.stringify(model);
});

setTimeout(function () {
  ports.receivePatch.send("This is a JSON patch");
}, 0);
