"""test_pyfunc.py.

"""

from package import py_func
from numpy import allclose


def test_pyfunc():

    for i in range(100):
        x = i / 10
        assert allclose(py_func(x), x ** 2)
