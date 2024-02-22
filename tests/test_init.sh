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
    echo | ./shinit "${TEST_ROOT_DIR}" 2>/dev/null >&2
    test $? -eq 0

    TEST_PROJ_DIR=$(find "${TEST_ROOT_DIR}"/* -type d -prune -print | head -1)
    TEST_PROJ_SCRIPT=$(basename "${TEST_PROJ_DIR}")
    # shellcheck disable=SC2012
    test "$(ls -a "${TEST_PROJ_DIR}" | tr '\n' ' ')" = ". .. .git .gitignore LICENSE Makefile README.md ${TEST_PROJ_SCRIPT} " 
}

test_name() {
    echo 'cool_script' | ./shinit "${TEST_ROOT_DIR}" 2>/dev/null >&2
    test $? -eq 0

    test -f "${TEST_ROOT_DIR}/cool_script/cool_script"
}

test_license_invalid() {
    printf 'some_proj\ninvalid\nMIT-0\n' | ./shinit "${TEST_ROOT_DIR}" 2>/dev/null >&2
    test $? -eq 0

    grep -q 'MIT No Attribution' "${TEST_ROOT_DIR}/some_proj/LICENSE"
}

test_repo_path_local() {
    echo '/valid.url/is/here/local_test.git' | ./shinit "${TEST_ROOT_DIR}" 2>/dev/null >&2
    test $? -eq 0

    test "$(cd "${TEST_ROOT_DIR}/local_test" && git remote -v)" = ''
}

test_repo_path_http() {
    echo 'http://valid.url/is/here/http_test.git' | ./shinit "${TEST_ROOT_DIR}" 2>/dev/null >&2
    test $? -eq 0

    test "$(cd "${TEST_ROOT_DIR}/http_test" && git remote -v)" = ''
}

test_repo_path_https() {
    echo 'https://valid.url/is/here/https_test.git' | ./shinit "${TEST_ROOT_DIR}" 2>/dev/null >&2
    test $? -eq 0

    test "$(cd "${TEST_ROOT_DIR}/https_test" && git remote get-url origin)" = 'https://valid.url/is/here/https_test.git'
}

test_repo_path_ssh() {
    echo 'git@valid.url:is/here/ssh_test.git' | ./shinit "${TEST_ROOT_DIR}" 2>/dev/null >&2
    test $? -eq 0

    test "$(cd "${TEST_ROOT_DIR}/ssh_test" && git remote get-url origin)" = 'git@valid.url:is/here/ssh_test.git'
}