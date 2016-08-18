#!/bin/bash

clear
set -e
cd "$(dirname "$0")"/..

source script/lib/testing.bash
script/build.sh

# end-to-end tests
input=/tmp/input.txt
output=/tmp/output.txt
expected=/tmp/expected.txt

##--- empty file
rm -f $input $output $expected || true
cat /dev/null > $input
echo "       0       0       0 $input" > $expected
./wc $input > $output
expect_file_equal $expected $output

##--- one line, one word
echo 'ciao' > $input
echo "       1       1       5 $input" > $expected
./wc $input > $output
expect_file_equal $expected $output

report_any_failures

