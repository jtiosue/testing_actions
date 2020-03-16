#include "Python.h"
#include "c_extension.h"

// Module info
static char _c_extension_name[] = "_c_extension";

static char _c_extension_docstring[] =
    "``testing_actions._c_extension`` is a module for interacting with\n"
    "with the C function ``func``";


// Define module functions; wrap the source code.

static char c_func_docstring[] =
    "func.\n\n"
    "Square a number\n\n"
    "Parameters\n"
    "----------\n"
    "x : float.\n"
    "    The number to square.\n\n"
    "Returns\n"
    "-------\n"
    "res : float.";


static PyObject* c_func(PyObject* self, PyObject* args) {
    double x;
    if (!PyArg_ParseTuple(args, "d", &x)) {
        return NULL;
    }
    double res = func(x);  // from source
    return Py_BuildValue("f", res);
}


// Create the module.

static PyMethodDef CExtensionMethods[] = {
    {
        "c_func",
        c_func,
        METH_VARARGS,
        c_func_docstring
    },
    {NULL, NULL, 0, NULL}  // Sentinel
};


static struct PyModuleDef CExtensionModule = {
    PyModuleDef_HEAD_INIT,
    _c_extension_name,  // name of module
    _c_extension_docstring,  // module documentation, may be NULL
    -1,  // size of per-interpreter state of the module,
         // or -1 if the module keeps state in global variables.
    CExtensionMethods
};


PyMODINIT_FUNC PyInit__c_extension(void) {
    // MUST BE PyInit_modulename.
    return PyModule_Create(&CExtensionModule);
}
