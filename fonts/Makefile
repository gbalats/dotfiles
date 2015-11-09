font_dir   := $(HOME)/.fonts
font_files := $(wildcard *.otf)

include ../common.mk

.PHONY: all
all: $(addprefix $(font_dir)/,$(font_files))

$(font_dir)/%.otf: %.otf | $(font_dir)
	@echo "... installing fonts $(@F) ..."
	$(INSTALL) -m 400 $< $@

$(font_dir):
	mkdir -p $@

.PHONY: install
install:
	fc-cache -vf $(font_dir)
