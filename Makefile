include common.mk

# Components
config  := ./config ./xdg-config
fonts   := ./fonts
lb      := ./lb
modules := $(fonts) $(lb) $(config)

.PHONY: install $(modules)
install: $(modules)

$(modules):
	$(MAKE) --directory=$@
