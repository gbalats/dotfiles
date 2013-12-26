INSTALL = install

# Directories
BINDIR   = ./bin
CONFDIR  = ./config
ELISPDIR = ./elisp
EMACSDIR = $(HOME)/.emacs.d/lib

# Configuration files
CONFIG  = $(wildcard $(CONFDIR)/*)
CONFIG += $(addprefix $(CONFDIR)/, msmtprc)
HIDDEN  = $(CONFIG:$(CONFDIR)/%=$(HOME)/.%)

# Elisp files
ELISP = $(filter-out emacs.el, $(notdir $(wildcard $(ELISPDIR)/*.el)))

all: install
install: elisp $(HIDDEN) 

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

elisp: $(addprefix $(EMACSDIR)/, $(ELISP))

$(EMACSDIR)/%.el: $(ELISPDIR)/%.el
	@echo "... [elisp] installing $* ..."
	$(INSTALL) -m 444 -D $< $@

#################
# Phony Targets #
#################

.PHONY: all install elisp
