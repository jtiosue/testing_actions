Testing GitHub Actions CI
=========================

Testing CI and PyPI deployment with GitHub Actions for a Python Package with C Extensions.

*master branch*

.. image:: https://github.com/jiosue/testing_actions/workflows/Testing/badge.svg?branch=master
    :target: https://github.com/jiosue/testing_actions/actions?query=workflow%3ATesting+branch%3Amaster
    :alt: GitHub Actions CI
.. image:: https://codecov.io/gh/jiosue/testing_actions/branch/master/graph/badge.svg
    :target: https://codecov.io/gh/jiosue/testing_actions
    :alt: Code Coverage
    
    
*dev branch* (doesn't use Cython)

.. image:: https://github.com/jiosue/testing_actions/workflows/Testing/badge.svg?branch=dev
    :target: https://github.com/jiosue/testing_actions/actions?query=workflow%3ATesting+branch%3Adev
    :alt: GitHub Actions CI
.. image:: https://codecov.io/gh/jiosue/testing_actions/branch/dev/graph/badge.svg
    :target: https://codecov.io/gh/jiosue/testing_actions
    :alt: Code Coverage


Continuous Integration and Publishing to (Testing) PyPI with Github Actions. Everytime we push or pull request, the testing actions will be run. Everytime we release, the deploying actions will be run. The package is deployed to the Testing PyPI page, https://test.pypi.org/project/testing-actions/.
