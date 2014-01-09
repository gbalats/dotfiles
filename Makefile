INSTALL = install

# Source Directories
LBDIR    = ./lb
BINDIR   = ./bin
CONFDIR  = ./config
ELISPDIR = ./elisp

# Target Directories
EMACSDIR   = $(HOME)/.emacs.d
PROFILEDIR = $(HOME)/.profile.d

# Configuration files
CONFIG  = $(wildcard $(CONFDIR)/*)
CONFIG += $(addprefix $(CONFDIR)/, msmtprc)
HIDDEN  = $(CONFIG:$(CONFDIR)/%=$(HOME)/.%)

# Elisp files
ELISP = $(ELISPDIR)/init.el $(wildcard $(ELISPDIR)/lib/*.el)

# LogicBlox utilities
LB_ENV = $(notdir $(wildcard $(LBDIR)/*-env.sh))


all: install
install: elisp lbenv $(HIDDEN)

##################################
# Installing configuration files #
##################################

$(HOME)/.%: $(CONFDIR)/%
	@echo "... installing $(@F) ..."
	$(INSTALL) -m 400 $< $@

#################################################
# Generating .msmtprc (contains sensitive data) #
#################################################

$(CONFDIR)/msmtprc: $(BINDIR)/msmtprc.sh
	$< $@

##########################
# Installing Elisp files #
##########################

elisp: $(ELISP:$(ELISPDIR)/%.el=$(EMACSDIR)/%.el)

$(EMACSDIR)/%.el: $(ELISPDIR)/%.el
	@echo "... [elisp] installing $* ..."
	$(INSTALL) -m 444 -D $< $@

##################################
# Installing LogicBlox utilities #
##################################

lbenv: $(addprefix $(PROFILEDIR)/lb-,$(LB_ENV))

$(PROFILEDIR)/lb-%.sh: $(LBDIR)/%.sh
	@echo "... [lb] installing $* ..."
	$(INSTALL) -m 444 -D $< $@

#################
# Phony Targets #
#################

.PHONY: all install elisp
