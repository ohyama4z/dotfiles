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

;; 列番号つける
(column-number-mode t)

;; カッコの自動補完
(electric-pair-mode 1)
;; 対応するカッコの色を変える
(show-paren-mode 1)

;; バックアップファイルを作らない
(setq make-backup-files nil)
(setq make-save-files nil)
