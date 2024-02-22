#!/bin/sh

beforeAll() {
    TEST_ROOT_DIR=$(mktemp -d -t 'shinit_testXXXXXX')
    MOCK_DIR=$(mktemp -d -t 'shinit_mockXXXXXX')

    USED_CMDS='cat cd chmod curl date grep hexdump id ls mkdir printf sed tr'
    for MOCKED_CMD in $USED_CMDS; do
        echo '#!/bin/sh' >"${MOCK_DIR}/${MOCKED_CMD}"
        if type "$MOCKED_CMD" | grep -q 'builtin'; then
            echo 'builtin '"$MOCKED_CMD"' $@' >>"${MOCK_DIR}/${MOCKED_CMD}"
        else
            echo "$(command -v "$MOCKED_CMD")"' $@' >>"${MOCK_DIR}/${MOCKED_CMD}"
        fi
        chmod +x "${MOCK_DIR}/${MOCKED_CMD}"
    done
}

afterAll() {
    rm -r "${TEST_ROOT_DIR:-/tmp/shinit}" "${MOCK_DIR:-/tmp/shinit_mock}" 2>/dev/null
}

test_issue1() {
    echo | PATH="$MOCK_DIR" ./shinit "$TEST_ROOT_DIR" 2>/dev/null >&2
    test $? -eq 0

    TEST_PROJ_DIR=$(find "$TEST_ROOT_DIR"/* -type d -prune -print | head -1)
    TEST_PROJ_SCRIPT=$(basename "$TEST_PROJ_DIR")
    # shellcheck disable=SC2012
    test "$(ls -a "$TEST_PROJ_DIR" | tr '\n' ' ')" = ". .. LICENSE Makefile README.md $TEST_PROJ_SCRIPT " 
}

test_issue2() {
    echo 'in://valid.url/is/here/issue2.git' | ./shinit "$TEST_ROOT_DIR" 2>/dev/null >&2
    test $? -eq 0

    test "$(cd "${TEST_ROOT_DIR}/issue2" && git remote -v)" = ''
}