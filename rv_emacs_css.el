
(defun rv_css_f_css_mode_hook ()
  (linum-mode t)

  (setq css-indent-level 2)

  (local-set-key (kbd "RET") 'newline-and-indent)

  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?$ "w")

  (font-lock-mode t))
