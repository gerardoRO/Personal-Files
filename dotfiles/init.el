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
(add-hook 'after-init-hook (lambda () (load-theme 'misterioso)))
(add-to-list 'load-path "~/Repos/solarize-emacs")
;;(load-theme 'solarized-dark t)
;;(set-frame-parameter nil 'background-mode 'dark)


;;========================================================================
;; line numbers
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
;; autosave
;(setq auto-save-file-name-transforms
;      '((".*",temporary-file-directory t)))

;;========================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages (quote (multiple-cursors solarized-theme anaconda-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
