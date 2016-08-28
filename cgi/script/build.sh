#!/bin/bash

set -e
cd "$(dirname "$0")"/..

cobc -help > /dev/null || echo "Please execute 'brew install gnu-cobol'"

COBC_OPTS="-free -x"
cobc $COBC_OPTS htmlgen_test.cbl htmlgen.cbl
