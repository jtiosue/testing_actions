#   Copyright 2020 Joseph T. Iosue
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

"""setup.py.

"""


from setuptools import setup, Extension

extensions = [
    Extension(
        name="testing_actions._c_extension",
        sources=[
            "./testing_actions/_c_extension.c",
            "./testing_actions/src/c_extension.c",
        ],
        include_dirs=["./testing_actions/src/"],
        language="c",
        py_limited_api=True,
    )
]

setup(ext_modules=extensions)
