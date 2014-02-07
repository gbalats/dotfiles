# LogicBlox utilities

env.scripts = $(wildcard *.sh)

include ../common.mk

# Installing LogicBlox utilities

.PHONY: all
all: $(addprefix $(profile.dir)/lb-,$(env.scripts))

$(profile.dir)/lb-%.sh: %.sh
	@echo "... [lb] installing $* ..."
	$(INSTALL) -m 444 -D $< $@
