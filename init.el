;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((startup-time (current-time)))
  (setq inhibit-startup-echo-area-message
	"kyle")
  (setq lisp-base "~/.emacs.d/lisp/")
  (setq lisp-files '("custom.el"    ; first, load customized-*
		     "util.el"      ; load any utilities needed
		     "personal.el"  ; any high-level customisations
		     "enabled.el"   ; turn on any default-disabled functions
		     "c.el"         ; for maximum fun
		     "scpaste.el"   ; scpaste is great for sharing things
		     "go.el"        ; go go go!
		     ))

  ;; load the lisp files
  (mapcar #'load
	  (mapcar (lambda (el)
		    (concat lisp-base el))
		  lisp-files))

  ;; set eshell path after exec-path is finalised
  (setenv "PATH"
	  (mapconcat (lambda (dir)
		       (or dir "."))
		     exec-path
		     path-separator))

  (message (format "Start up time: %0.3f ms"
		   (* 1000
		      (time-delta-to-number
		       (time-subtract
			(current-time)
			startup-time))))))

(global-font-lock-mode 0)
