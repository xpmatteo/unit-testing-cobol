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
1
12
 4
EOF
cat <<EOF > expected-output.txt
0001 0001
0012 0013
0004 0017
EOF

expect_success ./sum_file sample-input.txt sample-output.txt
expect_file_equal expected-output.txt sample-output.txt

report_any_failures

