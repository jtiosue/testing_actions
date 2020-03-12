python_cmd := python

clean:
	pip uninstall testing_actions
	rm -rf dist
	rm -rf build
	rm -rf testing_actions.egg-info

install:
	pip install --upgrade pip
	pip install -e .

dev_install:
	pip install --upgrade pip
	pip install -e .
	pip install -r requirements-dev.txt

cython_install:
	pip install --upgrade pip
	pip install -r requirements-dev.txt
	pip install -e .

test:
	python -m pydocstyle convention=numpy testing_actions
	python -m pytest --codestyle --cov=./ --cov-report=xml
	python setup.py sdist bdist_wheel
	python -m twine check dist/*

submitcoverage:
	python -m codecov

upload_pypi_test:
	python setup.py sdist bdist_wheel
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*

upload_pypi:
	python setup.py sdist bdist_wheel
	twine upload dist/*

upload_manylinux_pypi_test:
	twine upload --repository-url https://test.pypi.org/legacy/ wheelhouse/*-manylinux*.whl

upload_manylinux_pypi:
	twine upload wheelhouse/*-manylinux*.whl
