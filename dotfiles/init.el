(require 'package)

(package-initialize)
;; load emacs 24 package system. Add MELP repository

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))

(package-refresh-contents)

(defvar prelude-packages
  '(python solarized-theme matlab-mode multiple-cursors anaconda-mode))

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
	when (not (packages-installed-p p)) do (return nil)
	finally (return t)))

(dolist (p prelude-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;========================================================================
;; Theme
(require 'solarized-theme)
(load-theme 'solarized t)

;;========================================================================
;; Line numbers
(global-linum-mode t)
(setq linum-format "%3d\u2502")

;;========================================================================
;; backup
(setq make-backup-files nil)

;;========================================================================
;; multiple cursors prorgram
(require 'multiple-cursors)

(global-set-key (kbd "C-c m") 'mc/edit-lines) ;; add multiple continuous cursors
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this) ;; add multiple cursors to all like this
(global-set-key (kbd "C-S-a") 'mc/mark-next-word-like-this) ;; add multiple cursors at whole words

;;========================================================================
