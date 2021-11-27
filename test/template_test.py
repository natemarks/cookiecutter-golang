"""Test variou executions of the cookiecutter
"""
import logging
import os
import pytest
import testinfra  # pylint: disable=W0611
from cookiecutter.main import cookiecutter

logging.basicConfig(level=logging.DEBUG)
log = logging.getLogger()

PROJECT_DIR = os.getcwd()


@pytest.mark.parametrize(
    "ccinput,expected",
    [
        ({"app_name": "fff"}, {"upper": "FFF"}),
        ({"app_name": "ggg"}, {"upper": "GGG"}),
    ],
)
class TestClass:  # pylint: disable=R0903
    """Table test the cookiecutter options"""

    def test_(
        self, host, tmp_path, ccinput, expected
    ):  # pylint: disable=R0201
        """Iterate on different cookiecutter json overrides"""
        os.chdir(tmp_path)
        log.info("tmpdir: %s", str(tmp_path))
        cookiecutter(
            PROJECT_DIR,
            no_input=True,
            extra_context={"app_name": ccinput["app_name"]},
        )
        assert ccinput["app_name"].upper() == expected["upper"]
        assert host.file(
            str(tmp_path) + "/" + ccinput["app_name"]
        ).exists
