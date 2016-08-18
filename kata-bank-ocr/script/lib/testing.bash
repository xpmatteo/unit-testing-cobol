
# Adapted from Andrea Francia
# https://github.com/andreafrancia/just-bash

reset_expectations() {
    failures=()
}

report_any_failures() {
    local IFS=
    printf "\n%s" "${failures[*]}"
    [[ ${#failures[@]} -eq 0 ]];
}

expect_success() {
    local command="$*"
    if "$@" > /dev/null; then
        echo -n "."
    else
        local actual_exit_code="$?"
        echo -n "F"
        failures+=(
"Failed expectation for command: \`$command'
 - expected success (exit code == 0)
 - got failure (exit code == $actual_exit_code)
")
    fi
}

expect_output() {
    local expected_output="$1"; shift
    local command="$*"
    local actual_output="$( "$@"; )"
    if [[ "$actual_output" == "$expected_output" ]]; then
        echo -n "."
    else
        echo -n "E"
        failures+=(
"Failed expectation for command: \`$command'
 - expected output: >$expected_output<
 -   actual output: >$actual_output<
")
    fi
}

expect_file_equal() {
  local expected_file="$1"; shift
  local actual_file="$1"; shift
  if diffs="$(diff $expected_file $actual_file)"
  then
      echo -n "."
  else
      echo -n "E"
      failures+=(
"Failed expectation for file equality:
$diffs
")
  fi
}


echo_out_and_err() {
    echo "$1"
    echo_on_stderr "$2"
}

echo_on_stderr() {
    echo "$1" 1>&2
}

stderr_only_of() {
    "$@" 2>&1 1>/dev/null || true
}

stdout_only_of() {
    "$@" 2>/dev/null || true
}

# expect_output \
#     'Error' \
#     stderr_only_of echo_on_stderr 'Error'
#
# expect_output \
#     'out' \
#     stdout_only_of echo_out_and_err 'out' 'err1'
#
# expect_output \
#     'out' \
#     stdout_only_of echo_out_and_err 'out' 'err'
#
# expect_output \
#     '' \
#     stderr_only_of stdout_only_of echo_out_and_err 'out' 'err'
#
# expect_success true
# expect_output 'foo
# bar' \
#     echo 'foo
# bar'


