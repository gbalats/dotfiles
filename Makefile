include common.mk

# Components
config  := ./config
elisp   := ./elisp
lb      := ./lb
modules := $(elisp) $(lb) $(config)

.PHONY: install $(modules)
install: $(modules)

$(modules):
	$(MAKE) --directory=$@
