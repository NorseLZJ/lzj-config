;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;; global load path
(add-to-list 'load-path "~/.emacs.d/evil")

(require 'package)
(package-initialize)
(setq package-archives '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/") 
			 ("org-cn" . "http://elpa.emacs-china.org/org/") 
			 ("gnu-cn" . "http://elpa.emacs-china.org/gnu/")))
(require 'cl)
(defvar lzj/packages 
  '(
    ;; --- Auto-completion ---
    company
    auto-complete-clang
    ;; --- Better Editor ---
    hungry-delete swiper counsel smartparens ivy evil evil-escape
    ;; --- Major Mode ---
    js2-mode json-reformat
    ;; --- Minor Mode ---
    nodejs-repl 
    ;;
    exec-path-from-shell
    ;; --- Themes ---
    monokai-theme
    ;; solarized-theme

    ;; format
    format-all elisp-format
    ;; clang complete
    auto-complete-clang
    ;; syntax
    use-package flycheck

    ;; lisp
    elisp-slime-nav elisp-format evil-lisp-state

    ;; go
    go-mode go-autocomplete)
  "Default packages")

(setq package-selected-packages lzj/packages)

(defun lzj/packages-installed-p () 
  (loop for pkg in lzj/packages when (not (package-installed-p pkg)) do (return nil) finally (return
											      t)))
(unless (lzj/packages-installed-p) 
  (message "%s" "Refreshing package database...") 
  (package-refresh-contents) 
  (dolist (pkg lzj/packages) 
    (when (not (package-installed-p pkg)) 
      (package-install pkg))))

;; require
(require 'hungry-delete)
(require 'evil)
(require 'auto-complete-clang)
(require 'auto-complete-config)
(require 'smartparens-config)

(use-package 
  flycheck 
  :ensure t 
  :init (global-flycheck-mode))

(add-to-list 'lzj/packages 'monokai-theme)
(load-theme 'monokai t)


(add-hook 'js-mode-hook #'smartparens-mode)

;; mode
(global-company-mode t)
(delete-selection-mode t)
(global-hungry-delete-mode t)
(ivy-mode t)
(evil-mode t)
(evil-escape-mode t)
(format-all-mode t)
(smartparens-global-mode t)
(global-flycheck-mode t)

(setq ivy-use-virtual-buffers 1)
(setq enable-recursive-minnibuffers 1)
(setq-default evil-escape-delay 0.2)
(setq-default evil-escape-key-sequence "jk")
(setq x-select-enable-clipboard-manager nil)

(defun lzj-fs() 
  (interactive) 
  (json-pretty-print-buffer))

(global-set-key (kbd "<f5>") 'lzj-fs)

(define-key ac-mode-map  [(control tab)] 'auto-complete)
(defun lzj-ac-config () 
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary
					      ac-source-words-in-same-mode-buffers)) 
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup) 
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup) 
  (add-hook 'css-mode-hook 'ac-css-mode-setup) 
  (add-hook 'auto-complete-mode-hook 'ac-common-setup) 
  (global-auto-complete-mode t))
(defun lzj-ac-cc-mode-setup () 
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

;; ac-source-gtags
(lzj-ac-config)

(setq ac-clang-flags (mapcar (lambda (item) 
			       (concat "-I" item)) 
			     (split-string "
 /usr/include/c++/4.6
 /usr/include/c++/4.6/x86_64-linux-gnu/.
 /usr/include/c++/4.6/backward
 /usr/lib/gcc/x86_64-linux-gnu/4.6.1/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/4.6.1/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include
")))


(setq auto-mode-alist (append '(("\\.js\\'" . js2-mode)) auto-mode-alist))

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
;;(global-set-key (kbd "<f2 i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(set-face-attribute 'default nil 
			:height 150)


(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(add-to-list 'exec-path "~/go/bin")

(defun lzj-go-mode-hook ()
  ; Call Gofmt before saving                                                    
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding                                                      
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  )

(add-hook 'go-mode-hook 'lzj-go-mode-hook)

(defun auto-complete-for-go ()
(auto-complete-mode 1))
 (add-hook 'go-mode-hook 'auto-complete-for-go)

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

;; go
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook 'lsp-deferred)

(setenv "GOPATH" "/usr/local/go/")
(setenv "PATH" (concat (getenv "PATH") ":" "/extra/path/element"))
(setq exec-path (append exec-path (list (expand-file-name "/another/thing"))))


;; flycheck
(add-to-list 'load-path "~/go/src/github.com/dougm/goflymake")
(require 'go-flymake)
(require 'go-flycheck)

;;(add-to-list 'load-path (concat myoptdir "AC"))
(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories (concat myoptdir "AC/ac-dict"))
(require 'auto-complete-clang)

(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
;; (ac-set-trigger-key "TAB")
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
(define-key ac-mode-map  [(control tab)] 'auto-complete)
(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)





(provide 'init-packages)
