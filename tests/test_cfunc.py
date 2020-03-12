"""test_cfunc.py.

"""

from package import c_func
from numpy import allclose


def test_cfunc():

    for i in range(100):
        x = i / 10
        assert allclose(c_func(x), x ** 2)
