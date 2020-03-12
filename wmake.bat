@ECHO off

title testing_actions

pushd %~dp0

if "%1" == "clean" (
	deactivate
	rmdir /S /Q venv
	rmdir /S /Q dist
	rmdir /S /Q build
	rmdir /S /Q testing_actions.egg-info
) else if "%1" == "deactivate" (
	deactivate
) else if "%1" == "activate" (
	venv\Scripts\activate
) else if "%1" == "dev_install" (
    python -m pip install --user virtualenv ^
    && python -m virtualenv venv ^
    && venv\Scripts\activate ^
	&& python -m pip install --upgrade pip ^
	&& pip install -e . ^
	&& pip install -r requirements-dev.txt ^
	&& echo dev_install succeeded
) else if "%1" == "install" (
    python -m pip install --user virtualenv ^
	&& python -m virtualenv venv ^
	&& venv\Scripts\activate ^
	&& python -m pip install --upgrade pip ^
	&& pip install -e . ^
	&& echo install succeeded
) else if "%1" == "cython_install" (
	rem use this if you want to use cython to recrete the c file from the pyx file
	python -m pip install --user virtualenv ^
	&& python -m virtualenv venv ^
	&& venv\Scripts\activate ^
	&& python -m pip install --upgrade pip ^
	&& pip install -r requirements-dev.txt ^
	&& pip install -e . ^
	&& echo cython_install succeeded
) else if "%1" == "test" (
	venv\Scripts\activate ^
	&& python -m pydocstyle convention=numpy testing_actions ^
	&& python -m pytest --codestyle --cov=./ --cov-report=xml ^
	&& python setup.py sdist bdist_wheel ^
	&& python -m twine check dist/* ^
	&& echo tests succeeded
) else if "%1" == "submitcoverage" (
	venv\Scripts\activate ^
	&& python -m codecov ^
	&& echo coverage submitted
) else if "%1" == "upload_pypi_test" (
    venv\Scripts\activate ^
    && python setup.py sdist bdist_wheel ^
    && twine upload --repository-url https://test.pypi.org/legacy/ dist/*
) else if "%1" == "upload_pypi" (
    venv\Scripts\activate ^
    && python setup.py sdist bdist_wheel ^
    && twine upload dist/*
) else (
	echo Invalid option; must be either clean, dev_install, cython_install,
	echo install, test, submitcoverage, deactivate, activate,
	echo upload_pypi_test, or upload_pypi
)

popd