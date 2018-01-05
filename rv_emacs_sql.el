(load "sql")


(defun rv_sql_f_insert_header_method ()
  (interactive)
  (let ((ProcName (read-string "ProcName = ")))
    (insert "
/* ********************************************************************
   FUNCTION DESCRIPTION :
   -
   ARGUMENTS :
   -
   RETURN VALUE :
   -
   HISTORY :
   - Creation          : ")
    (insert (current-time-string))
    (insert " - ")
    (insert (user-full-name))
    (insert "
   - Last modification : ")
    (insert (current-time-string))
    (insert " - ")
    (insert (user-full-name))
    (insert (concat "
   ******************************************************************** */
PRINT \"* Creating procedure '" ProcName "'\"
GO

IF EXISTS (SELECT \"x\" FROM sysobjects WHERE type = \"P\" AND name = \"" ProcName "\")
  BEGIN
    DROP PROCEDURE " ProcName "
  END
GO

CREATE PROCEDURE " ProcName "

##TODO## Place here procedure arguments

AS
BEGIN
  /* Default return value, means KO */
  DECLARE @Result int
  select @Result = 1

  ##TODO## Place here the procedure Body

  return @Result
END
GO
"))))


(defun rv_sql_f_insert_separator ()
  (interactive)
  (insert "
/* ********************************************************************
   -
   ******************************************************************** */
"))


(defun rv_sql_f_insert_trace ()
  (interactive)
  (insert "print \"\""))



(defun rv_sql_f_change_keywords_to_lower_one (Keyword)
  (interactive)
  (save-excursion
    (let ((DnKw (concat "\\<" (downcase Keyword) "\\>"))
          (UpKw (upcase Keyword)))
      (while (re-search-forward DnKw (point-max) t)
        (replace-match UpKw)))))


(defun rv_sql_f_change_keywords_to_lower_all ()
  (interactive)
  (save-excursion
    (mapc 'rv_sql_f_change_keywords_to_lower_one
          '(
            "all"
            "and"
            "as"
            "begin"
            "by"
            "char"
            "commit"
            "convert"
            "count"
            "create"
            "datediff"
            "datetime"
            "declare"
            "delete"
            "distinct"
            "drop"
            "else"
            "end"
            "exec"
            "execute"
            "exists"
            "fetch"
            "from"
            "go"
            "group"
            "if"
            "insert"
            "int"
            "into"
            "nocount"
            "not"
            "or"
            "print"
            "proc"
            "procedure"
            "rollback"
            "select"
            "set"
            "tran"
            "transaction"
            "union"
            "update"
            "use"
            "varchar"
            "where"
            "while"
            ))))





;; Change SQL comments like [ /* ... */ ]  into [ -- ... ]
(defun rv_sql_f_normalize_comments ()
  (interactive)
  (message (concat "replacing SQL comments in buffer " (buffer-name) "..."))

  (save-excursion

    (goto-char (point-min))
    (while (re-search-forward "^\\([\t ]+\\)\\/\\*[\t ]+\\(.*?\\)[\t ]+\\*\\/[\t ]*$" (point-max) t)
      (replace-match "\\1-- \\2")))

  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "\\([\t ]+\\)\\/\\*[\t ]+\\(.*?\\)[\t ]+\\*\\/[\t ]*$" (point-max) t)
      (replace-match " -- \\2")))

  (message (concat "replaced SQL comments in buffer " (buffer-name) " !")))


;;; ##TODO## fontify some missing SQL keywords: join


(defun rv_sql_f_sql_mode_hook ()
  (linum-mode t)

  ;; consider underscore as any standard letter in a word
  (modify-syntax-entry ?_ "w")

  (font-lock-mode t))

