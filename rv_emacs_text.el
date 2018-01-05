
(defun rv_text_f_text_mode_hook ()
  (linum-mode t)
  (modify-syntax-entry ?_ "w")

  (font-lock-add-keywords nil
                          '(
                            ;; !!! WARNING | ALERT ...
                            ("\\!\\!\\![ \t]*\\(WARNING\\|ALERT\\)[ \t]*\\!\\!\\!.*" . font-lock-log-warning-face)

                            ;; !!! ERROR | FATAL ...
                            ("\\!\\!\\![ \t]*[A-Z]+[ \t]*\\!\\!\\!.*" . font-lock-log-error-face)

                            ;; ==> ...
                            ;; <== ...
                            ("[ \t]==>[ \t].*" . font-lock-log-in-out-face)
                            ("[ \t]<==[ \t].*" . font-lock-log-in-out-face)

                            ;; separation line
                            ("\\(====\\|----\\|\\*\\*\\*\\*\\).*" . font-lock-log-separ-face)

                            ;; Wiki
                            ("^[=]+[ \t].*" . font-lock-wiki-head-1-face)
                            ("^[;][ \t].*" . font-lock-wiki-head-2-face)
                            ("{{[A-Z][a-zA-Z0-9_]*|.*?}}" . font-lock-wiki-macro-face)
                            ("\\[\\[[A-Z][a-zA-Z0-9_:]*|.*?\\]\\]" . font-lock-wiki-macro-face)
                            ("'''.*?'''" . font-lock-wiki-bold-face)
                            ("''.*?''" . font-lock-wiki-italic-face)

                            ;; TODO etc.
                            ("##+[A-Z][-A-Za-z0-9_]+##+.*" . font-lock-todo-face)

                            ;; generix Unix error
                            ("^[ \t]*[a-z][-a-zA-Z0-9_]+:.*" . font-lock-log-error-face)

                            ;; command line options
                            ("[ \t]\\([-+]+[a-zA-Z0-9][-a-zA-Z0-9_]*\\)" 1 font-lock-keyword-face)

                            ;; name = [value]
                            ;; - old form [name] = [value]
                            ("\\[\\([@$%]?\\<[-a-zA-Z0-9_]+\\>\\)\\][ \t]*=[ \t]*\\[\\(.*?\\)\\]" (1 font-lock-builtin-face) (2 font-lock-string-face))
                            ;; - new form name = [value]
                            ("\\([@$%]?\\<[-a-zA-Z0-9_]+\\>\\)[ \t]*=[ \t]*\\[\\(.*?\\)\\]" (1 font-lock-builtin-face) (2 font-lock-string-face))
                            ))

  (font-lock-mode t))
