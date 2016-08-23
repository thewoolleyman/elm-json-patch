# elm-json-patch

Elm package to handle [JSON Patch](http://jsonpatch.com/) [RFC 6902](https://tools.ietf.org/html/rfc6902) format.

Like [https://github.com/zaim/immpatch](https://github.com/zaim/immpatch), but to apply port-incoming
JSON Patches to Elm record structures.

Running tests:

* `brew install watch`
* Unit tests: 
  * `watch tests/run-unit-tests`
* Integration test (TODO: how to automate port-based tests with native JS?):
  * `watch tests/run-integration-test` (actually just compiles)
  * `open tests/integration-test.html` (reloads page every five seconds)
  * `tests/clean` (if you have compilation or other problems)
  * Clear browser cache and hard-reload if you still have problems
  
