python_cmd := python
virtualenv_cmd := $(python_cmd) -m virtualenv

clean:
	rm -rf venv
	rm -rf dist
	rm -rf build
	rm -rf testing_actions.egg-info

install:
	$(python_cmd) -m pip install virtualenv
	$(virtualenv_cmd) venv
	. venv/bin/activate && pip install --upgrade pip
	. venv/bin/activate && pip install -e .

dev_install:
	$(python_cmd) -m pip install virtualenv
	$(virtualenv_cmd) venv
	. venv/bin/activate && pip install --upgrade pip
	. venv/bin/activate && pip install -e .
	. venv/bin/activate && pip install -r requirements-dev.txt

cython_install:
	$(python_cmd) -m pip install virtualenv
	$(virtualenv_cmd) venv
	. venv/bin/activate && pip install --upgrade pip
	. venv/bin/activate && pip install -r requirements-dev.txt
	. venv/bin/activate && pip install -e .

test:
	. venv/bin/activate && python -m pydocstyle convention=numpy testing_actions
	. venv/bin/activate && python -m pytest --codestyle --cov=./ --cov-report=xml
	. venv/bin/activate && python setup.py sdist bdist_wheel
	. venv/bin/activate && python -m twine check dist/*

submitcoverage:
	. venv/bin/activate && python -m codecov

upload_pypi_test:
	. venv/bin/activate && twine upload --repository-url https://test.pypi.org/legacy/ dist/*

upload_pypi:
	. venv/bin/activate && twine upload dist/*

upload_manylinux_pypi_test:
	. venv/bin/activate && twine upload --repository-url https://test.pypi.org/legacy/ wheelhouse/*-manylinux*.whl

upload_manylinux_pypi:
	. venv/bin/activate && twine upload wheelhouse/*-manylinux*.whl
