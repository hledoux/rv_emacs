

(defun rv_shell_script_f_shebang_check ()
  "If the current buffer starts with #!/foo/bar, invoke `bar-mode',\nif such a function exists."
  (if (save-excursion
	(goto-char (point-min))
	(looking-at "#![ \t]*\\([^ \t\n]*/\\)?\\([a-zA-Z0-9_.]+\\)"))
      (let ((ls_shell_mode (car (read-from-string
                                 (concat (buffer-substring (match-beginning 2)
                                                           (match-end 2))
                                         "-mode")))))
        (progn
          (and (symbolp ls_shell_mode)
               (fboundp ls_shell_mode)
               (funcall ls_shell_mode))

          (linum-mode t)
          (setq linum-format "%6d")

          ;; Extend "word" definition...
          (modify-syntax-entry ?_ "w")
          (modify-syntax-entry ?$ "w")

          (font-lock-mode t)))))
