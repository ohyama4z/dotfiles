;; 言語を日本語にする
(set-language-environment 'Japanese)

;; 文字コードをutf-8に
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)

;; 挨拶ページを非表示
(setq inhibit-startup-message t)

;; キーバインド
;; コメントアウト
(global-set-key "\C-c;" 'comment-dwim)
;; ctrl+hでカーソルの前を削除(backspaceと同じ)
(global-set-key "\C-h" 'delete-backward-char)
;; help
(global-set-key "\C-c\C-h" 'help-command)

;; 行番号の表示
(global-display-line-numbers-mode t)

;; カッコの自動補完
(electric-pair-mode 1)
;; 対応するカッコの色を変える
(show-paren-mode 1)

;; バックアップファイルを作らない
(setq make-backup-files nil)
(setq make-save-files nil)
(setq auto-save-default nil)

;; ビープ音を消す
(setq visible-bell t)

;; 空白文字の可視化
(require 'whitespace)
(setq whitespace-style
      '(face trailing tabs spaces newline space-before-tab space-after-tab space-mark tab-mark newline-mark))

(setq whitespace-display-mappings
  '((space-mark 32 [183] [46])
    (tab-mark 9 [187 9] [92 9])
    ))

(custom-set-faces
 '(whitespace-space ((t (:foreground "#000000"))))
 '(whitespace-tab ((t (:foreground "#000000"))))
 '(whitespace-newline ((t (:foreground "#000000")))))

(global-whitespace-mode t)



;; Windowsのクリップボードと共有(WSL向け)
(setq interprogram-cut-function
      (lambda (text &optional push)
        (let ((process-connection-type nil)) ;; use a pipe
          (let ((proc (start-process "clip" nil "clip.exe")))
            (process-send-string proc text)
            (process-send-eof proc)))))

(setq interprogram-paste-function
      (lambda ()
        (shell-command-to-string "pwsh.exe -Command Get-Clipboard")))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; ivy設定
(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-height 30) ;; minibufferのサイズを拡大！（重要）
(setq ivy-extra-directories nil)
(setq ivy-re-builders-alist
	  '((t . ivy--regex-plus)))

;; counsel設定
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file) ;; find-fileもcounsel任せ！
(setq counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))

(global-set-key "\C-s" 'swiper)
(setq swiper-include-line-number-in-search t) ;; line-numberでも検索可能

(require 'company)
(global-company-mode) ; 全バッファで有効にする
(setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 3) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(setq completion-ignore-case t)
(setq company-dabbrev-downcase nil)
(global-set-key (kbd "C-M-i") 'company-complete)
(define-key company-active-map (kbd "C-n") 'company-select-next) ;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates) ;; C-sで絞り込む
(define-key company-active-map (kbd "C-i") 'company-complete-selection) ;; TABで候補を設定
(define-key company-active-map [tab] 'company-complete-selection) ;; TABで候補を設定
(define-key company-active-map (kbd "C-f") 'company-complete-selection) ;; C-fで候補を設定
(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete) ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う

;; yasnippetとの連携
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")
(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
	  backend
	(append (if (consp backend) backend (list backend))
			'(:with company-yasnippet))))
(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(cmake-mode counsel company avy-migemo)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
