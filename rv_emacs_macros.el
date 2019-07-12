
(defun rv_common_f_indent_save_close ()
  (interactive)
  (rv_language_f_re_indent_buffer))



(defun rv_common_f_next_error_indent_save_file ()
  (interactive)
  (save-excursion
    (next-error)
    (rv_common_f_indent_save_close)))



(defun rv_common_f_load_file_under_cursor_indent_save_close ()
  (interactive)
  (save-excursion
    (rv_common_f_load_file_under_cursor)
    (toggle-read-only)
    (rv_common_f_indent_save_close)))


(defun rv_common_f_mark_until_closing_parenthesis()
  (interactive)
  (mark-sexp))

(defun rv_common_f_mark_word_under_cursor()
  "select word under cursor"
  (interactive)
  (let (p1 p2)
    (while (looking-at "[a-zA-Z0-9_]")
      (forward-char 1))
    (setq p2 (point))

    (forward-char -1)
    (while (looking-at "[a-zA-Z0-9_]")
      (forward-char -1))
    (forward-char 1)
    (setq p1 (point))

    ;; (push-mark p2)
    ;; (setq mark-active t)

    (copy-region-as-kill p1 p2)))

