

(defun rv_language_f_indent_region (PointMin PointMax)
  (interactive)
  (save-excursion
    (narrow-to-region PointMin PointMax)
    (message "Indenting region...")
    (goto-char (point-min))
    (indent-according-to-mode)
    (while (eq (forward-line 1) 0)
      (indent-according-to-mode))
    (widen)
    (message "Done !")))




(defun rv_language_f_insert_todo ()
  (interactive)
  (insert "##TODO##"))



(defun rv_language_f_insert_header_method ()
  (interactive)
  (save-excursion
    (setq BufferName (buffer-name))
    (if (string-match "\\.\\([a-zA-Z][a-zA-Z0-9+]*\\)$" BufferName)
        (progn
          (setq Extension (downcase (substring BufferName (match-beginning 1) (match-end 1))))
          (message (concat "Buffer [" BufferName "] of type [" Extension "]"))
          (if (string-match "^\\(pl\\|pm\\)" Extension) (rv_perl_f_insert_header_method) nil)
          (if (string-match "^\\(spd\\)$" Extension) (rv_spd_f_insert_header_method) nil)
          (if (string-match "^\\(prc\\)$" Extension) (rv_sql_f_insert_header_method) nil)
          (if (string-match "^\\(js\\|cpp\\|cxx\\|c++\\|hpp\\|hxx\\|h++\\|c\\|h\\)$" Extension) (rv_cc_f_insert_header_method) nil)))))


(defun rv_language_f_insert_trace ()
  (interactive)
  (save-excursion
    (if (string-equal mode-name "Perl") (rv_perl_f_insert_trace) nil)
    (if (string-equal mode-name "SQL") (rv_sql_f_insert_trace) nil)))




(defun rv_language_f_update_history ()
  (interactive)
  (save-excursion
    (and (re-search-backward "\\<Last *modification *:" (point-min) t)
         (progn
           (and (re-search-forward "\\<Last *modification *:.*$" (point-max) t)
                (progn
                  (replace-match "Last modification : ")
                  (insert (current-time-string))
                  (insert " - ")
                  (insert (user-full-name))))))))



(defun rv_language_f_insert_header_class ()
  (interactive)
  (save-excursion
    (if (string-equal mode-name "Perl") (rv_perl_f_insert_header_class) nil)
    (if (string-equal mode-name "C++") (rv_cc_f_insert_header_class) nil)))


(defun rv_language_f_insert_separator ()
  (interactive)
  (save-excursion
    (if (string-equal mode-name "Perl") (rv_perl_f_insert_separator) nil)
    (if (string-equal mode-name "SQL") (rv_sql_f_insert_separator) nil)
    (if (string-equal mode-name "C++") (rv_cc_f_insert_separator) nil)))




(defun rv_language_f_re_indent_buffer ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^ */\\*\\*" (point-max) t)
      (replace-match "/* *"))
    (goto-char (point-min))
    (while (re-search-forward "\\*\\*/ *$" (point-max) t)
      (replace-match "* */"))
    (rv_language_f_indent_region (point-min) (point-max))
    (rv_common_f_remove_trailing_blanks)
    (rv_spd_f_normalize_space_between_queries)))



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
                          " *.ksh"
                          " *.mdl"
                          " *.oid"
                          " *.php"
                          " *.pl"
                          " *.pm"
                          " *.pod"
                          " *.prc"
                          " *.pxy"
                          " *.sh"
                          " *.spd"
                          " *.sql"
                          " *.sql_*"
                          " *.svg"
                          " *.tmpl"
                          " *.tpl"
                          " *.trg"
                          " *.txt"
                          " *.vie"
                          " *.web"
                          ))

           (StringToGrep (read-string "pattern to grep : "))
           (FileTypes (read-string (concat "in files (default : " DefaultFiles "): "))))
      (if (string-equal FileTypes "")
          (setq FileTypes DefaultFiles))
      (grep (concat "grep --no-messages --ignore-case --line-number '" StringToGrep "' " FileTypes)))))
