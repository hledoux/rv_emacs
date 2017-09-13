(load "shell")



(setq _rv_shell_gi_buffer_sequence_number 0)
(defun rv_shell_f_create_new_shell ()
  (interactive)
  (and (get-buffer "*shell*")
       (progn
         (switch-to-buffer "*shell*")
         (rename-buffer (concat "*shell-0*"))))
  (shell)
  (sleep-for 2)
  (shell-resync-dirs)
  (buffer-disable-undo (current-buffer))
  (setq _rv_shell_gi_buffer_sequence_number (+ _rv_shell_gi_buffer_sequence_number 1))
  (rename-buffer (concat "*shell-" (number-to-string _rv_shell_gi_buffer_sequence_number) "*")))




(defun rv_shell_f_configure_fontify ()
  (interactive)
  (save-excursion
    (setq shell-font-lock-keywords
          (cons '("[ \t]\\([+-][-a-zA-Z0-9_]+\\)"
                  (1 font-lock-keyword-face))
                shell-font-lock-keywords))

    (setq shell-font-lock-keywords
          (cons '("[ \t]\\([+-][-a-zA-Z0-9_]+\\)=\\([^ \t\n]+\\)"
                  (1 font-lock-keyword-face)
                  (2 font-lock-string-face))
                shell-font-lock-keywords))))


(rv_shell_f_configure_fontify)


(defun rv_shell_f_command_cvs_upd_apache_graceful ()
  (interactive)
  (insert "cvs update ; apachectl.sh rotate_logs"))

(defun rv_shell_f_command_apache_rotate_logs ()
  (interactive)
  (insert "apachectl.sh fast_rotate_logs"))


(defun rv_shell_f_shell_mode_hook ()
  (setq shell-dirstack-query "dirs -l")

  (setq comint-completion-addsuffix t) ; insert space/slash after file completion
  (setq comint-completion-autolist t)  ; show completion list when ambiguous
  (setq comint-input-ignoredups t)     ; no duplicates in command history
  (setq comint-scroll-show-maximum-output t) ; scroll to show max possible output
  (setq comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
  (setq comint-scroll-to-bottom-on-output nil) ; always add output at the bottom
                                        ; (ansi-color-for-comint-mode-on)
  (define-key shell-mode-map [(meta return)] 'shell-resync-dirs)
  (define-key shell-mode-map [(meta p)] 'comint-previous-matching-input-from-input)
  (define-key shell-mode-map [(meta n)] 'comint-next-matching-input-from-input)
  (define-key shell-mode-map [(control meta l)] nil))
