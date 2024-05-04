python_cmd := python

clean:
	pip uninstall -y testing_actions
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

test:
	python -m pydocstyle convention=numpy testing_actions
	python -m pytest --codestyle --cov=./ --cov-report=xml
	python -m build
	python -m twine check dist/*

submitcoverage:
	python -m codecov

upload_wheel_pypi_test:
	python -m build
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*

upload_wheel_pypi:
	python -m build
	twine upload dist/*

upload_source_pypi_test:
	python -m build
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*

upload_source_pypi:
	python -m build
	twine upload dist/*

upload_manylinux_pypi_test:
	twine upload --repository-url https://test.pypi.org/legacy/ wheelhouse/*-manylinux*.whl

upload_manylinux_pypi:
	twine upload wheelhouse/*-manylinux*.whl
