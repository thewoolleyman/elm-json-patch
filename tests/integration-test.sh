#!/bin/sh

cd "$(dirname "$0")"
set -e

elm-package install -y

elm-make --yes --output integration-test.js Test/Integration/PortParserTest.elm

