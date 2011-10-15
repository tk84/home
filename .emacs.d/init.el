(if window-system t (server-mode))	;端末の場合サーバとして起動

;; 
;; キーバインド
;; 
;; その他に割り当てられるキーを探す (75)
;; M-英大文字
;; C-c 英字
;; <f5> - <f9>
;; (Shift, Alt, Ctrl) + ファンクションキー
;; ________________________________________________________________________________

(global-set-key "\C-h" 'delete-backward-char) ;; C-hでカーソルより前の一文字削除

;; windowの切り替え
(global-set-key "\C-t" 'other-window) ;; C-t で次のウィンドウ、C-S-t で前のウィンドウ

;; (if window-system
;;     (global-set-key (kbd "C-S-t") (lambda () (interactive) (other-window -1)))
;;   ;; Terminal.app で C-S ガ使えないため keyremap4macbook で C-S-t -> M-n に割り当て
;;   (global-set-key "\M-n" (lambda () (interactive) (other-window -1))))

;; buffer の切り替え
(global-set-key [M \[] 'previous-buffer)
(global-set-key [M \]] 'next-buffer)

;; M-g M-g を M-g 一回で goto-line
(global-set-key [M g] 'goto-line)

;; KeyRemap4MacBook 用の設定
(define-prefix-command 'keyremap4macbook-map)
(global-set-key [(C c) (end)] 'keyremap4macbook-map) ;[(C c) (end)] をプレフィックスキーとして使う
(define-key keyremap4macbook-map [(C a)] (lambda () (interactive) (other-window -1))) ;[C S t]

;;
;; ????
;; ________________________________________________________________________________

(setq inhibit-startup-message t)	;スタートアップメッセージの禁止

(menu-bar-mode nil)			;メニューバーを非表示
(setq-default truncate-lines t)		;行の折り返しをしない

;; オートリバートモード
;; 他のプログラムが開いているファイルに変更を加えた時すぐ反映
;; (global-auto-revert-mode t)
;; (turn-on-auto-revert-mode)
(add-hook 'ruby-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'objc-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'c-mode-hook 'turn-on-auto-revert-mode)

;; (if window-system
;;     (progn
;;       (set-frame-parameter nil 'alpha 100) ; 透明度
;;       (tool-bar-mode nil)                  ; ツールバー非表示
;;       (set-scroll-bar-mode nil)            ; スクロールバー非表示
;;       (setq line-spacing 0.2)              ; 行間
;;       (when (>= emacs-major-version 23)
;;         (tool-bar-mode nil)
;;         (set-frame-font "Menlo-12")
;;         (set-fontset-font (frame-parameter nil 'font)
;;                           'japanese-jisx0208
;;                           (font-spec :family "M+2VM+IPAG circle" :size 14)))
;;       (setq ns-pop-up-frames nil)))

(if window-system
    (progn
      ;; フォントの設定
      (create-fontset-from-ascii-font "Monaco-12:slant=normal" nil "monacoosaka")
      (set-fontset-font "fontset-monacoosaka"
			'unicode
			(font-spec :family "Osaka" :size 14)
			nil
			'append)
      (add-to-list 'default-frame-alist '(font . "fontset-monacoosaka"))

      ;; マウスのスクロールを違和感のないように
      ;; http://d.hatena.ne.jp/paella/20080930/1222761237
      (global-set-key [wheel-up]
		      '(lambda () "" (interactive) (scroll-down 1)))
      (global-set-key [wheel-down]
		      '(lambda () "" (interactive) (scroll-up 1)))
      (global-set-key [double-wheel-up]
		      '(lambda () "" (interactive) (scroll-down 1)))
      (global-set-key [double-wheel-down]
		      '(lambda () "" (interactive) (scroll-up 1)))
      (global-set-key [triple-wheel-up]
		      '(lambda () "" (interactive) (scroll-down 2)))
      (global-set-key [triple-wheel-down]
		      '(lambda () "" (interactive) (scroll-up 2)))

      ;; Bell
      (setq ring-bell-function 'ignore)

      ))

;; 行番号表示
;; (linum-mode)
(global-linum-mode t)
(setq linum-format
      (lambda (line)
	(propertize (format
		     (let ((w (length (number-to-string
				       (count-lines (point-min) (point-max))))))
		       (concat "%" (number-to-string w) "d "))
		     line)
		    'face 'linum)))

;; 1画面スクロールしたときに以前の画面を何行分残すかを設定する
;; http://marigold.sakura.ne.jp/devel/emacs/scroll/index.html
(setq next-screen-context-lines 10)

;テキストモードの時
(add-hook 'text-mode-hook
          (lambda ()
            (setq indent-line-function 'tab-to-tab-stop)
            (setq-default tab-width 4)
            (setq default-tab-width 4)
            (setq-default indent-tabs-mode nil)
            (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                                    64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
            (add-hook 'text-mode 'turn-on-auto-revert-mode)
            ))

;; バッファリストを同じウィンドウで
(define-key global-map [(C x) (C b)] 'buffer-menu)

;; 
;; 外部 lisp
;; ________________________________________________________________________________

;; サブディレクトリも含めてロードパスに追加
;; http://homepage3.nifty.com/oatu/emacs/misc.html#lp
(let ((default-directory "~/.emacs.d/lisp"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))


;; オートセーブ
(require 'auto-save-buffers)
(run-with-idle-timer 0.5 t 'auto-save-buffers)
(setq make-backup-files nil) ; *.~ とかのバックアップファイルを作らない
(setq auto-save-default nil) ; .#* とかのバックアップファイルを作らない

;; カラーテーマ
(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)
;; (color-theme-jsc-dark)

;; オートコンプリート
;; http://cx4a.org/software/auto-complete/manual.ja.html
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete/ac-dict")
(ac-config-default)
(setq ac-auto-start nil)		;自動ポップアップを無効
(ac-set-trigger-key "TAB")		;タブキーでポップアップ
(setq ac-use-menu-map t)		;C-n/C-pで補完候補を選択する
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;; ruby インタープリタ
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
             ))

;; オートインストール
;; http://www.emacswiki.org/emacs/download/auto-install.el
;; emacs --batch -Q -f batch-byte-compile auto-install.el
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/lisp/auto-install")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)             ; 互換性確保

;; 使い捨てのファイルを開く (247p)
;; M-x install-elisp-from-emacswiki open-junk-file.el
;; M-x open-junk-file
(require 'open-junk-file)
;; ファイル名入力時に ~/junk/年-月-日-時分秒. が出てくる
(setq open-junk-file-format "~/.emacs.d/etc/junk/%Y-%m-%d-%H%M%S")

;; 
;; できてるのかどうか怪しいやつ
;; ________________________________________________________________________________

(setq buffer-menu-sort-column 5)	;バッファをファイル名でソート

