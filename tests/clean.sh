#!/bin/sh

cd "$(dirname "$0")"
set -e

rm -rf elm-stuff/build-artifacts # sometimes there's compilation errors
