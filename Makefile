INSTALL = install

# Directories
SRCDIR = ./config
OUTDIR = $(HOME)

# Configuration files
CONFIG = $(notdir $(wildcard $(SRCDIR)/*))
HIDDEN = $(CONFIG:%=$(OUTDIR)/.%)

all: install

install: $(HIDDEN)

$(HIDDEN): $(OUTDIR)/.%: $(SRCDIR)/%
	@echo "Installing $(@F) ..."
	$(INSTALL) -m 444 $< $@

.PHONY: all install
