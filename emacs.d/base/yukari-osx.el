;; This file contains some MacOS specific customization

(require 'use-package)
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; MacOS' ls does not support the dired flag natively, therefore we attempt to
;; use gls for dired if available.
(if (file-exists-p "/usr/local/bin/gls")
    (setq insert-directory-program "/usr/local/bin/gls")
  (message "Could not find GNU coreutils ls. Please install coreutils via homebrew. Functionality in dired mode may be limited."))

;; The menu bar is not intrusive in OSX, so we might as well enable it
(menu-bar-mode 1)

;; enable emoji
(if (fboundp 'set-fontset-font)
    (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))

(provide 'yukari-osx)
