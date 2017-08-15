;;; yukari-company.el --- Settings for flycheck syntax checker
;;; Commentary:
;;;; Sets up some sane defaults for flycheck to provide syntax
;;;; checking without it hogging too much resources.
;;; Code:
(use-package flycheck
  :after evil
  :commands (flycheck-mode flycheck-list-errors flycheck-buffer)
  :config
  (progn
    (defun yukari/flycheck-on-esc ()
      (when flycheck-mode
        (ignore-errors (flycheck-buffer))
        nil))
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (add-hook 'evil-insert-state-exit-hook #'yukari/flycheck-on-esc)))


(use-package flycheck-pos-tip
  :after flycheck
  :config
  (progn
    (setq flycheck-pos-tip-timeout 10
          flycheck-display-errors-delay 0.5)
    (flycheck-pos-tip-mode 1)))

(provide 'yukari-flycheck)
;;; yukari-flycheck.el ends here
