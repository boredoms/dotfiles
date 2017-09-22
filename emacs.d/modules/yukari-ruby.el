(use-package ruby-mode
  :defer t
  :ensure nil
  :mode "\\.rb\\"
  :interpreter "ruby"
  :init (add-hook 'ruby-mode-hook #'flycheck-mode))

(use-package inf-ruby)

(when (boundp 'company-backends)
  (use-package company-inf-ruby))

(use-package rspec)
(use-package ruby-refactor)

(provide 'yukari-ruby)
