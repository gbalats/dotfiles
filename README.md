Dotfiles
========

This is a collection of configuration files and scripts that facilitates
the transition to a new workstation by automating the process of
installing them (by simply running `make`).

Notes
-----

### Login Shell

On Debian-based distros, when you login via X *dash* is executed instead
of *bash*. This prohibits `~/.bash_profile` from loading when it should.

As a workaround, switch on the terminal emulator's option that runs
the (bash) command as a **login shell** by default. On Redhat-based
distros this is not necessary.
