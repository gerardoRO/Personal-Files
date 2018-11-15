(require 'package)

(package-initialize)
;; load emacs 24 package system. Add MELP repository

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))

;;(package-refresh-contents)

(defvar prelude-packages
  '(python solarized-theme matlab-mode multiple-cursors anaconda-mode monokai-theme))

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
	when (not (packages-installed-p p)) do (return nil)
	finally (return t)))

(dolist (p prelude-packages)
  (when (not (package-installed-p p))
    (package-install p)))

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
(global-set-key (kbd "C-c S-a") 'mc/mark-next-word-like-this) ;; add multiple cursors at whole words
;;========================================================================
;; Theme
(if (eq system-type 'cygwin)
    (load-theme 'solarized t)
  (load-theme 'monokai t)
)

(set-terminal-parameter nil 'background-mode 'dark)


;;========================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(package-selected-packages
   (quote
    (hideshow-org anaconda-mode solarized-theme multiple-cursors matlab-mode color-theme-solarized airplay)))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
