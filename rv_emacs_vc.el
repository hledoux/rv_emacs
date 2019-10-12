;;; VC - Version Control routines



(defun rv_vc_f_get_last_release_tag()
  "get the latest tag xxxx-rel-a-b-c(-d)"
  (interactive)
  (save-excursion
    (let ((ls_previous_release_tag nil))
      ;; history of version
      (vc-print-log)
      (sleep-for 2)

      ;; in this history, look for the latest tag like [xxxx-rel-a-b-c(-d)]
      (switch-to-buffer "*vc-change-log*")

      (goto-char (point-min))
      (if (re-search-forward "\\<\\(x[a-z]+\-rel\-[0-9]+\-[0-9+]+\-[0-9+]+\\(\-[0-9+]+\\)?\\)\\>" (point-max) t)
          (progn
            (setq ls_previous_release_tag (match-string 1))
            (message (concat "previous release: [" ls_previous_release_tag "]"))))

      (kill-buffer "*vc-change-log*")
      ls_previous_release_tag)))



(defun rv_vc_f_ediff_with_last_commit ()
  "compare the content of the current buffer with its last committed version"
  (interactive)
  (vc-revision-other-window "")
  (ediff-buffers (ediff-other-buffer "") (ediff-other-buffer (current-buffer))))


(defun rv_vc_f_ediff_with_last_release_tag ()
  "compare the content of the current buffer with its latest release tag"
  (interactive)
  (let ((ls_current_buffer (current-buffer))
        (ls_last_release_tag (rv_vc_f_get_last_release_tag)))
    (vc-revision-other-window ls_last_release_tag)
    (let ((ls_other_buffer (current-buffer)))

      (ediff-buffers ls_other_buffer ls_current_buffer))))
