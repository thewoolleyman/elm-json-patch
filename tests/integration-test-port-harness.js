const ports = Elm.Test.Integration.PortParserTest.worker().ports;

const expected = {a: [2]};
const $expected = document.getElementById('expected');
$expected.innerText = JSON.stringify(expected);

ports.displayModel.subscribe(function(model) {
  const $model = document.getElementById('model');
  $model.innerText = JSON.stringify(model);
  const $body = document.getElementsByTagName('body')[0];
  const $result = document.getElementById('result');
  const isEqual = JSON.stringify(expected) === JSON.stringify(model);
  if (isEqual) {
    $result.innerText = (isEqual);
    $body.style = 'background-color: lightgreen';
  } else {
    $body.style = 'background-color: red';
  }
});

setTimeout(function() {
  ports.receivePatch.send([
    {op: "add", path: "/a/1", value: 2}
  ]);
}, 0);
