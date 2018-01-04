(add-to-list 'auto-mode-alist '("/etc/.*" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("[Mm]akefile" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.C$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("\\.cpp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cxx$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ddl$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.ddl_\\(inc\\|typ\\)$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.dic$" . text-mode))
(add-to-list 'auto-mode-alist '("\\.doc$" . nroff-mode))
(add-to-list 'auto-mode-alist '("\\.el\\.gz$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.env$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.gcl$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.gen$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.grammar$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.htaccess\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.hxx$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inc.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inl$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.l$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.lex$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.log$" . text-mode))
(add-to-list 'auto-mode-alist '("\\.mib$" . text-mode))
(add-to-list 'auto-mode-alist '("\\.mk$" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.out$" . text-mode))
(add-to-list 'auto-mode-alist '("\\.pc$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.pm$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.pmp$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.prc$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.pxy$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.service$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.sp$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.spd$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.spd_inc$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.sql.*$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.svg$" . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.tbl$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tmplcache$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.tpl$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.trg$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . text-mode))
(add-to-list 'auto-mode-alist '("\\.uil$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.vie$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.wsdl$" . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.x$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.xml$" . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.y$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.yac$" . c++-mode))
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))


(add-hook 'css-mode-hook 'rv_css_f_css_mode_hook)
(add-hook 'find-file-hook 'rv_common_f_find_file_hook)
(add-hook 'js-mode-hook 'rv_js_f_js_mode_hook)
(add-hook 'perl-mode-hook `rv_perl_f_perl_mode_hook)
(add-hook 'shell-mode-hook 'rv_shell_f_shell_mode_hook)
(add-hook 'sql-mode-hook 'rv_sql_f_sql_mode_hook)
(add-hook 'text-mode-hook 'rv_text_f_text_mode_hook)
;; (add-hook 'js2-mode-hook 'rv_js_f_js2_mode_hook)
