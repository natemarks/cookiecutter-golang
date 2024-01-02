"""Test variou executions of the cookiecutter
"""
import logging
import pathlib
from cookiecutter.main import cookiecutter
import pytest

logging.basicConfig(level=logging.DEBUG)
log = logging.getLogger()
TEMPLATE_DIRECTORY = str(pathlib.Path(__file__).parent.parent)


@pytest.mark.unit
def test_paths(tmpdir):
    """test created paths

    :param tmpdir:
    :return:
    """
    cookiecutter(
        template=TEMPLATE_DIRECTORY,
        output_dir=str(tmpdir),
        no_input=True,
        extra_context={
            # "plugin_name": "foo",
            # "description": "blah",
            # "include_templates_directory": "y",
            # "include_static_directory": "y",
        },
    )
    assert cc_paths(tmpdir) == {
        "my_app",
        "my_app/.gitignore",
        "my_app/Dockerfile",
        "my_app/Makefile",
        "my_app/README.md",
        "my_app/cmd",
        "my_app/cmd/prog1",
        "my_app/cmd/prog1/main.go",
        "my_app/cmd/prog2",
        "my_app/cmd/prog2/main.go",
        "my_app/scripts",
        "my_app/scripts/init.sh",
        "my_app/version",
        "my_app/version/main.go",
    }


def cc_paths(directory):
    """return paths relative to directory"""
    results = list(pathlib.Path(directory).glob("**/*"))
    results = [r.relative_to(directory) for r in results]
    return {str(f) for f in results if str(f) != "."}
