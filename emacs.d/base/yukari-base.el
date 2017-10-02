(setq backup-directory-alist `(("." "~/.emacs.d/backups")))
(setq backup-by-copying t)

(setq delete-old-versions t
      kept-new-versions 5
      kept-old-versions 3
      version-control t)

(provide 'yukari-base)
