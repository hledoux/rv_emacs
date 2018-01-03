
(defvar font-lock-log-error-face 'font-lock-log-error-face "font-lock-log-error-face")
(defvar font-lock-log-in-out-face 'font-lock-log-in-out-face "font-lock-log-in-out-face")
(defvar font-lock-log-separ-face 'font-lock-log-separ-face "font-lock-log-separ-face")
(defvar font-lock-shell-mode-context-face 'font-lock-shell-mode-context-face "font-lock-shell-mode-context-face")


(defface font-lock-log-error-face '((t (:foreground "red"))) "shell-mode: error" :group 'font-lock-faces)
(defface font-lock-log-in-out-face '((t (:weight bold :foreground "green"))) "shell-mode: ==> / <==" :group 'font-lock-faces)
(defface font-lock-log-separ-face '((t (:foreground "Blue" :background "Gray90"))) "shell-mode: separator" :group 'font-lock-faces)
(defface font-lock-shell-mode-context-face '((t (:weight bold :foreground "green" :background "gray20"))) "shell-mode: new prompt" :group 'font-lock-faces)

