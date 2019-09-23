(global-set-key [(control <)] 'tabbar-backward-tab)
(global-set-key [(control >)] 'tabbar-forward-tab)
(global-set-key [(control B)] 'rv_shell_f_create_new_shell_agtwbe) ; C-S-b = BE zone
(global-set-key [(control F)] 'rv_shell_f_create_new_shell_agtwfe) ; C-S-f = FE zone
(global-set-key [(control V)] 'vc-revision-other-window) ; C-S-v = show other revision / version
(global-set-key [(control a)] 'mark-whole-buffer) ; C-a = usual short-cut
(global-set-key [(control c)] 'copy-region-as-kill) ; C-c = usual short-cut
(global-set-key [(control end)] 'rv_common_f_move_buffer_end) ; C-end
(global-set-key [(control f12)] 'rv_common_f_ediff_with_last_commit) ; C-F12 = compare with last committed revision
(global-set-key [(control home)] 'rv_common_f_move_buffer_beginning) ; C-home
(global-set-key [(control meta down)] 'rv_common_f_move_scroll_down) ; C-M-down = scroll one line down
(global-set-key [(control meta l)] 'rv_common_f_toggle_wrap_lines) ; C-M-l = wrap lines on | off
(global-set-key [(control meta left)] 'rv_common_f_move_scroll_left)
(global-set-key [(control meta q)] 'rv_common_f_goto_relative_line) ; C-M-q = move +N lines ahead
(global-set-key [(control meta right)] 'rv_common_f_move_scroll_right)
(global-set-key [(control meta right)] 'rv_common_f_move_scroll_right)
(global-set-key [(control meta s)] 'rv_common_f_sort_lines_selected) ; C-M-s = sort
(global-set-key [(control meta up)] 'rv_common_f_move_scroll_up) ; C-M-up = scroll one line up
(global-set-key [(control next)] 'end-of-buffer) ; C-PgDn = end of buffer
(global-set-key [(control p)] 'rv_language_f_re_indent_buffer) ; P-p = pretty-print - re-indent the whole buffer
(global-set-key [(control prior)] 'beginning-of-buffer) ; C-PgUp = end of buffer
(global-set-key [(control q)] 'goto-line) ; C-q = goto line N
(global-set-key [(control return)] 'rv_common_f_turn_buffer_into_single_line)
(global-set-key [(control t)] 'rv_language_f_insert_trace) ; C-t = trace for debug
(global-set-key [(control tab)] 'other-window) ; C-tab = switch buffer (in split mode)
(global-set-key [(control v)] 'yank) ; C-v = usual short-cut
(global-set-key [(control x) ?g] 'insert-register) ; C-x g a = insert content of register a
(global-set-key [(control x) ?x] 'copy-to-register) ; C-x x a = copy selction into register a
(global-set-key [(control z)] 'undo) ; C-z = usual short-cut
(global-set-key [(meta b)] 'rv_common_f_rotate_to_next_buffer) ; M-b = rotation of buffers - bury the current buffer to the end of the buffer stack
(global-set-key [(meta backspace)] 'backward-kill-word)
(global-set-key [(meta c)] 'rv_common_f_mark_until_closing_parenthesis) ; M-c = mark until associated parenthesis
(global-set-key [(meta control tab)] 'tab-to-tab-stop)
(global-set-key [(meta delete)] 'backward-kill-word)
(global-set-key [(meta down)] 'rv_common_f_move_scroll_other_up)
(global-set-key [(meta end)] 'end-of-buffer-other-window)
(global-set-key [(meta f)] 'rv_language_f_insert_header_method) ;; M-f = create a brand new function
(global-set-key [(meta g)] 'rv_language_f_source_grep)
(global-set-key [(meta home)] 'beginning-of-buffer-other-window)
(global-set-key [(meta l)] 'rv_language_f_insert_separator)
(global-set-key [(meta left)] 'backward-sexp) ; M-left = matching opening
(global-set-key [(meta m)] 'rv_common_f_mark_word_under_cursor) ; M-m = select word (mot)
(global-set-key [(meta next)] 'scroll-other-window) ; M-PgDn = scroll other buffer
(global-set-key [(meta o)] 'rv_shell_f_create_new_shell) ; M-o = open a new shell
(global-set-key [(meta prior)] 'scroll-other-window-down) ; M-PgUp = scroll other buffer
(global-set-key [(meta q)] 'query-replace-regexp) ; M-q = replace regexp
(global-set-key [(meta r)] 'rv_common_f_reload_buffer) ;; M-r = reload buffer from disk
(global-set-key [(meta right)] 'forward-sexp) ; M-right = matching closing
(global-set-key [(meta s)] 'rv_common_f_save_all_buffers) ; M-s = save all buffers
(global-set-key [(meta t)] 'rv_language_f_insert_todo) ; M-t = ##TODO##
(global-set-key [(meta u)] 'rv_language_f_update_history) ; M-u = update last modification in function header
(global-set-key [(meta up)] 'rv_common_f_move_scroll_other_down) ; M-up = scroll other buffer up
(global-set-key [(meta v)] 'rv_tmpl_f_insert_var_html) ;; M-v = insert <tmpl_var escape=html  />
(global-set-key [(shift dead-diaeresis)] 'rv_common_f_insert_double_quote)
(global-set-key [(shift dead-tilde)] 'rv_common_f_insert_tilde)
(global-set-key [(shift meta left)] 'backward-sexp-mark)
(global-set-key [(shift meta right)] 'forward-sexp-mark)
(global-set-key [(shift tab)] 'rv_common_f_insert_tab) ; M-S-tab = insert a true <TAB> char
(global-set-key [backspace] 'backward-delete-char-untabify) ; backward
(global-set-key [dead-acute] 'rv_common_f_insert_single_quote)
(global-set-key [dead-grave] 'rv_common_f_insert_back_quote)
(global-set-key [dead-tilde] 'rv_common_f_insert_tilde)
(global-set-key [delete] 'delete-char) ; del
(global-set-key [end] 'end-of-line) ; end
(global-set-key [f10] 'rv_shell_f_command_apache_rotate_logs) ; F10 = ccc_daemon.pl -v apache rotate
(global-set-key [f11] 'c-hungry-delete-forward)
(global-set-key [f12] 'rv_common_f_kill_current_buffer) ; F12 = close current buffer
(global-set-key [f2] 'rv_common_f_clean_save) ; F2 = remove trailing spaces and save
(global-set-key [f3] 'find-file) ; F3 = open file
(global-set-key [f4] 'repeat-complex-command) ; F4 = repeat previous command
(global-set-key [f5] 'rv_common_f_load_file_under_cursor) ; F5 = load file name under cursor
(global-set-key [f6] 'undo) ; F6 = C-z = undo
(global-set-key [f7] 'compile) ; F7 = laumch make
(global-set-key [f8] 'rv_common_f_goto_next_error) ; F8 = goto next grep match / make error
(global-set-key [f9] 'fill-paragraph) ; F9 = format current paragraph
(global-set-key [home] 'beginning-of-line) ; home
(global-set-key [kp-delete] 'delete-char) ; delete
(global-set-key [next] 'scroll-up) ; PgUp
(global-set-key [prior] 'scroll-down) ; PgDn

;; (global-set-key [(meta c)] 'rv_language_f_insert_header_class)
;; (global-set-key [f11] 'rv_common_f_load_file_under_cursor_indent_save_close)
;; (global-set-key [f11] 'rv_common_f_next_error_indent_save_file)
