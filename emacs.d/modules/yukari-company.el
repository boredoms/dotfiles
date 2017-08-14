(use-package company
  :diminish company-mode
  ;:commands (company-mode global-company-mode company-complete
  ;                        company-complete-common company-manual-begin company-grab-line)
  :config
  (progn
    (setq company-idle-delay 0.1
          company-minimum-prefix-length 2
          company-tooltip-limit 10
          company-dabbrev-downcase nil
          company-dabbrev-code-ignore-case nil
          company-dabbrev-code-other-buffers t
          company-tooltip-align-annotations t
;          company-global-modes '(not eshell-mode erc-mode message-mode help-mode)
          company-frontends '(company-pseudo-tooltip-frontend company-echo-metadata-frontend)
          company-backends '(company-capf company-dabbrev company-ispell)
          company-transformers '(company-sort-by-occurrence))
    (global-company-mode 1)))

(use-package company-quickhelp
  :after company
  :bind (:map company-active-map
              ("C-h" . company-quickhelp-manual-begin))
  :config
  (progn
    (setq company-quickhelp-delay nil)
    (company-quickhelp-mode 1)))


(provide 'yukari-company)
