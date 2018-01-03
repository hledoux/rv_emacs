
(setq _rv_emacs_cs_HOME (getenv "HOME"))

(add-to-list 'load-path (concat "/XMID_LDEV_DIR/emacs-23.3/our_lib_distr/emacs/lisp"))
(add-to-list 'load-path (concat _rv_emacs_cs_HOME "/tools/rv_emacs/extensions"))
(add-to-list 'load-path (concat _rv_emacs_cs_HOME "/tools/rv_emacs"))


;; (load "js2-mode")
(load "blank-mode")
(load "ediff")


;;; language-specific functions
(load "rv_emacs_apache")
(load "rv_emacs_cc")
(load "rv_emacs_css")
(load "rv_emacs_js")
(load "rv_emacs_perl")
(load "rv_emacs_php")
(load "rv_emacs_shell")
(load "rv_emacs_shell_script")
(load "rv_emacs_spd")
(load "rv_emacs_sql")
(load "rv_emacs_text")
(load "rv_emacs_tmpl")



;;; functions common to every languages
(load "rv_emacs_common")
(load "rv_emacs_languages")


;;; mode hooks
(load "rv_emacs_hooks")

;;; customizations: fonts, colors, etc.
(load "rv_emacs_customs")

;;; keyborard short-cuts and registers
(load "rv_emacs_keyboard")
(load "rv_emacs_registers")
