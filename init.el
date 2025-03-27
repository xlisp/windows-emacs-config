;; Add local package directory to load path
;;(add-to-list 'load-path "~/.emacs.d/packages/cider")
(add-to-list 'load-path "~/.emacs.d/packages/clojure-mode")
(add-to-list 'load-path "~/.emacs.d/packages/company-mode")
;;(add-to-list 'load-path "~/.emacs.d/packages/lispy")
(add-to-list 'load-path "~/.emacs.d/packages/monokai-emacs")
(add-to-list 'load-path "~/.emacs.d/packages/multiple-cursors.el")
(add-to-list 'load-path "~/.emacs.d/packages/projectile")
(add-to-list 'load-path "~/.emacs.d/packages/yasnippet")

;; Load packages
;;(load "cider")
(load "clojure-mode")
(load "company")
;;(load "lispy")
(load "monokai-theme")
(load "multiple-cursors")
(load "projectile")
(load "yasnippet")

;; CIDER configuration
(setq cider-repl-display-help-banner nil)
(setq cider-show-error-buffer t)

;; Clojure mode configuration
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojurescript-mode))

;; Company mode configuration
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)

;; Lispy configuration
;;(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
;;(add-hook 'clojure-mode-hook (lambda () (lispy-mode 1)))

;; Monokai theme
(load-theme 'monokai t)

;; Multiple cursors keybindings
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Projectile configuration
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-completion-system 'default)

;; YASnippet configuration
(yas-global-mode 1)

;; Window management configuration
(when (window-system)
  ;; Set default window size
  (set-frame-size (selected-frame) 120 40)
  
  ;; Set default font and size
  (set-face-attribute 'default nil :height 110)
  
  ;; Enable line numbers
  (global-display-line-numbers-mode)
  
  ;; Show matching parentheses
  (show-paren-mode 1)
  
  ;; Remove toolbar and scrollbar
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  
  ;; Enable winner mode for window configuration undo/redo
  (winner-mode 1))

;; Window splitting preferences
(setq split-height-threshold nil)
(setq split-width-threshold 160)

;; Windmove configuration
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; Window navigation keybindings
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; IBuffer configuration
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      '(("default"
         ("Clojure" (mode . clojure-mode))
         ("Programming" (or
                        (mode . emacs-lisp-mode)
                        (mode . cider-repl-mode)))
         ("ERC" (mode . erc-mode))
         ("Help" (or
                 (name . "\*Help\*")
                 (name . "\*Apropos\*")
                 (name . "\*info\*"))))))

;; Save window configurations
(desktop-save-mode 1)

;; Smooth scrolling
(setq scroll-conservatively 10000
      scroll-preserve-screen-position t)

;; Add configuration metadata
(setq user-init-file-timestamp "2025-03-27 13:54:18")
(setq user-init-file-author "xlisp")

