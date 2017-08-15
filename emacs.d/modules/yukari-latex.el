(use-package tex
  :ensure auctex
  :init
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-PDF-mode t))

;; Settings for MacOS
(when (eq system-type 'darwin)
  (setq TeX-view-program-selection
        '((output-dvi "DVI Viewer")
          (output-pdf "PDF Viewer")
          (output-html "HTML Viewer")))

  (setq TeX-viewer-program-list
        '(("DVI Viewer" "open %o")
          ("PDF Viewer" "open %o")
          ("HTML Viewer" "open %o"))))

(use-package company-auctex
  :after company
  :config
  (company-auctex-init))

(provide 'yukari-latex)
