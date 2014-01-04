(defvar prelude-packages
  '(auctex clojure-mode coffee-mode deft expand-region
           gist groovy-mode haskell-mode magit magithub
           markdown-mode paredit projectile python
           rainbow-mode solarized-theme volatile-highlights
           yaml-mode yari zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available 
(when (not package-archive-contents)
  (package-refresh-contents))

;; install the missing packages
(dolist (package prelude-packages)
  (when (not (package-installed-p package))
    (package-install package)))

(provide 'prelude-packages)
;;; prelude-packages.el ends here
