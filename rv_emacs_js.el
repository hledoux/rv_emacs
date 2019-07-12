
(defun rv_js_f_is_javascript_mode ()
  (string-equal (downcase mode-name) "javascript"))



(defun rv_js_f_normalize_space_between_blocks ()
  (interactive)
  (save-excursion
    (if (rv_js_f_is_javascript_mode)
        (progn
          (goto-char 1)
          (while (re-search-forward "\\}\n+\\( */\\*\\*\n+\\)" (point-max) t)
            (replace-match "}\n\n\n\n\\1"))

          ;; try { ... }
          (goto-char 1)
          (while (re-search-forward "\n+ *try[\n ]*{" (point-max) t)
            (replace-match "\n\n try {"))

          ;; catch (...)
          (goto-char 1)
          (while (re-search-forward "\\}[\n ]*catch[\n ]*(" (point-max) t)
            (replace-match "}\n\n catch ("))

          ;; function (...)
          (goto-char 1)
          (while (re-search-forward "\\<function *(" (point-max) t)
            (replace-match "function ("))


          ;; after function / method end
          (goto-char 1)
          (while (re-search-forward "\\(\n[ ]*}\\)\n+\\([ ]*/\\*\\*\\|// \\)" (point-max) t)
            (replace-match "\\1\n\n\n\n\\2"))))))


