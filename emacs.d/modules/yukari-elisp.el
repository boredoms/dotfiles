;;; yukari-elisp.el --- Settings for elisp mode
(use-package elisp-mode
  :defer t
  :ensure nil
  :config
  (progn
    (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
    (add-hook 'emacs-lisp-mode-hook 'auto-compile-on-save-mode)
    (add-hook 'emacs-lisp-mode-hook 'flycheck-mode)))

(use-package highlight-quoted
  :commands highlight-quoted-mode)

(use-package slime
  :config
  (progn
    (setq inferior-lisp-program "clisp")
    (require 'slime-fuzzy)))

(provide 'yukari-elisp)
