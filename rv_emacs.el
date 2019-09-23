
;; (setq rv_emacs_font_family_list (font-family-list))
;; (set-frame-font "Fixed-10")
;; (set-frame-font "Fixed-12")
;; (set-frame-font "Hack-10")
;; (set-frame-font "courier 12")
;; (set-frame-font "Courier 10 Pitch")
;; (set-frame-font "Lucida-10")
;; (set-frame-font "DejaVu Sans Mono")
;; (set-frame-font "DejaVu")
;; (set-frame-font "Roboto Mono")
;; (set-frame-font "-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1")
;;
;; a few handly Emacs functions:
;; (print (font-family-list))
;;   List available font families on the current frame
;;
;; M-x describe-char
;;   describe the complete pedigree of the character currenlty under the cursor
;;
;; M-x list-fontsets
;;   Display a list of all fontsets known to Emacs
;;
;; M-x describe-fontset FONTSET
;;   This shows which font is used for which character
;;
;; M-x list-charset-chars CHARSET
;;   Display a list of characters in character set CHARSET



;; On the machine hosting the X-server:
;;
;; 1- populate the folder .fonts/ with the expected fonts
;;   rsync -a -v xnms-ldev:.fonts/ .fonts/
;;
;; 2- refresh the X font cache
;;   cd ; fc-cache -f -v
;;
;; 3- list the available fonts
;;   fc-list
;;
;; 3- content of my file .Xresources
;;   Emacs.FontBackend: xft
;;   Emacs.Font: Fixed-12
;;
;; 4- compile / reload this .Xresources
;;   xrdb .Xresources
;;
;; 5- remote-start Emacs
;;   ssh -f xnms-ldev "export DISPLAY=$DISPLAY ; emacs &"


;; try to locate [/XMID_..._DIR/emacs-25.1/our_lib_distr/emacs/lisp]
;; (setq _rv_emacs_cs_xmid_emacs_lisp_dir (shell-command-to-string "echo -n $(ls -d -1 /XMID_*_DIR/emacs-25.1/our_lib_distr/emacs/lisp)"))
;; (if (or (eq _rv_emacs_cs_xmid_emacs_lisp_dir nil) (eq _rv_emacs_cs_xmid_emacs_lisp_dir ""))
;;     (error "unable to locate [/XMID_*_DIR/emacs-25.1/our_lib_distr/emacs/lisp]")
;;   (add-to-list 'load-path _rv_emacs_cs_xmid_emacs_lisp_dir))


;; add the directory of the current file to the load-path
(add-to-list 'load-path (concat (file-name-directory load-file-name) "extensions"))
(add-to-list 'load-path (concat (file-name-directory load-file-name) "."))


(setq inhibit-splash-screen t)


(load "js2-mode")
(load "blank-mode")
(load "ediff")

(load "rv_emacs_faces")


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
(load "rv_emacs_ddl")
(load "rv_emacs_sql")
(load "rv_emacs_text")
(load "rv_emacs_tmpl")



;;; functions common to every languages
(load "rv_emacs_common")
(load "rv_emacs_macros")
(load "rv_emacs_languages")


;;; mode hooks
(load "rv_emacs_hooks")


;;; customizations: fonts, colors, etc.
(load "rv_emacs_customs")


;;; keyborard short-cuts and registers
(load "rv_emacs_keyboard")
(load "rv_emacs_registers")


;;; choose a dark or light theme
;;; (rv_emacs_custom_faces_light)
(rv_emacs_custom_faces_dark)


(set-language-environment "UTF-8")


;; allow the use of command-lines like:
;;   emacsclient <file-to-edit>
(load "server")
(unless (server-running-p) (server-start))


(set-frame-font "-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1")
