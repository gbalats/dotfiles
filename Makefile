include common.mk

# Components
config  := ./config
emacs   := ./emacs
lb      := ./lb
modules := $(emacs) $(lb) $(config)

.PHONY: install $(modules)
install: $(modules)

$(modules):
	$(MAKE) --directory=$@
