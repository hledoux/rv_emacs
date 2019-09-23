
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


(defun rv_emacs_custom_faces_common ()
  (interactive)
  (custom-set-faces
   '(blank-space-face ((t (:background "#cda5f3"))))
   '(blank-tab-face ((t (:background "#cda5f3"))))
   '(ediff-current-diff-A ((t (:background "yellow" :foreground "black"))))
   '(ediff-current-diff-B ((t (:background "yellow" :foreground "black"))))
   '(ediff-fine-diff-A ((t (:background "cyan" :weight bold))))
   '(ediff-fine-diff-B ((t (:background "cyan" :weight bold))))
   '(flash-paren-face-off ((t (:weight normal :foreground "white" :background "red"))))
   '(flash-paren-face-on ((t nil)))
   '(flash-paren-face-region ((t (:background "yellow"))))
   '(font-lock-builtin-face ((t (:weight bold :foreground "red"))))
   '(font-lock-callback-name-face ((t (:weight bold :foreground "#33cc33"))))
   '(font-lock-keyword-face ((t (:weight bold :foreground "purple"))))
   '(font-lock-log-error-face ((t (:weight bold :foreground "red"))))
   '(font-lock-log-success-face ((t (:weight bold :foreground "#00b300"))))
   '(font-lock-log-warning-face ((t (:weight bold :foreground "orange"))))
   '(font-lock-perl-label-face ((t (:weight bold :foreground "red" :background "yellow"))))
   '(font-lock-todo-face ((t (:weight bold :foreground "red" :background "yellow"))))
   '(font-lock-type-face ((t (:weight normal :foreground "white" :background "red"))))
   '(font-lock-variable-name-face ((t (:weight bold))))
   '(font-lock-wiki-bold-face ((t (:weight bold))))
   '(font-lock-wiki-italic-face ((t (:slant italic))))
   '(trailing-whitespace ((t (:background "#cda5f3"))))))


(defun rv_emacs_custom_faces_light ()
  (interactive)
  (rv_emacs_custom_faces_common)
  (custom-set-faces
   '(comint-highlight-input ((t (:weight bold :foreground "blue"))))
   '(comint-highlight-prompt ((t (:foreground "blue"))))
   '(default ((t (:background "white" :foreground "black"))))
   '(ediff-even-diff-A ((t (:background "gray80"))))
   '(ediff-even-diff-B ((t (:background "gray80"))))
   '(ediff-odd-diff-A ((t (:background "gray80"))))
   '(ediff-odd-diff-B ((t (:background "gray80"))))
   '(font-lock-comment-face ((t (:slant italic :foreground "blue" :background "gray80"))))
   '(font-lock-constant-face ((t (:weight normal :foreground "red" :background "yellow"))))
   '(font-lock-function-name-face ((t (:weight bold :foreground "blue"))))
   '(font-lock-log-in-out-face ((t (:weight bold :foreground "blue"))))
   '(font-lock-log-separ-face ((t (:weight bold :foreground "blue"))))
   '(font-lock-perl-spd-name-face ((t (:weight bold :foreground "blue"))))
   '(font-lock-shell-mode-context-face ((t (:weight bold :foreground "blue" :background "gray80"))))
   '(font-lock-string-face ((t (:weight normal :foreground "blue" :background "#f0f0ff"))))
   '(font-lock-wiki-head-1-face ((t (:weight bold :foreground "white" :background "blue"))))
   '(font-lock-wiki-head-2-face ((t (:weight bold :foreground "blue"))))
   '(font-lock-wiki-macro-face ((t (:weight bold :foreground "black" :background "cyan"))))
   '(linum ((t (:background "gray90" :foreground "black" :slant italic ))))
   '(mode-line ((t (:background "blue" :foreground "yellow" :weight bold))))
   '(mode-line-inactive ((t (:background "gray30" :foreground "gray90" :weight normal))))
   '(region ((t (:background "gray80"))))
   '(sh-heredoc ((t (:foreground "blue" :weight normal :background "gray80"))))))


(defun rv_emacs_custom_faces_dark ()
  (interactive)
  (rv_emacs_custom_faces_common)
  (custom-set-faces
   '(isearch ((t (:background "white" :foreground "red" :weight bold))))
   '(comint-highlight-input ((t (:weight bold :foreground "#2a7bfc"))))
   '(comint-highlight-prompt ((t (:foreground "cyan"))))
   '(default ((t (:background "black" :foreground "white"))))
   '(ediff-even-diff-A ((t (:background "gray30"))))
   '(ediff-even-diff-B ((t (:background "gray30"))))
   '(ediff-odd-diff-A ((t (:background "gray30"))))
   '(ediff-odd-diff-B ((t (:background "gray30"))))
   '(font-lock-comment-face ((t (:slant italic :foreground "gray70" :background "gray30"))))
   '(font-lock-constant-face ((t (:weight bold :foreground "red"))))
   '(font-lock-function-name-face ((t (:weight bold :foreground "#2a7bfc"))))
   '(font-lock-log-in-out-face ((t (:weight bold :foreground "#2a7bfc"))))
   '(font-lock-log-separ-face ((t (:weight bold :foreground "#2a7bfc"))))
   '(font-lock-perl-spd-name-face ((t (:weight bold :foreground "#00b300"))))
   '(font-lock-shell-mode-context-face ((t (:weight bold :foreground "#00b300" :background "gray30"))))
   '(font-lock-string-face ((t (:foreground "green" :weight normal :background "gray30"))))
   '(font-lock-wiki-head-1-face ((t (:weight bold :foreground "#00b300"))))
   '(font-lock-wiki-head-2-face ((t (:foreground "#00b300"))))
   '(font-lock-wiki-macro-face ((t (:weight bold :foreground "black" :background "cyan"))))
   '(linum ((t (:background "gray10" :foreground "white" :slant italic ))))
   '(mode-line ((t (:background "red" :foreground "white" :weight bold))))
   '(mode-line-inactive ((t (:background "white" :foreground "gray50" :weight normal))))
   '(region ((t (:background "cyan" :foreground "blue"))))
   '(sh-heredoc ((t (:foreground "green" :weight normal :background "gray30"))))))


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
(setq frame-title-format `(,(user-login-name) "@" ,(system-name) " - %b (%m) %f"))


