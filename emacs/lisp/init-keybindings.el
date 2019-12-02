
(setq package-check-signature nil)
(defun open-init-file() 
  (interactive) 
  (find-file "~/.emacs.d/init.el"))


(require 'recentf)
(recentf-mode 1)


(global-set-key (kbd "<f2>") 'open-init-file)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


(provide 'init-keybindings)
