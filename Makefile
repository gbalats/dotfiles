INSTALL := install

all:

CONFIG_DIR   := ./config
CONFIG_FILES := $(wildcard $(CONFIG_DIR)/*.bak)

.PHONY: all
all: $(patsubst $(CONFIG_DIR)/%.bak,$(HOME)/.%,$(CONFIG_FILES))
$(HOME)/.%: $(CONFIG_DIR)/%.bak
	@echo "... installing $(@F) ..."
	$(INSTALL) -m 400 $< $@
