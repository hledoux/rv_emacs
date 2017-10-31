
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



;;; (global-set-key [f11] 'rv_common_f_load_file_under_cursor_indent_save_close)
(global-set-key [f11] 'rv_common_f_next_error_indent_save_file)

