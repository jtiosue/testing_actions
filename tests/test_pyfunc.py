"""test_pyfunc.py.

"""

from testing_actions import py_func
from numpy import allclose


def test_pyfunc():

    for i in range(100):
        x = i / 10
        assert allclose(py_func(x), x ** 2)
