# distutils: language=c
# cython: language_level=3

cdef extern from "c_extension.h":
    double func(
        double x
    ) nogil


def c_func(x):
    """c_func.

    Return :math:`x^2`.

    Parameters
    ----------
    x : numeric.

    Returns
    -------
    res : numeric.

    """
    cdef double d = x
    with nogil:
        res = func(d)
    return res
