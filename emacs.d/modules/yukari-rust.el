(use-package rust-mode
  :mode "\\.rs\\"
  :init (add-hook 'rust-mode-hook #'flycheck-mode))

(use-package racer
  :after rust-mode
  :init (add-hook 'rust-mode-hook #'(progn
                                      (racer-mode)
                                      (eldoc-mode)
                                      (flycheck-rust-setup))))
                                      
 

(use-package flycheck-rust
  :after rust-mode)

(when (boundp 'company-backends)
  (use-package company-racer
    :after racer
    :config (add-to-list 'company-backends 'company-racer)))

(provide 'yukari-rust)
