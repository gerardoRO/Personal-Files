(require 'package)


;; load emacs 24 package system. Add MELP repository
(add-to-list 'package-archives
	     '("melpa" .
	       "http://melpa.milkbox.net/packages/") t)


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;========================================================================
;; theme
;; not really sure what ended up working but also did package-install: color-theme-solarized
(load-theme 'solarized t) ;; loads solarized theme
(set-terminal-parameter nil 'background-mode 'dark) ;; dark background
(set-face-attribute 'font-lock-comment-face nil :foreground "brightred") ;;changes the comment color
(set-face-italic 'font-lock-comment-face nil) ;; eliminates italic of the comments


;;========================================================================
;; Line numbers
(global-linum-mode t)
(setq linum-format "%3d\u2502")

;;========================================================================
;; backup
(setq backup-by-copying t              ; don't clobber symlinks
backup-directory-alist
      '(("." . "~/.emacs.d/backups/")) ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)               ; use versioned backups

;;========================================================================
;; multiple cursors prorgram
(require 'multiple-cursors)

(global-set-key (kbd "C-c m") 'mc/edit-lines) ;; add multiple continuous cursors
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this) ;; add multiple cursors to all like this

;;========================================================================

;; ;;autosave
;;(setq auto-save-file-name-transforms
      ;;'((".*",temporary-file-directory t)))

;;========================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages (quote (multiple-cursors solarized-theme anaconda-mode)))
 '(solarized-italic nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
