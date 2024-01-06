Cookiecutter template for Go projects ansible role projects. Tested with go version 1.17

 - Setup a minimal project structure
 - build and release to package two sample executables
 - docker-build and docker-release to package docker image for one of the sample executables
 - make static: goimports fmt vet lint gocyclo godeadcode govulncheck test
 - scripts/init.sh to quickly setup the git repo and go mod
 - minimal versioning using only the commit id



## Usage
If you don't want to install cookiecutter system wide, just install it in a .venv
```bash
python3 -m venv .venv
. .venv/bin/activate
pip install --upgrade pip setuptools cookiecutter
cookiecutter gh:natemarks/cookiecutter-golang
You've downloaded /Users/nmarks/.cookiecutters/cookiecutter-golang before. Is it okay to delete and re-download it? [yes]:
app_name [my_app]: vbn
github_user [natemarks]:
author [Nate Marks]:
❯ tree -a vbn
vbn
├── .bumpversion.cfg
├── .gitignore
├── Makefile
├── README.md
├── cmd
│   ├── prog1
│   │   └── main.go
│   └── prog2
│       └── main.go
└── version
    └── main.go

4 directories, 7 files
cd vbn
bash scripts/init.sh
❯ make build
a7088ad1f8ce9001f89d87e23a24e1365583498f/linux/amd64
a7088ad1f8ce9001f89d87e23a24e1365583498f/darwin/amd64
a7088ad1f8ce9001f89d87e23a24e1365583498f/linux/amd64
a7088ad1f8ce9001f89d87e23a24e1365583498f/darwin/amd64
rm -f build/current
ln -s /Users/nmarks/go/src/github.com/natemarks/vbn/build/a7088ad1f8ce9001f89d87e23a24e1365583498f /Users/nmarks/go/src/github.com/natemarks/vbn/build/current
```