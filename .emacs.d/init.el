;;
;; init.el
;;

;; Language.
(set-language-environment 'Japanese)

;; Coding system.
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(add-to-list 'load-path "~/.emacs.d")

(setq default-input-method "MacOSX")

;;
;; Customize
;;

;; Theme
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-dark-laptop)))

;; menu disabled
(menu-bar-mode nil)
;(tool-bar-mode nil)

;; スタートアップメッセージを表示しない
(setq inhibit-startup-message t)

;; 最終行で下カーソルを入力しても新しい行を作らない
(setq next-line-add-newlines nil)

;; 行・列番号を常に表示するようにする
(setq line-number-mode t)
(setq column-number-mode t)

;; 時計の表示
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

;; 対応する括弧をハイライト
(show-paren-mode t)
(setq show-paren-style 'mixed)
;(set-face-background 'show-paren-match-face "purple")
;(set-face-foreground 'show-paren-match-face "SkyBlue")

;; タブを使用せずスペースのみを使う
(setq indent-tabs-mode nil)

;; バックアップファイル作らない
(setq make-backup-files nil)
(setq delete-auto-save-files t)

;; find-fileのファイル名補完で大文字小文字を区別しない
(setq read-file-name-completion-ignore-case t)

;; バッファ自動再読み込み
(global-auto-revert-mode 1)

;; 同名ファイルのバッファ名の識別文字列を変更する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; package-list-packageに追加
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;(require 'browse-kill-ring)

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-auto-start 3)

(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; anything
(require 'anything)
(require 'anything-config)
(require 'anything-show-completion)
(setq anything-sources (list anything-c-source-buffers+
			     anything-c-source-file-name-history
			     anything-c-source-man-pages
			     anything-c-source-recentf
			     anything-c-source-files-in-current-dir
			     anything-c-source-emacs-commands))
(anything-iswitchb-setup)
(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "C-v") 'anything-next-source)
(define-key anything-map (kbd "M-v") 'anything-previous-source)

;;-----------------------------------------------------------------
;; Color
;;-----------------------------------------------------------------
;; ref.http://d.hatena.ne.jp/higepon/20060308/1141804526
(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(
     ("　" 0 my-face-b-1 append)
     ("\t" 0 my-face-b-2 append)
     ("[ ]+$" 0 my-face-u-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
			      (if font-lock-mode
				  nil
				(font-lock-mode t))) t)

(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "gray26"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;;-----------------------------------------------------------------
;; mode
;;-----------------------------------------------------------------
;; cperl mode
(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4)
(setq cperl-label-offset -4)
(setq cperl-indent-parens-as-block t)
(setq cperl-continued-statement-offset 0)
(setq cperl-continued-brace-offset 0)
(setq cperl-close-paren-offset -4)
(setq cperl-close-brace-offset -4)
(setq cperl-tab-always-indent nil)
;(setq cperl-brace-offset -4)
;(setq cperl-invalid-face nil)
(setq cperl-highlight-variables-indiscriminately t)
(add-to-list 'auto-mode-alist '("\\.cgi$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pl$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pm$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t$" . cperl-mode))
(add-hook 'cperl-mode-hook '(lambda ()
			      (setq indent-tabs-mode nil)
			      ))

; cperl tidy func ; perltidy-region
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
  (perltidy-region)))

;; pod-mode
;; Perl Hacks p.15
(require 'pod-mode)
(add-to-list 'auto-mode-alist
             '("\\.pod$" . pod-mode))
(add-hook 'pod-mode-hook
          '(lambda () (progn
                        (font-lock-mode)
                        (auto-fill-mode 1)
                        (flyspell-mode 1))))

;; javascript mode
(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))
(setq javascript-indent-level 2)

;; html mode
(add-to-list 'auto-mode-alist '("\\.tmpl$" . html-mode))

;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; php mode
(load-library "php-mode")
(require 'php-mode)
(setq php-mode-force-pear t)

;;-----------------------------------------------------------------
;; Functions
;;-----------------------------------------------------------------
;; インデントして、次の行に移動する
(defun indent-and-next-line ()
  (interactive)
  (indent-according-to-mode)
  (next-line 1))

;; C-x C-b で表示した *Buffer List* に移動する
(defun my-list-buffers ()
  (interactive)
  (list-buffers)
  (pop-to-buffer "*Buffer List*")
  (goto-line 2)
  )
;; Buffer Menu モードで Return に 1 と同じ機能を割り当てる
(define-key Buffer-menu-mode-map "\C-m" 'Buffer-menu-1-window)

;;-----------------------------------------------------------------
;; Key Bind
;;-----------------------------------------------------------------
(global-set-key [backspace] 'backward-delete-char)
(global-set-key [delete] 'delete-char)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-l" 'expand-abbrev)
(global-set-key "\C-o" 'anything)
(global-set-key "\C-t" 'indent-and-next-line)
(global-set-key "\C-u" 'undo)

(global-set-key "\C-x\C-b" 'my-list-buffers)
(global-set-key "\C-x\C-n" 'end-of-buffer)
(global-set-key "\C-x\C-p" 'beginning-of-buffer)
(global-set-key "\C-x\C-r" 'query-replace)
(global-set-key "\C-x\C-w" 'write-file)
(global-set-key "\C-x\C-x" 'execute-extended-command)
(global-set-key "\C-x\C-y" 'anything-show-kill-ring)
