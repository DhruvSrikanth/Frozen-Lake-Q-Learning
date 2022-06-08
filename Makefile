# Force one shell environment for all recipes
.ONESHELL:

# Environment variables
PYTHON = python
PIP = pip
REMOVE = rm -rf
PRINT = @echo

# targets
.PHONY: setup
.PHONY: install
.PHONY: update
.PHONY: run
.PHONY: clean

# recipes
setup: create_env 
install: install_requirements
update: update_requirements
run: run_tests

# rules
create_env:
	$(PRINT) "Creating Virtual Environment..."
	$(PYTHON) -m venv ./QL-venv
	$(PRINT)

install_requirements:
	$(PRINT) "Installing Dependencies..."
	$(PIP) install -r ./requirements.txt
	$(PRINT) ""

update_requirements:
	$(PRINT) "Updating Dependencies..."
	$(PIP) freeze > ./requirements.txt
	$(PRINT) ""

run_tests:
	$(PRINT) "Running Tests..."
	$(PYTHON) ./src/agent.py
	$(PRINT) ""

clean:
	$(PRINT) "Cleaning...\n"
	rm -rf ./QL-venv
