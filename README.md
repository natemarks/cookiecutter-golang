Cookiecutter template for ansible role projects. Tested with go version 1.17

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
go mod init github.com/natemarks/vbn
go: creating new go.mod: module github.com/natemarks/vbn
❯ git init .
Initialized empty Git repository in /Users/nmarks/go/src/github.com/natemarks/vbn/.git/
❯ git add -A
❯ git commit -am 'initial'
[main (root-commit) a7088ad] initial
 Committer: Nathan Marks <nmarks@Nathans-MacBook-Pro.local>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 8 files changed, 141 insertions(+)
 create mode 100644 .bumpversion.cfg
 create mode 100644 .gitignore
 create mode 100644 Makefile
 create mode 100644 README.md
 create mode 100644 cmd/prog1/main.go
 create mode 100644 cmd/prog2/main.go
 create mode 100644 go.mod
 create mode 100644 version/main.go
❯ make build
a7088ad1f8ce9001f89d87e23a24e1365583498f/linux/amd64
a7088ad1f8ce9001f89d87e23a24e1365583498f/darwin/amd64
a7088ad1f8ce9001f89d87e23a24e1365583498f/linux/amd64
a7088ad1f8ce9001f89d87e23a24e1365583498f/darwin/amd64
rm -f build/current
ln -s /Users/nmarks/go/src/github.com/natemarks/vbn/build/a7088ad1f8ce9001f89d87e23a24e1365583498f /Users/nmarks/go/src/github.com/natemarks/vbn/build/current
```