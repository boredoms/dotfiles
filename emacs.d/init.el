;; init.el
;; (package-inilialize)


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(when (version< emacs-version "24.4")
  (error "This config requires at least Emacs 24.4 to work"))

(message "Girls are setting up emacs, please wait warmly!")
;;(setq debug-on-error t)

;; load latest bytecode
(setq load-prefer-newer t)

;; setting up base directory
(defvar yukari-root-dir (file-name-directory load-file-name)
  "The directory of this init.el file")
(defvar yukari-base-dir (expand-file-name "base" yukari-root-dir)
  "Directory containing the base of this config")
(defvar yukari-user-dir (expand-file-name "user" yukari-root-dir)
  "Directory containing any user customization")
(defvar yukari-modules-dir (expand-file-name "modules" yukari-root-dir)
  "Directory containing modular customization")
(defvar yukari-backup-dir (expand-file-name "backup" yukari-root-dir)
  "Directory containing automatically generated backups of edited files")

;; add these folders to the load path
(add-to-list 'load-path yukari-base-dir)
(add-to-list 'load-path yukari-modules-dir)

;; make garbage collection happen after 10MB of allocated data instead of
;; the default 800kB
(setq gc-cons-threshold 10000000)

;; warning on opnening files biffer than 10MB
(setq large-file-warning-threshold 10000000)

;; include base modules
(require 'yukari-packages)
(require 'yukari-ui)
(require 'yukari-custom)
(require 'yukari-base)
(require 'yukari-editing)

;; when on MacOS load this extra module
(when (eq system-type 'darwin)
  (require 'yukari-osx))

;; module stuff goes here
(require 'yukari-evil)
(require 'yukari-company)
(require 'yukari-flycheck)

(require 'yukari-elisp)
;; test



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (slime highlight-quoted elisp-mode evil guide-key undo-tree use-package smart-mode-line miniedit exec-path-from-shell auto-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
