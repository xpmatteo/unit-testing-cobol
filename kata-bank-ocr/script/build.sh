#!/bin/bash

set -e
cd "$(dirname "$0")"/..

target="bank-ocr"

cobc -help > /dev/null || echo "Please execute 'brew install gnu-cobol'"

#cobc -free -x -o sum_file_test sum_file_test.cbl sum_file_message.cbl

cobc -free -x -o $target -W ${target}-main.cbl

