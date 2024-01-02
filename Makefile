.DEFAULT_GOAL := help
DEFAULT_BRANCH := main
ROLE_DIR := $(shell basename $(CURDIR))

# Determine this makefile's path.
# Be sure to place this BEFORE `include` directives, if any.
THIS_FILE := $(lastword $(MAKEFILE_LIST))
VERSION := 0.0.11
#  use the long commit id
COMMIT := $(shell git rev-parse HEAD)



help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

clean-venv: ## re-create virtual env
	rm -rf .venv
	python3 -m venv .venv
	( \
       . .venv/bin/activate; \
       pip install -r requirements.txt; \
    )

git-status: ## require status is clean so we can use undo_edits to put things back
	@status=$$(git status --porcelain); \
	if [ ! -z "$${status}" ]; \
	then \
		echo "Error - working directory is dirty. Commit those changes!"; \
		exit 1; \
	fi

undo_edits: ## undo staged and unstaged change. ohmyzsh alias: grhh
	git reset --hard

rebase: git-status ## rebase current feature branch on to the default branch
	git fetch && git rebase origin/$(DEFAULT_BRANCH)

test: git-status static ## Run all project tests
	( \
       . .venv/bin/activate; \
       python3 -m pytest -o log_cli=true -v test; \
    )

pylint: ## run pylint on python files
	( \
       . .venv/bin/activate; \
       git ls-files '*.py' | xargs pylint --max-line-length=90; \
    )

black: ## use black to format python files
	( \
       . .venv/bin/activate; \
       git ls-files '*.py' |  xargs black --line-length=79; \
    )

black-check: ## use black to format python files
	( \
       . .venv/bin/activate; \
       git ls-files '*.py' |  xargs black --check --line-length=79; \
    )

shellcheck: ## use black to format python files
	( \
       git ls-files '*.sh' |  xargs shellcheck --format=gcc; \
    )

unit-test: ## run test that don't require deployed resources
	( \
       . .venv/bin/activate; \
       python3 -m pytest -v -m "unit" tests/; \
    )

static:  black pylint shellcheck unit-test ## run all static checks

bump: ## bump version in main branch
ifeq ($(CURRENT_BRANCH), $(MAIN_BRANCH))
	( \
	   . .venv/bin/activate; \
	   pip install bump2version; \
	   bump2version $(part); \
	)
else
	@echo "UNABLE TO BUMP - not on Main branch"
	$(info Current Branch: $(CURRENT_BRANCH), main: $(MAIN_BRANCH))
endif

run: ## run cookiecutter into a temp directory
	TD=$$(mktemp -d); \
	echo $$TD; \
	( \
       . .venv/bin/activate; \
			 cookiecutter . -o $$TD; \
			 RD=$$(ls $$TD); \
			 git -C $$TD/$$RD init .; \
			 git -C $$TD/$$RD add -A; \
			 git -C $$TD/$$RD commit -am.; \
			 tree $$TD; \
    )

.PHONY: static shellcheck test