INSTALL = install

# Directories
SRCDIR   = ./config
OUTDIR   = $(HOME)
EMACSDIR = $(HOME)/.emacs.d
ELISP_SRCDIR = ./elisp
ELISP_OUTDIR = $(EMACSDIR)/include

# Configuration files
CONFIG = $(wildcard $(SRCDIR)/*)
HIDDEN = $(CONFIG:$(SRCDIR)/%=$(OUTDIR)/.%)

# Elisp files
ELISP_SRC = $(filter-out %/emacs.el, $(wildcard $(ELISP_SRCDIR)/*.el))
ELISP_OUT = $(ELISP_SRC:$(ELISP_SRCDIR)/%=$(ELISP_OUTDIR)/%)

all: install

install: $(HIDDEN) $(ELISP_OUT)

$(HIDDEN): $(OUTDIR)/.%: $(SRCDIR)/%
	@echo "... installing $(@F) ..."
	$(INSTALL) -m 444 $< $@

$(ELISP_OUT): $(ELISP_OUTDIR)/%.el: $(ELISP_SRCDIR)/%.el
	@echo "... (elisp) installing $* ..."
	$(INSTALL) -m 444 -D $< $@

elisp: $(ELISP_OUT)

.PHONY: all install elisp
