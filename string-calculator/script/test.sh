#!/bin/bash

set -e
cd "$(dirname "$0")"/..

clear
source script/lib/testing.bash

script/build.sh

./a.out
