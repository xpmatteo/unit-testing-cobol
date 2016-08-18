#!/bin/bash

set -e
cd "$(dirname "$0")"/..

clear
source script/lib/testing.bash

script/build.sh

#./sum_file_test

echo

sample_input=/tmp/sample-input.txt
actual_output=/tmp/actual-output.txt
expected_output=/tmp/expected-output.txt

# end-to-end tests


# one line, only zeros
cat <<EOF > $sample_input
 _  _  _  _  _  _  _  _  _ 
| || || || || || || || || |
|_||_||_||_||_||_||_||_||_|

EOF
cat <<EOF > $expected_output
000000000
123456789
EOF

expect_success ./bank-ocr $sample_input $actual_output
expect_file_equal $sample_input $actual_output


# two lines, exercising all digits
cat <<EOF > $sample_input
 _  _  _  _  _  _  _  _  _ 
| || || || || || || || || |
|_||_||_||_||_||_||_||_||_|

    _  _     _  _  _  _  _
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _| 

EOF
cat <<EOF > $expected_output
000000000
123456789
EOF

expect_success ./bank-ocr $sample_input $actual_output
expect_file_equal $sample_input $actual_output

report_any_failures

