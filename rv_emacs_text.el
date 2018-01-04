
(defun rv_text_f_text_mode_hook ()
  (linum-mode t)
  (modify-syntax-entry ?_ "w")

  (font-lock-add-keywords nil
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
                            ("\\(=====\\|-----\\|\\*\\*\\*\\*\\*\\).*" . font-lock-log-separ-face)


                            ;; Wiki
                            ("^[=]+[ \t].*" . font-lock-wiki-head-1-face)
                            ("^[;][ \t].*" . font-lock-wiki-head-2-face)
                            ("{{[A-Z][a-zA-Z0-9_]*|.*?}}" . font-lock-wiki-macro-face)
                            ("\\[\\[[A-Z][a-zA-Z0-9_:]*|.*?\\]\\]" . font-lock-wiki-macro-face)
                            ("'''.*?'''" . font-lock-wiki-bold-face)
                            ("''.*?''" . font-lock-wiki-italic-face)
                            ("##TODO##.*" . font-lock-todo-face)


                            ;; generix Unix error
                            ("^[ \t]*[a-z][-a-zA-Z0-9_]+:.*" . font-lock-log-error-face)))

  (font-lock-mode t))
