
(defun rv_tmpl_f_insert_var_html ()
  (interactive)
  (insert "<tmpl_var escape=html  />"))



(defun rv_tmpl_f_tags_to_lower_case ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "</?tmpl_[a-z]+\\>" nil t)
      (replace-match (downcase (match-string 0)) t))))
