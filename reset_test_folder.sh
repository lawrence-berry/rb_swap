#!/bin/bash -
git checkout HEAD -- test
rm -rf test/paths/tothis/
rm test/paths/notme/tothis
