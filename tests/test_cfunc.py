"""test_cfunc.py.

"""

from testing_actions import c_func
from numpy import allclose


def test_cfunc():

    for i in range(100):
        x = i / 10
        assert allclose(c_func(x), x ** 2)