(defun rv_js_f_insert_header_class ()
  (interactive)
  (if (rv_js_f_is_javascript_mode)
      (progn
        (insert "
/**
   @class TC_...
   @extends TC_...
*/
class TC_... extends TC_... {
  ...
}
"))))



(defun rv_js_f_insert_method ()
  (interactive)
  (if (rv_js_f_is_javascript_mode)
      (progn
        (rv_js_f_insert_header_method t))))



(defun rv_js_f_insert_header_method (&optional pb_with_body)
  (interactive)
  (if (rv_js_f_is_javascript_mode)
      (progn
        (let ((ls_func_name (read-string "function or method = ")))

          (let* (
                 ;; public | private
                 (ls_public_private
                  (cond
                   ((string-match "^[_]" ls_func_name) "private")
                   (t "public")))

                 ;; constructor | method | function
                 (ls_func_type
                  (cond

                   ;; constructor
                   ((string-match "^constructor$" ls_func_name) "constructor")

                   ;; method [m_...] or [_m_...]
                   ((string-match "^[_]?m_" ls_func_name) "method")

                   ;; function
                   (t "function")))

                 ;; "" | "function "
                 (ls_gen_func_type
                  (cond

                   ;; function
                   ((string-equal ls_func_type "function") "function ")

                   ;; any other case
                   (t "")))

                 ;; init this ?
                 (ls_gen_this
                  (cond

                   ;; method
                   ((string-equal ls_func_type "method") "\n  const lo_self = this;")

                   ;; any other case
                   (t ""))))

            (insert (concat "
/**
 * *********************************************************************
 * @" ls_func_type " " ls_func_name "
 * @access " ls_public_private "
 * @description (...describe the " ls_func_type "...)
 *
 * @param {number} pi_number - (...first argument...)
 * @param {string} ps_string - (...second argument...)
 * @param {array} pa_array - (...third argument...)
 * @param {boolean} [pb_option=false] - (...option extra argument...)
 * @param {function} pf_callback(po_error)
 *
 * @throws (...describe the exceptions that can be thrown...)
 *
 * @returns {Boolean} (...return value...)
 *
 * @author   " (rv_language_f_current_user_name) "
 * @since    " (rv_language_f_current_time_string) "
 * @modified " (rv_language_f_current_time_string) " (" (rv_language_f_current_user_name) ") - init
 * ******************************************************************** */
"))

            (if pb_with_body
                (insert (concat ls_gen_func_type ls_func_name "(...) {" ls_gen_this "
  try {
    f_console_error(`##TODO## " ls_func_type " [" ls_func_name "] not implemented !`);
  }

  catch (po_catch_err) {
    f_console_catch(po_catch_err);
  }
}
"))))))))








(defun rv_js_f_insert_trace ()
  (interactive)
  (if (rv_js_f_is_javascript_mode)
      (progn
        (insert "f_console_debug_pkg(__filename, function() {
  # ##TODO## your debug code here
  f_console_inspect(...);
});
"))))


(defun rv_js_f_insert_separator ()
  (interactive)
  (if (rv_js_f_is_javascript_mode)
      (progn
        (insert "
/**
 * ********************************************************************
 *  -
 ******************************************************************** */
"))))



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



(defun rv_js_f_install_imenu ()
  (interactive)
  (save-excursion

    ;; define the patterns to capture the main elements of the source code
    ;; https://www.emacswiki.org/emacs/RegularExpression
    (setq imenu-generic-expression
          '(
            ("var"     "^\\s-*var\\s-+\\([a-zA-Z_][a-zA-Z0-9_]+\\)" 1)
            ("let"     "^\\s-*let\\s-+\\([a-zA-Z_][a-zA-Z0-9_]+\\)" 1)
            ("const"     "^\\s-*const\\s-+\\([a-zA-Z_][a-zA-Z0-9_]+\\)" 1)
            ("class"     "^\\s-*class\\s-+\\([a-zA-Z_][a-zA-Z0-9_]+\\(\\s-+extends [a-zA-Z_][a-zA-Z0-9_]+\\)?\\)" 1)
            ("function" "^\\s-*function\\s-*\\([a-zA-Z_][A-Za-z0-9_]+\\)" 1)
            ("method" "^\\s-*\\(_?m_[A-Za-z0-9_]+\\)\\s-*(" 1)
            ("require"     "\\brequire\\s-*(\\s-*\\(\"\\)\\([^\"]+\\)\"\\s-*)" 2)
            ("require"     "\\brequire\\s-*(\\s-*\\('\\)\\([^']+\\)'\\s-*)" 2)))

    ;; restore the basic behavior of imenu - overwrite the dummy one provided by
    ;; js-mode
    (setq imenu-create-index-function 'imenu-default-create-index-function)

    ;; new entry in the main menu bar
    (imenu-add-to-menubar "JS-index")))


(defun rv_js_f_js_mode_hook ()
  (linum-mode t)

  (setq c-block-comment-start-regexp "/\\*")

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
                            ;; special symbols
                            ("\\<\\(this\\|lo_self\\|po_self\\)\\>" (1 font-lock-keyword-face))


                            ;; numeric constants
                            ("\\(\\([-+][ \t]*\\)?\\<[0-9]+\\(\\.[0-9+]\\)?\\>\\)" (1 font-lock-builtin-face))


                            ;; method / function calls
                            ("\\.?\\<\\([A-Za-z_][A-Za-z0-9_]*\\)[\t \n\r]*(" (1 font-lock-function-name-face))


                            ;; name: value
                            ("\\<\\([A-Za-z0-9_]+\\)\\>[ \t]*:" (1 font-lock-builtin-face))
                            ("\\.\\<\\([A-Za-z0-9_]+\\)\\>" (1 font-lock-builtin-face))


                            ;; variable compliant with our naming conventions
                            ("\\<\\([lgcpa][abehsifnorx]_[A-Za-z][A-Za-z0-9_]*\\)\\>" (1 font-lock-variable-name-face))


                            ;; function / method name compliant with our naming conventions
                            ("\\<\\(_?[fm]_[A-Za-z][A-Za-z0-9_]*\\)\\>" (1 font-lock-function-name-face))))

  (font-lock-mode t)
  (rv_js_f_install_imenu))



(defun rv_js_f_js2_mode_hook ()
  (linum-mode t)

  (setq js2-basic-offset 2)

  ;; (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key [f1] 'rv_js_f_indent_sexp)

  ;; (modify-syntax-entry ?_ "w")
  ;; (modify-syntax-entry ?$ "w")
  ;; (modify-syntax-entry ?` "\"")

  (font-lock-mode t))



;; attempt to automatically convert old-style [FUNCTION DESCRIPTION] headers
;; into proper JSdoc format

(defun rv_js_f_function_description_to_jsdoc ()
  (interactive)
  (save-excursion
    (while (re-search-forward "^[ ]*//[ ]*[*][*][*][*]+[\n ]+//[ ]*FUNCTION[ ]+DESCRIPTION[ ]*:[\n ]+" (point-max) t)
      (if (re-search-backward "^[ ]*//[ ]*[*][*][*][*]+[\n ]+//[ ]*FUNCTION[ ]+DESCRIPTION[ ]*:[\n ]+" (point-min))
          (let ((li_beg_point (point))
                (li_end_point (point))
                (ls_func_type "method")
                (ls_func_name "")
                (ls_public_private "public"))
            (forward-char 2)
            (if (re-search-forward "^[ ]*//[ ]*\\([*][*][*][*]*\\)[ \n]+\\([ ]*\\(\\(function\\)?[ ]*[a-zA-Z0-9_]+\\|[_]?m_[a-zA-Z0-9_]+\\)\\)[ ]*")
                (progn
                  (setq ls_func_name (match-string 3))
                  (replace-match "\\1 */\n\\2" t)

                  (if (string-match "function[ ]*\\([a-zA-Z0-9_]+\\)" ls_func_name)
                      (progn
                        (setq ls_func_name (match-string 1 ls_func_name))
                        (setq ls_func_type "function")))

                  (if (string-match "^_" ls_func_name)
                      (setq ls_public_private "private"))

                  (setq li_end_point (point))
                  (narrow-to-region li_beg_point li_end_point)

                  (goto-char (point-min))
                  (_rv_js_f_function_description_to_jsdoc_history)
                  (_rv_js_f_function_description_to_jsdoc_return_value)
                  (_rv_js_f_function_description_to_jsdoc_arguments)

                  (goto-char (point-min))
                  (if (re-search-forward "[\n ]*//[ ]*FUNCTION[ ]*DESCRIPTION[-: \n/]+")
                      (progn
                        (replace-match (concat "\n * @access " ls_public_private "\n * @" ls_func_type " " ls_func_name "\n * @description ") t)))

                  (goto-char (point-min))
                  (insert "/**\n")

                  (while (re-search-forward "^ *// *" (point-max) t)
                    (replace-match " * " t))
                  (widen))))))))


(defun _rv_js_f_function_description_to_jsdoc_arguments ()
  (interactive)
  (save-excursion
    ;; //  ARGUMENTS :
    ;; //  ARGUMENTS (ph_args):
    (if (re-search-forward "[\n ]*//[ ]*ARGUMENTS.*")
        (progn
          (replace-match "\n *" t)

          (let ((li_arg_point (point)))

            ;; - pb_arg (opt):  ...
            ;; - pb_arg: (opt) ...
            (goto-char li_arg_point)
            (while (re-search-forward "^[ ]*//[ ]*-[ ]*\\([\\.a-zA-Z0-9_]+\\)[-: ]*(opt)[-: ]*\\(.*\\)" (point-max) t)
              (replace-match " *\n * @param {} [\\1] - \\2" t))

            ;; - ps_arg: ...
            (goto-char li_arg_point)
            (while (re-search-forward "^[ ]*//[ ]*-[ ]*\\([\\.a-zA-Z0-9_]+\\)[-: ]*\\(.*\\)" (point-max) t)
              (replace-match " *\n  * @param {} \\1 - \\2" t))

            ;; - pf_async_load(po_error, ph_config) : ...
            (goto-char li_arg_point)
            (while (re-search-forward "^[ ]*//[ ]*-[ ]*\\([\\.a-zA-Z0-9_]+\\)[ ]*\\(([^)]*)\\)[-: ]*\\(.*\\)" (point-max) t)
              (replace-match " *\n * @param {} \\1\\2 - \\3" t)))))))


(defun _rv_js_f_function_description_to_jsdoc_return_value ()
  (interactive)
  (save-excursion
    (if (re-search-forward "[\n ]*//[ ]*RETURN[ ]*VALUE[ ]*:.*")
        (progn
          (replace-match "\n *" t)

          (while (re-search-forward "^[ ]*//[ ]*-[ ]*\\(.*\\)" (point-max) t)
            (replace-match " * @returns \\1" t))))))


(defun _rv_js_f_function_description_to_jsdoc_history ()
  (interactive)
  (save-excursion
    (if (re-search-forward "[\n ]*//[ ]*HISTORY[ ]*:.*")
        (progn
          (replace-match "\n *" t)

          (while (re-search-forward "^[ ]*//[ ]*-[ ]*Creation[ ]*:[ ]*\\(.*?\\) - \\(.*\\)$" (point-max) t)
            (replace-match " * @author   \\2\n * @since    \\1" t))

          (while (re-search-forward "^[ ]*//[ ]*-[ ]*Last modification[ ]*:[ ]*\\(.*?\\) - \\(.*\\)$" (point-max) t)
            (replace-match " * @modified \\1 (\\2)" t))))))
