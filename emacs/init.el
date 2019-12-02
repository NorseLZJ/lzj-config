(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-custom)


(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

