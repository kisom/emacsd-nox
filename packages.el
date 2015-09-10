;;; This is a list of packages that are currently installed. This file
;;; should be compiled when the emacs lisp files are first loaded.

(require 'package)
(package-initialize)

(or (load (format "%sinitial-packages" lisp-base))
    (load (format "%sinitial-packages" lisp-base)))

(add-to-list 'package-archives
   '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
   '("melpa" . "http://melpa.org/packages/"))
(package-refresh-contents)

(load (format "%s/%s" (getenv "HOME") ".emacs.d/initial-packages.el"))

(dolist (package initial-package-list)
  (unless (package-installed-p package)
    (package-install package)))
