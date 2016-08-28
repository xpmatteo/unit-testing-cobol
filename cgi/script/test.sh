#!/bin/bash

clear
set -e
cd "$(dirname "$0")"/..

source script/lib/testing.bash
script/build.sh

./htmlgen_test

