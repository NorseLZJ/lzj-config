(tool-bar-mode -1)
(scroll-bar-mode -1)
(toggle-menu-bar-mode-from-frame -1)


(setq inhibit-splash-screen t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(global-hl-line-mode t)
(setq-default cursor-type 'hbar)

(provide 'init-ui)
