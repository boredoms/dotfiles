(require 'package)

;; add melpa to package list
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/") t))

(setq package-user-dir (expand-file-name "elpa" yukari-root-dir))
(package-initialize)

;; install use-package first, it helps keep everything else clean
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))

;; install further packages
(use-package dash)

(provide 'yukari-packages)
