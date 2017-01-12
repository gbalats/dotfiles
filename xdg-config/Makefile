# Set configuration home according to XDG standard
CONFIG_HOME ?= $(or $(XDG_CONFIG_HOME),$(HOME)/.config)

.PHONY: all

all:
	rsync -a ./ $(CONFIG_HOME)
