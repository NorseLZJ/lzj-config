(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)
(global-linum-mode t)

(abbrev-mode t) 
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)
(setq-default auto-save-hook nil)
(setq-default backup-directory-alist (quote (("." . "~/.emacs-backups"))))

(recentf-mode t)
(setq-default recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(setq-default x-select-enable-clipboard-manager nil)

(provide 'init-better-defaults)
