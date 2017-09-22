(use-package haskell-mode
  :defer t
  :mode (("\\.hs$" . haskell-mode)
         ("\\.cabal$" . haskell-cabal-mode))
  :interpreter (("runghc" . haskell-mode)
                ("runhaskell" . haskell-mode)))

(when (boundp 'company-backends)
  (use-package company-ghc
    :after haskell-mode
    :init (add-hook 'haskell-mode-hook #'ghc-comp-init)
    :config (add-to-list 'company-backends #'company-ghc)))

(use-package intero
  :after haskell-mode
  :config (intero-global-mode 1))


(provide 'yukari-haskell)

