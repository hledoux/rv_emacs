(load "shell")


(setq _rv_shell_gi_buffer_seq_number 0)
(defun rv_shell_f_allocate_shell_id ()
  (setq _rv_shell_gi_buffer_seq_number (+ _rv_shell_gi_buffer_seq_number 1))
  (concat "SHELL-" (format "%03d" _rv_shell_gi_buffer_seq_number) ""))


(defun rv_shell_f_create_new_shell ()
  "open a new local shell"
  (interactive)
  (and (get-buffer "*shell*")
       (progn
         (switch-to-buffer "*shell*")
         (rename-buffer (rv_shell_f_allocate_shell_id))))
  (shell)
  (sleep-for 2)
  (shell-resync-dirs)
  (buffer-disable-undo (current-buffer))
  (setq _rv_shell_gi_buffer_seq_number (+ _rv_shell_gi_buffer_seq_number 1))
  (rename-buffer (rv_shell_f_allocate_shell_id)))




(defun rv_shell_f_create_new_shell_agtw (ps_agtwbe_or_agtwfe)
  (shell)
  (setq _rv_shell_gi_buffer_seq_number (+ _rv_shell_gi_buffer_seq_number 1))
  (rename-buffer (concat (upcase ps_agtwbe_or_agtwfe) "-" (format "%03d" _rv_shell_gi_buffer_seq_number)))
  (buffer-disable-undo (current-buffer))
  (let* ((lo_proc (get-buffer-process (current-buffer)))
         (li_pmark (process-mark lo_proc)))
    (goto-char li_pmark)
    (sit-for 1)
    (comint-send-string lo_proc (concat "rssh " ps_agtwbe_or_agtwfe "\n"))))


(defun rv_shell_f_create_new_shell_agtwbe ()
  "open a new shell AGTWBE-xxx"
  (interactive)
  (rv_shell_f_create_new_shell_agtw "agtwbe"))


(defun rv_shell_f_create_new_shell_agtwfe ()
  "open a new shell AGTWFE-xxx"
  (interactive)
  (rv_shell_f_create_new_shell_agtw "agtwfe"))




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
  (insert "ccc_daemon.pl -v apache rotate"))


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
