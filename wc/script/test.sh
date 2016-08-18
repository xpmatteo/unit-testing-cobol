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

function expect_wc {
  rm -f $expected || true
  local message="$1"
  local inputText="$2"
  local expectedText="$3"
  if [ "$inputText" = EMPTY ]; then
    cat /dev/null > $input
    printf "$expectedText" > $expected
  else    
    printf "$inputText" > $input
    printf "$expectedText" > $expected
  fi
  ./wc $input > $output
  expect_file_equal $expected $output "$message"
}


expect_wc "empty file" \
  "EMPTY" \
  "       0       0       0 $input\n"

expect_wc "one line, one word" \
  "ciao\n" \
  "       1       1       5 $input\n"

expect_wc "one line, two words" \
  "ciao beppe\n" \
    "       1       2      11 $input\n"

expect_wc "one line, two words with many spaces" \
  " ciao   beppe \n"\
  "       1       2      15 $input\n"

expect_wc "three lines" \
  "one \n two\n  three \n"\
  "       3       3      19 $input\n"

# many files
echo "foo" > /tmp/input0.txt
echo "bar baz" > /tmp/input1.txt
cat > $expected <<EOF
       1       1      4 /tmp/input0.txt
       1       2      8 /tmp/input1.txt
       2       3     12 total
EOF
./wc /tmp/input0.txt /tmp/input1.txt > $output
expect_file_equal $expected $output "$message"


report_any_failures

