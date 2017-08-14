(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; always indent new lines
(global-set-key (kbd "RET") 'newline-and-indent)

(setq require-final-newline t)

(delete-selection-mode t)

;; reverts buffers associated with files that changed on disk
(global-auto-revert-mode t)

;; C-x u to view the undo tree
(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

;; smart tab behaviour; indent or complete
(setq tab-always-indent 'complete)

(global-hl-line-mode t)


(provide 'yukari-editing)
