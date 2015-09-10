(global-font-lock-mode 0)

;; set up package handling
(require 'package)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; reduce brain damage
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(setq display-time-24hr-format t)
(display-time-mode)
(global-set-key (kbd "C-x m") 'eshell)

;; ido-mode makes finding files way more awesome
;;    note: C-x C-f C-f will kick back to normal find-file for when ido's tab
;;    completion is getting in the way.
(require 'ido)
(ido-mode 1)

;; magit, not yours
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; undo-tree is undo done right
(require 'undo-tree)
(global-undo-tree-mode)

;; i like refilling paragraphs
(global-set-key (kbd "M-q") 'fill-paragraph)

;; i install things to /usr/local
(add-to-list 'exec-path "/usr/local/bin")

;; tell me where i'm at
(column-number-mode)

;; ansi-term is sometimes more useful than eterm
(global-set-key (kbd "C-x t")
		(lambda () (interactive)
		  (ansi-term "/bin/bash")))

;; the timestamping functions are in util.el
(global-set-key (kbd "C-c t t") 'k-insert-timestamp)
(global-set-key (kbd "C-c t d") 'k-insert-date)

;; man-page lookups.
(global-set-key (kbd "C-h u") 'woman)
(global-set-key (kbd "C-h U") 'woman-only)

;; liberate the emacs OS
(global-set-key (kbd "C-c b") 'surfraw)
