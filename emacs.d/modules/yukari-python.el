(use-package anaconda-mode
  :after python
  :init (progn
          (add-hook 'python-mode-hook #'anaconda-mode)
          (add-hook 'anaconda-mode-hook #'anaconda-eldoc-mode)))

(use-package pip-requirements)

(when (boundp 'company-backends)
  (use-package company-anaconda
    :after anaconda-mode
    :config (add-to-list 'company-backends 'company-anaconda)))

(provide 'yukari-python)
;;; yukari-python.el ends here
