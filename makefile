
# ----------------------------------------------------------------------- CONFIG

PYTHON_FILES:=$(wildcard *.py)
PYTHON_TEST_FILES=$(wildcard *_test.py)
PYTHON_SRC_FILES=$(filter-out $(PYTHON_TEST_FILES),$(PYTHON_FILES))
CMD_PREFIX=


# --------------------------------------------------------------------- COMMANDS

.PHONY: test
test: $(PYTHON_TEST_FILES) $(PYTHON_SRC_FILES)
	@echo "" > /dev/null


# ------------------------------------------------------------------------ RULES

.PHONY: $(PYTHON_TEST_FILES)
$(PYTHON_TEST_FILES): %.py:
	$(CMD_PREFIX)py.test -q $@

.PHONY: $(PYTHON_SRC_FILES)
$(PYTHON_SRC_FILES): %.py:
	$(CMD_PREFIX)pylint -r n $@
