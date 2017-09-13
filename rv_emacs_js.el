(defun rv_js_f_indent_sexp ()
  (interactive)
  (save-excursion
    (rv_common_f_remove_trailing_blanks)
    (setq li_start (point))
    (forward-sexp)
    (rv_language_f_indent_region li_start (point))
    (rv_common_f_remove_trailing_blanks)))





(defun rv_js_f_reformat_code ()
  (interactive)

  (save-excursion
    (message "Removing useless blanks . . .")

    ;; <function> (...
    (goto-char (point-min))
    (while (re-search-forward "\\<\\(_?\\(f\\|e\\|lf\\)_[a-zA-Z_][a-zA-Z_0-9_]+\\)[ \t]+(" (point-max) t)
      (replace-match "\\1("))

    ;; (... function (...
    (goto-char (point-min))
    (while (re-search-forward "([ \t\n]+\\<function[ \t]*(" (point-max) t)
      (replace-match "(function("))

    ;; ,... function (...
    (goto-char (point-min))
    (while (re-search-forward ",[ \t\n]*\\<function[ \t]*(" (point-max) t)
      (replace-match ", function("))

    ;; return... (
    (goto-char (point-min))
    (while (re-search-forward "\\<return[ \t\n]*(" (point-max) t)
      (replace-match "return("))

    ;; if ( ...
    (goto-char (point-min))
    (while (re-search-forward "\\<if[ \t\n]*([ \t\n]*" (point-max) t)
      (replace-match "if ("))

    ;; ) ... {
    (goto-char (point-min))
    (while (re-search-forward ")[ \t\n]+{[ \t\n]*" (point-max) t)
      (replace-match ") {\n"))

    ;; ( ...
    (goto-char (point-min))
    (while (re-search-forward "([ \t]+" (point-max) t)
      (replace-match "("))

    ;; ... )
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+)" (point-max) t)
      (replace-match ")"))

    ;; ; ... }
    (goto-char (point-min))
    (while (re-search-forward ";[ \t\n]*}" (point-max) t)
      (replace-match ";\n}"))

    ;; } ... )
    (goto-char (point-min))
    (while (re-search-forward "}[ \t\n]+)" (point-max) t)
      (replace-match "})"))

    ;; ...;
    (goto-char (point-min))
    (while (re-search-forward "[ \t\n]+;" (point-max) t)
      (replace-match ";"))

    ;; ;;;;;
    (goto-char (point-min))
    (while (re-search-forward ";;+" (point-max) t)
      (replace-match ";"))

    ;; , ... }
    (goto-char (point-min))
    (while (re-search-forward ",[ \t\n]+}" (point-max) t)
      (replace-match "}"))

    ;; {...
    (goto-char (point-min))
    (while (re-search-forward "{[ \t]*\n[ \t\n]+" (point-max) t)
      (replace-match "{\n"))

    ;; else ... { ...
    (goto-char (point-min))
    (while (re-search-forward "\\<else[ \t\n]+{[ \t\n]*" (point-max) t)
      (replace-match "else {\n"))


    (message "Done !"))

  (rv_language_f_indent_region (point-min) (point-max)))




(defun rv_js_f_js_mode_hook ()
  (linum-mode t)
  (setq linum-format "%6d")

  (setq js-indent-level 2)
  (setq show-trailing-whitespace t)

  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key [f1] 'rv_js_f_indent_sexp)

  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?$ "w")

  (font-lock-mode t))
