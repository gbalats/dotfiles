# Configuration files
config := $(wildcard *.bak)
config += msmtprc.bak

include ../common.mk
vpath %.sh bin/

# Installing configuration files

.PHONY: all
all: $(patsubst %.bak,$(HOME)/.%,$(config))

$(HOME)/.%: %.bak
	@echo "... installing $(@F) ..."
	$(INSTALL) -m 400 $< $@

# Generating .msmtprc (contains sensitive data)

msmtprc.bak: msmtprc.sh
	$< $@
