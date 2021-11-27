package main

import (
	"fmt"
	"github.com/{{ cookiecutter.github_user}}/{{ cookiecutter.app_name }}/version"
)

func main() {
	fmt.Println("prog2 version: ", version.Version)
}
