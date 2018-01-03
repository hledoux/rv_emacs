(defun rv_log_f_configure_fontify ()
  (interactive)
  (save-excursion

    (setq log-view-font-lock-keywords
          '(
            ;; command line options
            ("[ \t]\\([-+]+[a-zA-Z0-9][-a-zA-Z0-9_]*\\)" 1 font-lock-keyword-face)

            ;; !!! ERROR | WARNING | ...
            ("\\!\\!\\![ \t]*[A-Z]+[ \t]*\\!\\!\\!.*" . font-lock-log-error-face)


            ;; ==> ...
            ;; <== ...
            ("[ \t]==>[ \t].*" . font-lock-log-in-out-face)
            ("[ \t]<==[ \t].*" . font-lock-log-in-out-face)


            ;; separation line
            ("\\(=====\\|-----\\|\\*\\*\\*\\*\\*\\|#####\\).*" . font-lock-log-separ-face)

            ;; generix Unix error
            ("^[ \t]*[a-z][-a-zA-Z0-9_]+:.*" . font-lock-log-error-face)))))


(rv_log_f_configure_fontify)


(defun rv_log_f_log_mode_hook ()
  (linum-mode t)
  (font-lock-mode t))
