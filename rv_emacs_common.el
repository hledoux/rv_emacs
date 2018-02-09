;;; Helpers for code edition



(defun rv_common_f_reload_buffer ()
  (interactive)
  (save-excursion
    (let ((OldTruncateLines truncate-lines))
      (message (concat "re-loading buffer " (buffer-name) "..."))
      (revert-buffer t t)
      (setq truncate-lines OldTruncateLines)
      (message (concat "re-loaded buffer " (buffer-name) " !")))))



(defun rv_common_f_save_all_buffers ()
  (interactive)
  (save-excursion
    (save-some-buffers t)))


(defun rv_common_f_remove_trailing_blanks ()
  (interactive)
  (save-excursion
    (message (concat "removing trailing blanks from buffer " (buffer-name) "..."))
    (goto-char (point-min))
    (while (re-search-forward "[\t ]+$" (point-max) t)
      (replace-match ""))
    (message (concat "no more trailing blanks in buffer " (buffer-name) " !"))))


(defun rv_common_f_clean_save ()
  (interactive)
  (rv_common_f_remove_trailing_blanks) (save-buffer))


(defun rv_common_f_extract_file_name_under_cursor ()
  (interactive)
  (save-excursion
    (let ((Middle (point)))
      (while (looking-at "[^][<>\n\r\t '`\"{}();]")
        (forward-char -1))
      (forward-char 1)
      (let ((Start (point)))
        (goto-char Middle)
        (while (looking-at "[^][<>\n\r\t '`\"{}():;]")
          (forward-char 1))
        (let ((FileName (buffer-substring Start (point))))
          (message (concat "extracted file name : [" FileName "]"))
          FileName)))))



(defun rv_common_f_line_number_under_cursor ()
  (interactive)
  (save-excursion
    (let ((LineNumber nil))
      (while (looking-at "[^][<>\n\r\t '`\"():;]")
        (forward-char 1))
      (while (looking-at "[\t ]")
        (forward-char 1))
      (if (looking-at "[:]")
          (progn
            (forward-char 1)
            (let ((here (point)))
              (while (looking-at "[0-9]")
                (forward-char 1))
              (setq LineNumber (buffer-substring here (point)))
              (message (concat "extracted line number : " LineNumber)))))

      LineNumber)))


(defun rv_common_f_load_file_under_cursor ()
  (interactive)
  (let ((LineNumber (rv_common_f_line_number_under_cursor)))
    (find-file (rv_common_f_extract_file_name_under_cursor))
    (setq truncate-lines t)
    (toggle-read-only t)
    (if LineNumber
        (goto-line (string-to-number LineNumber)))))


(defun rv_common_f_goto_relative_line ()
  (interactive)
  (goto-line (- (+ (current-line) (string-to-number (read-string "Relative line from point : "))) 2)))


(defun rv_common_f_toggle_wrap_lines ()
  (interactive)
  (save-excursion
    (setq truncate-lines (not truncate-lines))
    (recenter)
    (scroll-right 10000)
    (message (if truncate-lines "long lines: truncating display" "long lines: wrapping"))))


(defun rv_common_f_rotate_buffer ()
  (interactive)
  (bury-buffer))


(defun rv_common_f_move_scroll_right ()
  (interactive)
  (goto-char (+ (point) 4))
  (scroll-left 4))


(defun rv_common_f_move_scroll_left ()
  (interactive)
  (goto-char (- (point) 4))
  (scroll-right 4))


(defun rv_common_f_move_buffer_beginning ()
  (interactive)
  (scroll-right 10000)
  (beginning-of-buffer))


(defun rv_common_f_move_buffer_end ()
  (interactive)
  (scroll-right 10000)
  (end-of-buffer))

(defun rv_common_f_move_scroll_up ()
  (interactive)
  (scroll-down 1))

(defun rv_common_f_move_scroll_down ()
  (interactive)
  (scroll-up 1))


(defun rv_common_f_kill_current_buffer ()
  (interactive)
  (kill-buffer nil))


(defun rv_common_f_goto_next_error ()
  (interactive)
  (next-error))




(defun rv_common_f_turn_buffer_into_single_line ()
  (interactive)
  (save-excursion

    ;;  remove <new-lines>
    (save-excursion
      (while (re-search-forward "[\t ]*\\(\n[\t ]*\\)+" (point-max) t)
        (replace-match " ")))

    ;; remove special sequences
    (save-excursion
      (while (re-search-forward " [^\t\ ] " (point-max) t)
        (replace-match " ")))

    (message "turned into a single line !")))


(defun rv_common_f_sort_selection_lines ()
  (interactive)
  (save-excursion
    (sort-lines nil (region-beginning) (region-end))))


(setq _rv_common_cs_swap_tag "xXxXxXxXxXxXx")

(defun rv_common_f_swap_text ()
  (interactive)
  (save-excursion
    (let (
          (Text-1 (read-string "Text 1 : "))
          (Text-2 (read-string "Text 2 : ")))
      (narrow-to-region (region-beginning) (region-end))
      (goto-char (point-min))
      (while (search-forward Text-1 (point-max) t)
        (replace-match _rv_common_cs_swap_tag))
      (goto-char (point-min))
      (while (search-forward Text-2 (point-max) t)
        (replace-match Text-1))
      (goto-char (point-min))
      (while (search-forward _rv_common_cs_swap_tag (point-max) t)
        (replace-match Text-2))
      (widen))))




(defun rv_common_f_ediff_with_previous_version ()
  "compare the content of the current buffer with its previous version"
  (interactive)
  (save-excursion
    (vc-revision-other-window "")
    (ediff-buffers (ediff-other-buffer "") (ediff-other-buffer (current-buffer)))))


(defun rv_common_f_find_file_hook ()
  (rv_shell_script_f_shebang_check))


(defun rv_common_f_insert_tab ()
  (interactive)
  (insert "\t"))


(defun rv_common_stop_using_minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

