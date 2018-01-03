
(defun rv_text_f_text_mode_hook ()
  (linum-mode t)
  (modify-syntax-entry ?_ "w")
  (font-lock-mode t))
