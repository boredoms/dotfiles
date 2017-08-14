;; disable window decorations and bars
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)

;; nicer scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(line-number-mode -1)
(column-number-mode -1)
(size-indication-mode -1)

;; stop having to type yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; smart mode line
(use-package smart-mode-line)

;; make the minibuffer nicer to use on multi-line output
;; invoke with C-M-e
(use-package miniedit
  :commands minibuffer-edit
  :init (miniedit-install))

;; provide help with keyboard shortcuts
(use-package guide-key
  :defer t
  :diminish guide-key-mode
  :config
  (progn
    (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c"))
    (guide-key-mode 1)))

;; enable unicode coding
(prefer-coding-system 'utf-8)

;; set up a dark theme
(use-package noctilux-theme
  :config
  (load-theme 'noctilux t))

(provide 'yukari-ui)
