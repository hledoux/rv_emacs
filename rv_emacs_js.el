


(defun rv_js_f_insert_header_method ()
  (interactive)
  (let ((ls_func_name (read-string "FuncName = ")))
    (let ((Intro (concat "
// ********************************************************************
//  FUNCTION DESCRIPTION :
//  -
//  ARGUMENTS :
//  -
//  RETURN VALUE :
//  -
//  HISTORY :
//  - Creation          : "
                         (current-time-string)
                         " - "
                         (user-full-name)
                         "
//  - Last modification : "
                         (current-time-string)
                         " - "
                         (user-full-name)
                         "
// ********************************************************************
function " ls_func_name "(...) {
  // ##TODO##
  console.error('##TODO## Function [" ls_func_name "] not yet implemented !');
}
")))

      (insert (concat Intro)))))


(defun rv_js_f_insert_separator ()
  (interactive)
  (insert "
// ********************************************************************
//  -
// ********************************************************************
"))



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
    (message (concat "reformatting JS code in buffer " (buffer-name) "..."))

    ;; <function> (...
    (goto-char (point-min))
    (while (re-search-forward "\\<\\(_?\\(f\\|e\\|lf\\)_[a-zA-Z_][a-zA-Z_0-9_]+\\)[ \t]+(" (point-max) t)
      (replace-match "\\1("))

    ;; (... function (...
    (goto-char (point-min))
    (while (re-search-forward "([ \t\n]+\\<function[ \t]*(" (point-max) t)
      (replace-match "(function ("))

    ;; ,... function (...
    (goto-char (point-min))
    (while (re-search-forward ",[ \t\n]*\\<function[ \t]*(" (point-max) t)
      (replace-match ", function ("))

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

    (rv_language_f_indent_region (point-min) (point-max))

    (message (concat "reformatted JS code in buffer " (buffer-name) " !"))))




(defun rv_js_f_js_mode_hook ()
  (linum-mode t)

  (setq js-indent-level 2)

  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key [f1] 'rv_js_f_indent_sexp)

  ;; consider underscore and dollar sign are part of words
  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?$ "w")

  ;; support of back-quotes
  (modify-syntax-entry ?` "\"")


  (font-lock-add-keywords nil
                          '(
                            ;; method / function calls
                            ("\\.?\\<\\([A-Za-z0-9_]+\\)[\t \n\r]*(" (1 font-lock-function-name-face))


                            ;; name: value
                            ("\\<\\([A-Za-z0-9_]+\\)\\>[ \t]*:" (1 font-lock-builtin-face))
                            ("\\.\\<\\([A-Za-z0-9_]+\\)\\>" (1 font-lock-builtin-face))


                            ;; variable compliant with our naming conventions
                            ("\\<\\([lgcpa][abhsifnorx]_[A-Za-z][A-Za-z0-9_]*\\)\\>" (1 font-lock-variable-name-face))


                            ;; function / method name compliant with our naming conventions
                            ("\\<\\(_?[fm]_[A-Za-z][A-Za-z0-9_]*\\)\\>" (1 font-lock-function-name-face))))

  (font-lock-mode t))




(defun rv_js_f_js2_mode_hook ()
  (linum-mode t)

  (setq js2-basic-offset 2)

  ;; (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key [f1] 'rv_js_f_indent_sexp)

  ;; (modify-syntax-entry ?_ "w")
  ;; (modify-syntax-entry ?$ "w")
  ;; (modify-syntax-entry ?` "\"")

  (font-lock-mode t))
