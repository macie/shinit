# This Makefile intended to be POSIX-compliant (2018 edition with .PHONY target).
#
# .PHONY targets are used by task definintions.
#
# More info:
#  - docs: <https://pubs.opengroup.org/onlinepubs/9699919799/utilities/make.html>
#  - .PHONY: <https://www.austingroupbugs.net/view.php?id=523>
#
.POSIX:
.SUFFIXES:


#
# PUBLIC MACROS
#

CLI  = shinit
LINT = shellcheck
TEST = ./unittest


#
# INTERNAL MACROS
#

TEST_SRC=https://raw.githubusercontent.com/macie/unittest.sh/master/unittest


#
# DEVELOPMENT TASKS
#

.PHONY: all
all: test check

.PHONY: clean
clean:
	@echo '# Delete test runner: rm $(TEST)' >&2
	@if [ -f "$(TEST)" ]; then rm $(TEST); fi

.PHONY: info
info:
	@printf '# OS info: '
	@uname -rsv;
	@echo '# Development dependencies:'
	@echo; $(LINT) -V || true
	@echo; $(TEST) -v || true
	@echo '# Environment variables:'
	@env || true

.PHONY: check
check: $(LINT)
	@printf '# Static analysis: $(LINT) $(CLI) ./tests/*.sh' >&2
	@$(LINT) $(CLI) ./tests/*.sh

.PHONY: test
test: $(TEST)
	@echo '# Unit tests: $(TEST)' >&2
	@$(TEST)

.PHONY: install
install:
	@echo '# Install in /usr/local/bin' >&2
	@mkdir -p /usr/local/bin; cp $(CLI) /usr/local/bin/


#
# DEPENDENCIES
#

$(LINT):
	@printf '# $@ installation path: ' >&2
	@command -v $@ >&2 || { echo "ERROR: Cannot find $@" >&2; exit 1; }

$(TEST):
	@echo '# Prepare $@:' >&2
	@if [ "$$(uname -s)" = "OpenBSD" ]; then ftp -V $(TEST_SRC); else curl -fLO $(TEST_SRC); fi
	chmod +x $@
