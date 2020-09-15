WimpLib
=======

BASIC Routines for Wimp Programming on RISC OS.


Introduction
------------

WimpLib is a set of BASIC libraries for use with RISC OS software. Supplied mainly to allow my other software to be built, they can also be used in their own right as part of software licensed under the EUPL or one of its "compatible licences" (such as the GPL v2).

The library files are stored as plain text, and can be built into two formats: standard tokenised BBC BASIC files, and untokenised "BASICTxt" files (type &FD1). It is the latter which will be required if building any of my software, as they are suitable for passing to Tokenize.

Documentation for the libraries -- such as it is -- is provided within the header and source files.


Installation
------------

To install and use WimpLib, it will be necessary to have suitable Linux system with a working installation of the [GCCSDK](http://www.riscos.info/index.php/GCCSDK).

It will also be necessary to ensure that the `SFTOOLS_BIN`, `$SFTOOLS_BASIC` and `$SFTOOLS_MAKE` variables are set to a suitable location within the current environment. For example

	export SFTOOLS_BIN=/home/steve/sftools/bin
	export SFTOOLS_BASIC=/home/steve/sftools/basic
	export SFTOOLS_MAKE=/home/steve/sftools/make

where the path is changed to suit your local settings and installation requirements. Finally, you will also need to have installed the Shared Makefiles, ManTools, PackTools and Tokenize.

To install WimpLib, use

	make install

from the root folder of the project, which will copy the BASICTxt files in to the location indicated by `$SFTOOLS_BASIC`. It will also copy the TokenizeSWIs.h file into `$GCCSDK_INSTALL_ENV/include/` so that it is available when tokenising BASIC code.

A ReadMe for WimpLib will be generated in the build folder, along with copies of the library files in both BASICTxt and toklenised BASIC formats.


Building for native use
-----------------------

To build WimpLib for use natively on RISC OS, you can use

	make release

and a Zip archive of the release will appear in the parent folder to the location of the project itself.


Licence
-------

WimpLib is licensed under the EUPL, Version 1.2 only (the "Licence"); you may not use this work except in compliance with the Licence.

You may obtain a copy of the Licence at <http://joinup.ec.europa.eu/software/page/eupl>.

Unless required by applicable law or agreed to in writing, software distributed under the Licence is distributed on an "**as is**"; basis, **without warranties or conditions of any kind**, either express or implied.

See the Licence for the specific language governing permissions and limitations under the Licence.