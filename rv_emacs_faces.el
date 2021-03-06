;;; those faces are just declared here - and defined in [rv_emacs_custom]

(defface font-lock-callback-name-face '((t nil)) "JS: callback" :group 'font-lock-faces)
(defface font-lock-log-error-face '((t nil)) "shell-mode: error" :group 'font-lock-faces)
(defface font-lock-log-in-out-face '((t nil)) "shell-mode: ==> / <==" :group 'font-lock-faces)
(defface font-lock-log-separ-face '((t nil)) "shell-mode: separator" :group 'font-lock-faces)
(defface font-lock-log-success-face '((t nil)) "shell-mode: success" :group 'font-lock-faces)
(defface font-lock-log-warning-face '((t nil)) "shell-mode: warning" :group 'font-lock-faces)
(defface font-lock-perl-label-face '((t nil)) "Perl: label" :group 'font-lock-faces)
(defface font-lock-perl-spd-name-face '((t nil)) "SPD/DDL: macro name" :group 'font-lock-faces)
(defface font-lock-shell-mode-context-face '((t nil)) "shell-mode: new prompt" :group 'font-lock-faces)
(defface font-lock-todo-face '((t nil)) "TODO marker" :group 'font-lock-faces)
(defface font-lock-wiki-bold-face '((t nil)) "wiki: bold" :group 'font-lock-faces)
(defface font-lock-wiki-head-1-face '((t nil)) "wiki: header-1" :group 'font-lock-faces)
(defface font-lock-wiki-head-2-face '((t nil)) "wiki: header-2" :group 'font-lock-faces)
(defface font-lock-wiki-italic-face '((t nil)) "wiki: italic" :group 'font-lock-faces)
(defface font-lock-wiki-macro-face '((t nil)) "wiki: macro" :group 'font-lock-faces)

(defvar font-lock-callback-name-face 'font-lock-callback-name-face "font-lock-callback-name-face")
(defvar font-lock-log-error-face 'font-lock-log-error-face "font-lock-log-error-face")
(defvar font-lock-log-in-out-face 'font-lock-log-in-out-face "font-lock-log-in-out-face")
(defvar font-lock-log-separ-face 'font-lock-log-separ-face "font-lock-log-separ-face")
(defvar font-lock-log-success-face 'font-lock-log-success-face "font-lock-log-success-face")
(defvar font-lock-log-warning-face 'font-lock-log-warning-face "font-lock-log-warning-face")
(defvar font-lock-perl-label-face 'font-lock-perl-label-face "font-lock-perl-label-face")
(defvar font-lock-perl-spd-name-face 'font-lock-perl-spd-name-face "font-lock-perl-spd-name-face")
(defvar font-lock-shell-mode-context-face 'font-lock-shell-mode-context-face "font-lock-shell-mode-context-face")
(defvar font-lock-todo-face 'font-lock-todo-face "font-lock-todo-face")
(defvar font-lock-wiki-bold-face 'font-lock-wiki-bold-face "font-lock-wiki-bold-face")
(defvar font-lock-wiki-head-1-face 'font-lock-wiki-head-1-face "font-lock-wiki-head-1-face")
(defvar font-lock-wiki-head-2-face 'font-lock-wiki-head-2-face "font-lock-wiki-head-2-face")
(defvar font-lock-wiki-italic-face 'font-lock-wiki-italic-face "font-lock-wiki-italic-face")
(defvar font-lock-wiki-macro-face 'font-lock-wiki-macro-face "font-lock-wiki-macro-face")


(setq font-lock-keywords-case-fold-search nil)
