#!/bin/sh

beforeAll() {
    TEST_ROOT_DIR=$(mktemp -d -t 'shinit_testXXXXXX')
}

afterAll() {
    rm -R "${TEST_ROOT_DIR:-/tmp/shinit}"/* 2>/dev/null
    rmdir "${TEST_ROOT_DIR:-/tmp/shinit}"
}

#
# TEST CASES
#

test_default() {
    ./shinit "${TEST_ROOT_DIR}" 2>/dev/null >&2
    test $? -eq 0

    TEST_PROJ_DIR=$(find "${TEST_ROOT_DIR}"/* -type d -prune -print | head -1)
    TEST_PROJ_SCRIPT=$(basename "${TEST_PROJ_DIR}")
    # shellcheck disable=SC2012
    test "$(ls -a "${TEST_PROJ_DIR}" | tr '\n' ' ')" = ". .. .git .gitignore LICENSE README.md ${TEST_PROJ_SCRIPT} " 
}
