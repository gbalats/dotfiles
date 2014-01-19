INSTALL    := install

# Source Directories
LBDIR      := ./lb
BINDIR     := ./bin
CONFDIR    := ./config
ELISPDIR   := ./elisp

# Target Directories
EMACSDIR   := $(HOME)/.emacs.d
PROFILEDIR := $(HOME)/.profile.d

# Configuration files
CONFIG     := $(wildcard $(CONFDIR)/*)
CONFIG     += $(addprefix $(CONFDIR)/, msmtprc)
HIDDEN     := $(CONFIG:$(CONFDIR)/%=$(HOME)/.%)

# Elisp files
ELISP = $(ELISPDIR)/init.el $(wildcard $(ELISPDIR)/lib/*.el)

THESAURUS_URL = ftp://ibiblio.org/pub/docs/books/gutenberg/etext02/mthes10.zip

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

vpath %.sh $(BINDIR)/

$(CONFDIR)/msmtprc: msmtprc.sh
	$< $@

##########################
# Installing Elisp files #
##########################

vpath %.el $(ELISPDIR)/

.PHONY: elisp
elisp: $(ELISP:$(ELISPDIR)/%.el=$(EMACSDIR)/%.el)

$(EMACSDIR)/%.el: %.el
	@echo "... [elisp] installing $* ..."
	$(INSTALL) -m 444 -D $< $@

thesaurus := $(EMACSDIR)/thesaurus/mthesaur.txt

.PHONY: thesaurus
thesaurus: $(thesaurus)

$(thesaurus):
	@echo "... [elisp] downloading thesaurus ..."
	@wget $(THESAURUS_URL) -O mthesaur.zip
	@unzip mthesaur.zip -d $(@D)
	@rm mthesaur.zip

##################################
# Installing LogicBlox utilities #
##################################

vpath %.sh $(LBDIR)/

.PHONY: lbenv
lbenv: $(addprefix $(PROFILEDIR)/lb-,$(LB_ENV))

$(PROFILEDIR)/lb-%.sh: %.sh
	@echo "... [lb] installing $* ..."
	$(INSTALL) -m 444 -D $< $@

#################
# Phony Targets #
#################

.PHONY: all install
