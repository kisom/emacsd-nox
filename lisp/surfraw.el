;;; shell user's revolutionary front rage against the web
;;;
;;; Surfraw provides a fast unix command line interface to a variety
;;; of popular WWW search engines and other artifacts of power. It
;;; reclaims google, altavista, babelfish, dejanews, freshmeat,
;;; research index, slashdot and many others from the false-prophet,
;;; pox-infested heathen lands of html-forms, placing these wonders
;;; where they belong, deep in unix heartland, as god loving
;;; extensions to the shell.
;;;
;;; See http://surfraw.org/.

(defun list-elvi-at (base)
  "List the elvi at a given base path."
  (let ((path (format "%s/lib/surfraw/" base)))
    (when (file-exists-p path)
      (split-string
       (shell-command-to-string
	(concat "ls " path " | xargs"))))))

(defun slash-dir-p (path)
  "Does the string represent a name with a trailing slash?"
  (and (file-exists-p path)
       (file-directory-p path)
       (string-suffix-p "/" path)))

(defun strip-trailing-slash (path)
    "In order to traverse a path upwards, we shall need to remove
the trailing slash from the directory name."
    (when (slash-dir-p path)
      (subseq path 0 -1)))

;;; Where oh where can I find the elvis?
(defvar *surfraw-places*
  (list "/usr/local" "/usr"
	(strip-trailing-slash
	 (file-name-directory
	  (strip-trailing-slash
	   (file-name-directory
	    (executable-find "surfraw")))))))

;;; Grab the first set of elvis that's non-empty.
(defvar *elvi-list*
  (reduce (lambda (x y)
	    (or x (list-elvi-at y)))
	  (rest *surfraw-places*)
	  :initial-value (list-elvi-at
			  (first *surfraw-places*))))

(defcustom *surfraw-browse* #'w3m-browse-url
  "Set the browser to use with surfraw.")

(defun surfraw (elvi args)
  "Reclaim the EmacsOS with the großartig surfraw."
  (interactive (list
		(completing-read "Elvi: " *elvi-list*)
		(read-string "Args: ")))
  (let ((surfraw-url
	 (shell-command-to-string
	  (format "surfraw -browser=/bin/echo %s %s" elvi args))))
    (funcall *surfraw-browse*  surfraw-url)))

;;; ...leave GUI tainted idolaters agape with fear and wonder.
