const ports = Elm.Test.Integration.PortParserTest.worker().ports;

const expected = "This is a JSON patch";
var $expected = document.getElementById('expected');
$expected.innerText = JSON.stringify(expected);

ports.displayModel.subscribe(function(model) {
  var $model = document.getElementById('model');
  $model.innerText = JSON.stringify(model);
  var $result = document.getElementById('result');
  $result.innerText = (expected == model);
});

setTimeout(function () {
  ports.receivePatch.send("This is a JSON patch");
}, 0);
