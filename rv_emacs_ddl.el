
(defun rv_ddl_f_reformat_code ()
  (interactive)
  (save-excursion
    ;; TAB ==> space
    (goto-char (point-min))
    (while (re-search-forward "\t+" (point-max) t)
      (replace-match " "))

    ;; trailing comma
    (goto-char (point-min))
    (while (re-search-forward "[ ]*,[ ]+" (point-max) t)
      (replace-match ", "))

    ;; normalize DDL_Col and similar
    (goto-char (point-min))
    (while (re-search-forward ",[ ]*[\n]+\\([ ]*\\)\\([_]?DDL_[cC]ol[a-zA-Z0-9_]*\\)[ \t\n]*(" (point-max) t)
      (replace-match ",\n\n\\1\\2("))

    (goto-char (point-min))
    (while (re-search-forward "^\\([ ]*\\)\\([_]?DDL_[cC]ol[a-zA-Z0-9_]*\\)[ \t\n]*(" (point-max) t)
      (replace-match "\\1\\2("))

    ;; -Name / -NameSuf / -UserType ==> lowercase
    (goto-char (point-min))
    (while (re-search-forward "-\\([a-zA-Z][a-zA-Z0-9_]+\\) *=> *" nil t)
      (replace-match (concat "-" (downcase (match-string 1)) " => ") t))

    ;; extra white-spaces
    (goto-char (point-min))
    (while (re-search-forward " +\\(=>\\|==\\|!=\\|<>\\|=\\) *" (point-max) t)
      (replace-match " \\1 "))

    ;; closing parent
    (goto-char (point-min))
    (while (re-search-forward ")[, \n]+)" (point-max) t)
      (replace-match "))"))

    ;; DDL_ColExtAttr / DDL_RelExtAttr
    (goto-char (point-min))
    (while (re-search-forward ",[ \n]*\\(DDL_ColExtAttr\\|DDL_RelExtAttr\\)[ \n]*(" (point-max) t)
      (replace-match ",\n           \\1("))))
