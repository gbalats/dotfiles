;;; Commentary:

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'key-bindings)

;;; Code:

(provide 'key-bindings)

;; set the keybinding so that f3 will start the shell
(global-set-key [f3] 'shell)

;; set the keybinding so that you can use f4 for goto line
(global-set-key [f4] 'goto-line)

;; set the keybinding so that you can use f5 to toggle easy keys (e.g. arrows, Home, etc)
(global-set-key [f5] 'no-easy-keys-minor-mode)
