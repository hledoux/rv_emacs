

(defun rv_language_f_current_time_string ()
  (interactive)
  (format-time-string "%Y-%m-%d %T"))


(defun rv_language_f_current_user_name ()
  (interactive)
  (concat (user-login-name)))


(defun rv_language_f_indent_region (PointMin PointMax)
  (interactive)
  (save-excursion
    (narrow-to-region PointMin PointMax)
    (message (concat "indenting region in buffer " (buffer-name) "..."))
    (goto-char (point-min))
    (indent-according-to-mode)
    (while (eq (forward-line 1) 0)
      (indent-according-to-mode))
    (widen)
    (message (concat "indentation done in buffer " (buffer-name) " !"))))




(defun rv_language_f_insert_todo ()
  (interactive)
  (insert "##TODO##"))


(defun rv_language_f_buffer_ext ()
  (interactive)
  (setq ls_buffer_name (buffer-name))
  (if (string-match "\\.\\([a-zA-Z][a-zA-Z0-9_+]*\\)\\(\\.~[-a-zA-Z0-9.#~]+\\)?$" ls_buffer_name)
      (downcase (substring ls_buffer_name (match-beginning 1) (match-end 1)))))


(defun rv_language_f_insert_header_method ()
  (interactive)
  (save-excursion
    (message (concat "buffer [" (buffer-name) "] of type [" (rv_language_f_buffer_ext) "]"))
    (rv_js_f_insert_method)
    (rv_perl_f_insert_header_method)
    (rv_spd_f_insert_header_method)
    (rv_sql_f_insert_header_method)
    (rv_cc_f_insert_header_method)))


(defun rv_language_f_insert_trace ()
  (interactive)
  (save-excursion
    (rv_perl_f_insert_trace)
    (rv_js_f_insert_trace)
    (rv_sql_f_insert_trace)))




(defun rv_language_f_update_history ()
  (interactive)
  (save-excursion
    (cond

     ;; * @modified 2019-05-16 07:38:43 (hledoux)
     ((and (re-search-backward "^ *\\* *@modified " (point-min) t)
           (progn
             (and (re-search-forward "^\\(\\( *\\* *@modified\\).*\\)$" (point-max) t)
                  (progn
                    (replace-match (concat "\\1\n\\2 " (rv_language_f_current_time_string) " (" (rv_language_f_current_user_name)")")))))) t)

     ((and (re-search-backward "\\<Last *modification *:" (point-min) t)
           (progn
             (and (re-search-forward "\\<Last *modification *:.*$" (point-max) t)
                  (progn
                    (replace-match "Last modification : ")
                    (insert (rv_language_f_current_time_string))
                    (insert " - ")
                    (insert (rv_language_f_current_user_name)))))) t))))



(defun rv_language_f_insert_header_class ()
  (interactive)
  (save-excursion
    (rv_js_f_insert_header_class)
    (rv_perl_f_insert_header_class)
    (rv_cc_f_insert_header_class)))


(defun rv_language_f_insert_separator ()
  (interactive)
  (save-excursion
    (rv_js_f_insert_separator)
    (rv_perl_f_insert_separator)
    (rv_sql_f_insert_separator)
    (rv_cc_f_insert_separator)))




(defun rv_language_f_re_indent_buffer ()
  (interactive)
  (save-excursion
    (rv_common_f_remove_trailing_blanks)

    (goto-char (point-min))
    (while (re-search-forward "^ */\\*\\*\\*" (point-max) t)
      (replace-match "/* **"))

    (goto-char (point-min))
    (while (re-search-forward "\\*\\*/ *$" (point-max) t)
      (replace-match "* */"))

    (rv_spd_f_normalize_space_between_blocks)
    (rv_perl_f_normalize_space_between_blocks)
    (rv_js_f_normalize_space_between_blocks)

    (rv_language_f_indent_region (point-min) (point-max))
    (rv_common_f_remove_trailing_blanks)))



(defun rv_language_f_source_grep ()
  (interactive)
  (save-excursion
    (let* ((DefaultFiles (concat
                          " *.c"
                          " *.conf"
                          " *.csh"
                          " *.css"
                          " *.ddl"
                          " *.ddl_inc"
                          " *.ddl_typ"
                          " *.dic"
                          " *.el"
                          " *.gcl"
                          " *.h"
                          " *.html"
                          " *.inc"
                          " *.js"
                          " *.json"
                          " *.json_mdl"
                          " *.ksh"
                          " *.md"
                          " *.mdl"
                          " *.oid"
                          " *.out"
                          " *.php"
                          " *.pl"
                          " *.pm"
                          " *.pod"
                          " *.prc"
                          " *.pxy"
                          " *.service"
                          " *.sh"
                          " *.spd"
                          " *.spd_inc"
                          " *.sql"
                          " *.sql_*"
                          " *.svg"
                          " *.tmpl"
                          " *.tpl"
                          " *.trg"
                          " *.txt"
                          " *.vie"
                          ))

           (StringToGrep (read-string "pattern to grep : "))
           (FileTypes (read-string (concat "in files (default : " DefaultFiles "): "))))
      (if (string-equal FileTypes "")
          (setq FileTypes DefaultFiles))
      (grep (concat "grep --no-messages --ignore-case --line-number '" StringToGrep "' " FileTypes)))))
