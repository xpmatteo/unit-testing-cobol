#!/bin/bash

set -e
cd "$(dirname "$0")"/..

clear
source script/lib/testing.bash

script/build.sh

#./sum_file_test

echo

# end-to-end tests
cat <<EOF > sample-input.txt
0002
0003
0004
EOF
cat <<EOF > expected-output.txt
0002 0002
0003 0005
0004 0009
EOF

expect_success ./sum_file sample-input.txt sample-output.txt
expect_file_equal sample-output.txt expected-output.txt

report_any_failures

