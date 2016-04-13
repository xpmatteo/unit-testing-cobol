#!/bin/bash

set -e
cd "$(dirname "$0")"/..

clear
source script/lib/testing.bash

script/build.sh

expect_success ./hello
expect_output 'Hello, world!' ./hello
expect_success ./hello Pippo
expect_output 'Hello, Pippo!' ./hello Pippo

report_any_failures

