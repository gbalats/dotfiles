Environment
===========

This is a collection of configuration files and scripts that facilitates
the transition to a new workstation by automating the process of
installing them (by simply running `make`).

Emacs
-----

A list of emacs modules will be installed automatically via the
package-system (available for emacs versions &ge; 24) the first time
that emacs is executed (after `make` has installed all of its
targets).

Notes
-----

### Login Shell

On Debian-based distros, when you login via X *dash* is executed instead
of *bash*. This prohibits `~/.bash_profile` from loading when it should.

As a workaround, switch on the terminal emulator's option that runs
the (bash) command as a **login shell** by default. On Redhat-based
distros this is not necessary.
