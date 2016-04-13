#!/bin/bash

set -e
cd "$(dirname "$0")"/..

cobc -help > /dev/null || echo "Please execute 'brew install gnu-cobol'"

cobc -free -x -o hello hello_main.cbl hello_message.cbl

