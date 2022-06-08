# Force one shell environment for all recipes
.ONESHELL:

# Environment variables
PYTHON = python3

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
	@echo "Creating Virtual Environment..."
	$(PYTHON) -m venv ./QL-venv
	@echo ""

install_requirements:
	@echo "Installing Dependencies..."
	pip install -r ./requirements.txt
	@echo ""

update_requirements:
	@echo "Updating Dependencies..."
	pip freeze > ./requirements.txt
	@echo ""

run_tests:
	@echo "Running Tests..."
	$(PYTHON) ./src/agent.py
	@echo ""

clean:
	@echo "Cleaning...\n"
	rm -rf ./QL-venv
	@clear
