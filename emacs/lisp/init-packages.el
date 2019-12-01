
(setq org-src-fontify-natively t)

(when (>= emacs-major-version 24) 
  (require 'package)
  ;;(package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/") 
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
(require 'cl)

;; Add Packages
(defvar my/packages 
  '(company hungry-delete swiper counsel smartparens js2-mode nodejs-repl exec-path-from-shell
	    monokai-theme go-complete go-autocomplete go-imports go-impl vimrc-mode evil ivy swiper
	    flycheck neotree all-the-icons json-mode auto-compile elisp-format goto-last-change
	    colemak-evil  dix-evil  evil-anzu  evil-args  evil-avy  evil-better-visual-line
	    evil-cleverparens  evil-colemak-basics  evil-colemak-minimal  evil-collection
	    evil-commentary  evil-dvorak  evil-ediff  evil-ex-fasd  evil-ex-shell-command
	    evil-exchange  evil-expat  evil-extra-operator  evil-find-char-pinyin  evil-fringe-mark
	    evil-god-state  evil-goggles  evil-iedit-state  evil-indent-plus  evil-indent-textobject
	    evil-leader  evil-ledger  evil-lion  evil-lisp-state  evil-lispy  evil-magit
	    evil-mark-replace  evil-matchit  evil-mc  evil-mc-extras  evil-mu4e  evil-multiedit
	    evil-opener  evil-org  evil-owl  evil-paredit  evil-python-movement  evil-quickscope
	    evil-rails  evil-replace-with-char  evil-replace-with-register  evil-rsi
	    evil-ruby-text-objects  evil-smartparens  evil-snipe  evil-space  evil-string-inflection
	    evil-surround  evil-tabs  evil-terminal-cursor-changer  evil-test-helpers
	    evil-text-object-python  evil-textobj-anyblock  evil-textobj-column  evil-textobj-entire
	    evil-textobj-line  evil-textobj-syntax  evil-traces  evil-tutor  evil-tutor-ja
	    evil-vimish-fold  evil-visual-mark-mode  evil-visual-replace  evil-visualstar  exato
	    exwm-firefox-evil  helm-evil-markers  kaleidoscope-evil-state-flash  kubernetes-evil
	    lispyville  on-parens  org-evil  powerline-evil  symex  syndicate  treemacs-evil general
	    darcula-theme use-package ac-js2 evil-escape modern-cpp-font-lock auto-complete-c-headers) 
  "Default packages")

;; company
(add-hook 'after-init-hook'global-company-mode)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq package-selected-packages my/packages)
(defun my/packages-installed-p () 
  (loop for pkg in my/packages when (not (package-installed-p pkg)) do (return nil) finally (return
											     t)))
(unless (my/packages-installed-p) 
  (message "%s" "Refreshing package database...") 
  (package-refresh-contents) 
  (dolist (pkg my/packages) 
    (when (not (package-installed-p pkg)) (package-install pkg))))

(require 'go-complete)
(add-hook 'completion-at-point-functions 'go-complete-at-point)

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; go-imports
(add-hook 'go-mode-hook #'(lambda() 
			    (require 'go-imports) 
			    (define-key go-mode-map "\C-cI" 'go-imports-insert-import) 
			    (define-key go-mode-map "\C-cR" go-imports-reload-packages-list)))

;;(go-imports-insert-import "~/go/src")

;; impl
(custom-set-variables '(go-impl-aliases-alist '(("hh" . "http.Handler") 
						("irw" . "io.ReadWriter"))))

;; vim
(require 'vimrc-mode)
(add-to-list 'auto-mode-alist '("\\.vim\\(rc\\)?\\'" . vimrc-mode))

;; evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(require 'evil-escape)

(evil-mode t)
(evil-escape-mode t)


(setq-default evil-esc-delay 0.2)
(setq-default evil-escape-key-sequence "jk")

;; ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
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
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;;neotree
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(require 'all-the-icons)

(all-the-icons-octicon "file-binary") ;; GitHub Octicon for Binary File
(all-the-icons-faicon  "cogs")	      ;; FontAwesome icon for cogs
(all-the-icons-wicon   "tornado")     ;; Weather Icon for tornado

(all-the-icons-wicon "tornado" 
		     :face 'all-the-icons-blue)
(propertize (all-the-icons-octicon "package") 'face 
	    `(:family ,(all-the-icons-octicon-family) 
		      :height 1.2)
	    'display '(raise -0.1))
(setq inhibit-compacting-font-caches t)

;; auto-compile
(setq load-prefer-newer t)
(package-initialize)
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

;; lisp format
(require 'elisp-format)
;;(require 'colemak-evil)
;;(key-chord-define-global " e" 'evil-normal-state)

(autoload 'goto-last-change "goto-last-change" "Set point to the position of the last change." t)

(require 'general)

;;(general-imap "j"
;;              (general-key-dispatch 'self-insert-command
;;                "k" 'evil-normal-state))

(require 'use-package)

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs") 
  (require 'darcula-theme))

;;(use-package foo)


(require 'smartparens-config)
(smartparens-global-mode t)

;; ac-js1
(add-hook 'js2-mode-hook 'ac-js2-mode)
;;(add-to-list 'company-backends 'ac-js2-company)
(setq ac-js2-evaluate-calls t)
;;(setq ac-js2-external-libraries '("full/path/to/a-library.js"))


(add-to-list 'auto-mode-alist '("[.]el$" . lisp-mode))

(add-hook 'c++-mode-hook #'modern-c++-font-lock)
(add-to-list 'auto-mode-alist '("[.]cpp$" . modern-c++-font-lock-mode))


;; c++
(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-source 'ac-source-c-headers))


(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

(provide 'init-packages)
