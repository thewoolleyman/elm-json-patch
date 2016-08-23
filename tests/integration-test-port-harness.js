const ports = Elm.Test.Integration.PortParserTest.worker().ports;

const expected = "This is a JSON patch";
const $expected = document.getElementById('expected');
$expected.innerText = JSON.stringify(expected);

ports.displayModel.subscribe(function(model) {
  const $model = document.getElementById('model');
  $model.innerText = JSON.stringify(model);
  const $body = document.getElementsByTagName('body')[0];
  const $result = document.getElementById('result');
  if (expected == model) {
    $result.innerText = (expected == model);
    $body.style = 'background-color: lightgreen';
  } else {
    $body.style = 'background-color: red';
  }
});

setTimeout(function () {
  ports.receivePatch.send("This is a JSON patch");
}, 0);
