
(load "time")
(display-time)
(setq display-time-24hr-format t)


(set-background-color "white")


(custom-set-variables
 '(auto-insert-mode nil nil (autoinsert))
 '(auto-save-interval 50)
 '(auto-save-timeout 10)
 '(backward-delete-char-untabify-method (quote hungry))
 '(blink-matching-paren t)
 '(blink-matching-paren-on-screen t)
 '(case-fold-search t)
 '(case-replace t)
 '(completion-on-separator-character t)
 '(css-indent-offset 2)
 '(delete-selection-mode t nil (delsel))
 '(display-time-day-and-date t)
 '(display-time-interval 20)
 '(double-click-time 500)
 '(ediff-custom-diff-options "-bw")
 '(ediff-diff-program "diff")
 '(ediff-diff3-program "diff3")
 '(fill-column 80)
 '(flash-paren-delay 0.2)
 '(flash-paren-method (quote flash-paren-do-flash-with-overlay-faces))
 '(imenu-sort-function (quote imenu--sort-by-name))
 '(indent-tabs-mode nil)
 '(kill-read-only-ok t)
 '(next-line-add-newlines nil)
 '(outline-regexp "^=head[1-4] " t)
 '(require-final-newline t)
 '(sh-basic-offset 2)
 '(sh-indentation 2)
 '(show-paren-mode t nil (paren))
 '(split-height-threshold nil)
 '(split-width-threshold nil)
 '(standard-indent 2)
 '(transient-mark-mode t)
 '(words-include-escapes nil))



(custom-set-faces
 '(blank-space-face ((t (:background "Violet"))))
 '(blank-tab-face ((t (:background "BlueViolet"))))
 '(ediff-current-diff-A ((t (:background "yellow"))))
 '(ediff-current-diff-B ((t (:background "yellow"))))
 '(ediff-fine-diff-A ((t (:background "cyan"))))
 '(ediff-fine-diff-B ((t (:background "cyan"))))
 '(flash-paren-face-off ((t (:bold t :foreground "white" :background "red"))))
 '(flash-paren-face-on ((t nil)))
 '(flash-paren-face-region ((t (:background "yellow"))))
 '(font-lock-builtin-face ((((class color) (background light)) (:bold t :foreground "Red"))))
 '(font-lock-comment-face ((((class color) (background light)) (:italic t :foreground "Blue" :background "Gray90"))))
 '(font-lock-constant-face ((((class color) (background light)) (:bold t :foreground "red" :background "yellow"))))
 '(font-lock-keyword-face ((((class color) (background light)) (:bold t :foreground "Purple"))))
 '(font-lock-string-face ((((class color) (background light)) (:bold t :foreground "#000000FFF" :background "#F00F00FFF"))))
 '(font-lock-type-face ((((class color) (background light)) (:bold t :foreground "white" :background "red"))))
 '(font-lock-variable-name-face ((((class color) (background light)) (:bold t))))
 '(font-lock-warning-face ((((class color) (background light)) (:bold t :foreground "#000500000" :background "#E00FFFE00"))))
 '(linum ((t (:background "blue" :foreground "yellow" :slant normal :weight normal))))
 '(mode-line ((t (:background "red" :foreground "white" :weight bold))))
 '(mode-line-inactive ((default (:inherit mode-line)) (((class color) (min-colors 88) (background light)) (:background "grey30" :foreground "white" :box (:line-width -1 :color "grey75") :weight light))))
 '(region ((t (:background "Gray80"))))
 '(sh-heredoc ((((class color) (background light)) (:foreground "blue" :weight bold))))
 '(trailing-whitespace ((((class color) (background light)) (:background "Violet"))))
 '(vhdl-font-lock-reserved-words-face ((((class color) (background light)) (:bold t :italic t :foreground "Orange"))))
 '(widget-field ((((class grayscale color) (background light)) (:background "gray90"))))
 '(widget-field-face ((((class grayscale color) (background light)) (:background "gray90"))) t))



(set-language-environment "latin-1")


(auto-compression-mode t)
(blink-cursor-mode -1)
(column-number-mode t)
(global-font-lock-mode t)
(line-number-mode t)
(tool-bar-mode -1)

(setq completion-ignore-case nil)
(setq linum-format "%6d")
(setq mouse-drag-copy-region t)
(setq parse-sexp-ignore-comments nil)
(setq show-trailing-whitespace t)
(setq truncate-lines nil)
(setq visible-bell t)

(put 'downcase-region 'disabled nil)
(put 'eval-expression 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)


;;; set title bar of the current Emacs window to something relevant
(setq frame-title-format `(,(user-login-name) "@" ,(system-name) " - %m - %b - %f"))


