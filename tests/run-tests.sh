#!/bin/sh

cd "$(dirname "$0")"
set -e

elm-package install -y

elm-make --yes --output test.js Suite.elm
node test.js
