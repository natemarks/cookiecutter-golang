package main

import (
	"fmt"
	"github.com/{{ cookiecutter.github_user}}/{{ cookiecutter.app_name }}/version"
)

func main() {
	fmt.Println("prog1 version: ", version.Version)
}
