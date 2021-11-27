Cookiecutter template for ansible role projects

 - Setup a minimal project structure
 - get molecule linting and test working immediately
 - use .env to provide secure variables to test runs without leaking into the repo
 - provide testinfra example
 - provide a Makefile that useful locally and in pipelines


## Usage
If you don't want to install cookiecutter system wide, just install it in a .venv
```bash
python3 -m venv .venv
. .venv/bin/activate
pip install --upgrade pip setuptools cookiecutter
cookiecutter gh:natemarks/cookiecutter-golang

app_name [my_app]: ghj
github_user [natemarks]:
author [Nate Marks]:

tree
.
└── arole_ghj
    ├── Makefile
    ├── defaults
    │   └── main.yml
    ├── env.example
    ├── files
    ├── handlers
    ├── meta
    │   └── main.yml
    ├── molecule
    │   └── default
    │       ├── converge.yml
    │       ├── example_requirements.yml
    │       ├── group_vars
    │       ├── host_vars
    │       │   ├── ubuntu20.04-all
    │       │   └── ubuntu20.04-only-ac
    │       ├── hosts
    │       ├── molecule.yml
    │       └── tests
    │           └── test_default.py
    ├── playbook
    ├── scripts
    │   └── generate_env.sh
    ├── tasks
    │   └── main.yml
    ├── templates
    │   └── tmp_version_file.j2
    ├── tests
    │   ├── inventory
    │   └── test.yml
    └── vars

16 directories, 16 files
cd arole_ghj
make clean-venv && make molecule-test
```