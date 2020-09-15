# Copyright 2014-2020, Stephen Fryatt (info@stevefryatt.org.uk)
#
# This file is part of WimpLib:
#
#   http://www.stevefryatt.org.uk/software/
#
# Licensed under the EUPL, Version 1.2 only (the "Licence");
# You may not use this work except in compliance with the
# Licence.
#
# You may obtain a copy of the Licence at:
#
#   http://joinup.ec.europa.eu/software/page/eupl
#
# Unless required by applicable law or agreed to in
# writing, software distributed under the Licence is
# distributed on an "AS IS" basis, WITHOUT WARRANTIES
# OR CONDITIONS OF ANY KIND, either express or implied.
#
# See the Licence for the specific language governing
# permissions and limitations under the Licence.

# This file really needs to be run by GNUMake.
# It is intended for native compilation on Linux (for use in a GCCSDK
# environment) or cross-compilation under the GCCSDK.

.PHONY: all libs clean documentation release install


# The build date.

BUILD_DATE := $(shell date "+%d %b %Y")
HELP_DATE := $(shell date "+%-d %B %Y")

# Construct version or revision information.

ifeq ($(VERSION),)
  RELEASE := $(shell git describe --always)
  VERSION := $(RELEASE)
  HELP_VERSION := ----
else
  RELEASE := $(subst .,,$(VERSION))
  HELP_VERSION := $(VERSION)
endif

$(info Building with version $(VERSION) ($(RELEASE)) on date $(BUILD_DATE))

# The archive to assemble the release files in.  If $(RELEASE) is set, then the file can be given
# a standard version number suffix.

ZIPFILE := wimplib$(RELEASE).zip
SRCZIPFILE := wimplib$(RELEASE)src.zip
BUZIPFILE := wimplib$(shell date "+%Y%m%d").zip


# Build Tools

MKDIR := mkdir -p
RM := rm -rf
CP := cp

ZIP := $(GCCSDK_INSTALL_ENV)/bin/zip
INSTALL := $(GCCSDK_INSTALL_ENV)/ro-install

MANTOOLS := $(SFTOOLS_BIN)/mantools
BINDHELP := $(SFTOOLS_BIN)/bindhelp
TEXTMERGE := $(SFTOOLS_BIN)/textmerge
MENUGEN := $(SFTOOLS_BIN)/menugen
TOKENIZE := $(SFTOOLS_BIN)/tokenize


# Build Flags

ZIPFLAGS := -x "*/.svn/*" -r -, -9
SRCZIPFLAGS := -x "*/.svn/*" -r -9
BUZIPFLAGS := -x "*/.svn/*" -r -9
BINDHELPFLAGS := -f -r -v
MENUGENFLAGS := -d
TOKFLAGS :=


# Set up the various build directories.

SRCDIR := src
MANUAL := manual
OUTDIR := build
TXTDIR := Text
BASDIR := BASIC

# Set up the named target files.

README := ReadMe,fff
LICENCE := Licence,fff
LIBRARIES := Config.bbt Date.bbt Icon.bbt LegacyWimp.bbt Legacy3D.bbt Menu.bbt		\
             Message.bbt Resources.bbt String.bbt Template.bbt Url.bbt WimpError.bbt	\
             WimpLib.bbt WimpSprite.bbt Window.bbt

# Set up the source files.

MANSRC := Source
MANSPR := ManSprite
LICSRC := Licence
SWINAMES := TokenizeSWIs.h

# Build everything, but don't package it for release.

all: libs documentation

# Build the libraries

libs: $(addprefix $(OUTDIR)/$(BASDIR)/, $(LIBRARIES:.bbt=,ffb)) $(addprefix $(OUTDIR)/$(TXTDIR)/, $(LIBRARIES:.bbt=,fd1))

$(OUTDIR)/$(BASDIR)/%,ffb: $(SRCDIR)/%.bbt $(OUTDIR)/$(BASDIR)
	$(TOKENIZE) $(TOKFLAGS) $< -out $@

$(OUTDIR)/$(TXTDIR)/%,fd1: $(SRCDIR)/%.bbt $(OUTDIR)/$(TXTDIR)
	$(CP) $< $@

# Create a folder to take the output.

$(OUTDIR)/$(TXTDIR): $(OUTDIR)
	$(MKDIR) $(OUTDIR)/$(TXTDIR)

$(OUTDIR)/$(BASDIR): $(OUTDIR)
	$(MKDIR) $(OUTDIR)/$(BASDIR)

$(OUTDIR):
	$(MKDIR) $(OUTDIR)

# Build the documentation

documentation: $(OUTDIR)/$(README) $(OUTDIR)/$(LICENCE)

$(OUTDIR)/$(README): $(MANUAL)/$(MANSRC)
	$(MANTOOLS) -MTEXT -I$(MANUAL)/$(MANSRC) -O$(OUTDIR)/$(README) -D'version=$(HELP_VERSION)' -D'date=$(HELP_DATE)'

$(OUTDIR)/$(LICENCE): $(LICSRC)
	$(CP) $(LICSRC) $(OUTDIR)/$(LICENCE)


# Build the release Zip file.

release: clean all
	$(RM) ../$(ZIPFILE)
	(cd $(OUTDIR) ; $(ZIP) $(ZIPFLAGS) ../../$(ZIPFILE) $(README) $(LICENCE) $(TXTDIR) $(BASDIR))
	$(RM) ../$(SRCZIPFILE)
	$(ZIP) $(SRCZIPFLAGS) ../$(SRCZIPFILE) $(SRCDIR) $(OUTDIR) $(MANUAL) Makefile


# Build a backup Zip file

backup:
	$(RM) ../$(BUZIPFILE)
	$(ZIP) $(BUZIPFLAGS) ../$(BUZIPFILE) *


# Install the finished version in the SFTools folder, ready for use.  It's not a
# striaghtforward copy, as we need to strip the file extensions that are in build/
# for the benefit of the RISC OS target.

install: clean all
	$(MKDIR) $(SFTOOLS_BASIC)
	for f in $(LIBRARIES); do $(CP) $(SRCDIR)/$$f $(SFTOOLS_BASIC)/$${f%.bbt}; done
	$(INSTALL) $(OUTDIR)/$(SWINAMES) $(GCCSDK_INSTALL_ENV)/include/$(SWINAMES)


# Clean targets

clean:
	$(RM) $(OUTDIR)/$(README)
	$(RM) $(OUTDIR)/$(TXTDIR)/*
	$(RM) $(OUTDIR)/$(BASDIR)/*
	$(RM) $(OUTDIR)/$(LICENCE)
