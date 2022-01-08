;; ===================================
;; MELPA Package Support
;; ===================================

;; Enable package support
(require 'package)
(package-initialize)
;; load emacs 24 package system. Add MELP repository

(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)


(package-refresh-contents t)  ;; t runs it asynchronously. This is an issue if there's a new ppackage, since it ends up not being found. (Not sure why, since package-archives should have it.

(defvar prelude-packages
  '(python
    flycheck
    solarized-theme
    ein
    matlab-mode
    py-autopep8
    magit
    blacken
    multiple-cursors
    anaconda-mode
    monokai-theme
    elpy
    jedi
    better-defaults
    material-theme))


(dolist (p prelude-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;;========================================================================
;;;; Line numbers
;;;;========================================================================

(global-linum-mode t)
(setq linum-format "%3d\u2502")

;;;;========================================================================
;;;; backup
;;;;========================================================================


(setq make-backup-files nil)
;;move all backups to centralized folder
(setq backup-directory-alist '((".","~/.emacs.d/backup")) 
      backup-by-copying t ;; don't delete hardlinks
      version-control t ;; keep versions
      delete-old-versions t
      kept-new-versions 20
      kept-old-versions 5
      )

;;;;========================================================================
;;;; multiple cursors prorgram
;;;;========================================================================
(require 'multiple-cursors)

(global-set-key (kbd "C-c m") 'mc/edit-lines) ;; add multiple continuous cursors
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this) ;; add multiple cursors to all like this
(global-set-key (kbd "C-c S-a") 'mc/mark-next-word-like-this) ;; add multiple cursors at whole words

;;;;========================================================================
(set-terminal-parameter nil 'background-mode 'dark)

;;;;========================================================================
;;;; python
;;;;========================================================================
 
(elpy-enable)
(require 'elpy)

(setq python-shell-interpreter "jupyter";;"python3"
      python-shell-interpreter-args "console --simple-prompt" ;;"-i"
      python-shell-prompt-detect-failure-warning nil)
;;      elpy-rpc-backend "jedi"
;;      elpy-rpc-python-command "python3")

(add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter" t)



(when (require 'flycheck nil)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


(getenv "WORKON_HOME")
