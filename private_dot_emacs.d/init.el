;;; init.el -*- lexical-binding: t -*-
;; lexical-binding t

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; 見た目周り
(global-display-line-numbers-mode t)
(global-hl-line-mode t)
(show-paren-mode t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(fringe-mode '(8 . 0))
(setq ring-bell-function 'ignore)

;; テーマ 
(use-package doom-themes
  :config
  (load-theme 'doom-dark+)
  (doom-themes-treemacs-config))

(use-package doom-modeline
  :init (doom-modeline-mode 1))
(use-package nerd-icons)

(set-face-attribute 'default nil :background "unspecified-bg")

;; デフォルト操作周り
(recentf-mode 1)
(setq recentf-max-saved-items 50)
(savehist-mode 1)
(save-place-mode 1)

(electric-pair-mode 1)
(delete-selection-mode 1)

(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))

;; ミニバッファ補完
(use-package vertico
  :init
  (vertico-mode))
(use-package orderless
  :custom
  (completion-styles '(orderless basic)))
(use-package marginalia
  :init
  (marginalia-mode)
  :config
  (setq marginalia-align 'right))

;; コード補完
(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 2)
  :bind
  (:map corfu-map
	("TAB" . corfu-next)
	("<backtab>" . corfu-previous)
	("<escape>" . corfu-quit))
  :init
  (global-corfu-mode)
  (global-set-key (kbd "M-/") 'completion-at-point))

(use-package corfu-terminal
  :after corfu
  :init
  (unless (display-graphic-p)
    (corfu-terminal-mode 1)))

;; which-key
(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5))

;; ターミナル
(use-package vterm
  :config
  (setq vterm-max-scrollback 100000))
(defun my/open-terminal-below ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (vterm))
(global-set-key (kbd "C-c t") #'my/open-terminal-below)

;; ファイルツリー
(use-package treemacs
  :bind ("C-c e" . treemacs))
(use-package treemacs-projectile
  :after (treemacs projectile))

;; ウィンドウ操作
(use-package ace-window
  :bind ("C-c o" . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(defun my/setup-layout ()
  (interactive)
  (treemacs)
  (other-window 1)
  (split-window-right)
  (other-window 1)
  (vterm)
  (other-window 1))
