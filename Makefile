.PHONY: install run debug clean fclean lint lint-strict test package

CONFIG = config.json
UV ?= uv
TEST_PYTHON ?= 3.12
TEST_ARGS ?=
SRC_DIR = src
MAIN_SCRIPT = pac-man.py
TEST_DIR = tests/

install:
	uv sync

run:
	uv run python $(MAIN_SCRIPT) $(CONFIG)

debug:
	uv run python -m pdb $(MAIN_SCRIPT) $(CONFIG)

clean:
	@echo "Cleaning cache and temporary files..."
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type f -name "*.pyd" -delete
	find . -type f -name ".DS_Store" -delete
	find . -type f -name "*~" -delete
	rm -rf .mypy_cache .ruff_cache .pytest_cache .coverage htmlcov $(SRC_DIR)/__pycache__
	rm -rf build dist

fclean: clean
	@echo "Performing full clean..."
	rm -rf .venv
	@if [ -d data/output ]; then \
		find data/output -type f -name "*.json" -delete; \
	fi
	@if [ -d data/processed ]; then \
		find data/processed -type f -not -name ".gitkeep" -delete; \
	fi

lint:
	uv run flake8 .
	uv run mypy --explicit-package-bases --warn-return-any --warn-unused-ignores --ignore-missing-imports --disallow-untyped-defs --check-untyped-defs .

lint-strict:
	uv run flake8 .
	uv run mypy --strict .

test:
	SDL_VIDEODRIVER=dummy SDL_AUDIODRIVER=dummy PYGAME_HIDE_SUPPORT_PROMPT=1 \
	$(UV) run --no-project --python $(TEST_PYTHON) \
		--with-requirements requirements-test.txt \
		--with ./package/mazegenerator-2.1.0-py3-none-any.whl \
		python -m pytest $(TEST_DIR) -v $(TEST_ARGS)

package:
	@echo "Building the distributable game package..."
	./build_package.sh
