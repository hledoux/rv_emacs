
(defun rv_text_f_text_mode_hook ()
  (setq show-trailing-whitespace t)
  (modify-syntax-entry ?_ "w")
  (font-lock-mode t))
