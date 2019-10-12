(load "perl-mode")

(defun rv_perl_f_is_perl_mode ()
  (string-match "^\\(pl\\|pm\\)" (rv_language_f_buffer_ext)))


(defun rv_perl_f_normalize_space_between_blocks ()
  (interactive)
  (save-excursion
    (if (rv_perl_f_is_perl_mode)
        (progn

          ;; m_RegisterParam | m_RegisterReport | m_RegisterEnumClass | m_RegisterRuleFamily | m_RegisterProfile | m_RegisterDbParam
          (goto-char 1)
          (while (re-search-forward " *&&\n+\\( *( *$[a-zA-Z0-9_]+->\\(m_Register[a-zA-Z]+\\)\\)" (point-max) t)
            (replace-match " &&\n\n\n\\1"))


          ;; after function / method end
          (goto-char 1)
          (while (re-search-forward "\\(\n}[;]?\\)\n+\\(#\\)" (point-max) t)
            (replace-match "\\1\n\n\n\n\\2"))


          ;; sub gnagnagna { ... }
          (goto-char 1)
          (while (re-search-forward "\nsub[ \t]+\\([_a-zA-Z][_a-zA-Z0-9]*\\)[ \n\t]+{" (point-max) t)
            (replace-match "\nsub \\1 {"))


          ;; if / unless / else / elsif / foreach / while
          (goto-char 1)
          (while (re-search-forward "\\(\n[ \t]+\\)\\(if\\|unless\\|elsif\\|foreach\\|while\\)[ \t]*([ \t]*\\([^\n]+?\\)[ \t]*)[ \n\t]*{\n" (point-max) t)
            (replace-match "\\1\\2 (\\3) {\n"))


          ;; else { ... }
          (goto-char 1)
          (while (re-search-forward "\\(\n[ \t]+\\)\\(else\\)[ \n\t]*{\n" (point-max) t)
            (replace-match "\\1\\2 {\n"))


          ;; spaces between parenthesis
          (goto-char 1)
          (while (re-search-forward "([\t ]+(" (point-max) t)
            (replace-match "(("))


          ;; spaces between parenthesis
          (goto-char 1)
          (while (re-search-forward ")[\t ]+)" (point-max) t)
            (replace-match "))"))))))



(defun rv_perl_f_insert_header_method ()
  (interactive)
  (if (rv_perl_f_is_perl_mode)
      (progn
        (let ((FuncName (read-string "FuncName = ")))
          (let ((Package "")
                (End 0)
                (Begin 0)
                (Body "")
                (Intro (concat "
# ********************************************************************
#  FUNCTION DESCRIPTION :
#  -
#  ARGUMENTS :
#  -
#  RETURN VALUE :
#  -
#  HISTORY :
#  - Creation          : "
                               (rv_language_f_current_time_string)
                               " - "
                               (rv_language_f_current_user_name)
                               "
#  - Last modification : "
                               (rv_language_f_current_time_string)
                               " - "
                               (rv_language_f_current_user_name)
                               "
# ********************************************************************
")))
            (save-excursion
              (if (re-search-backward "^[\t ]*package[\t ]*" (point-min) t)
                  (progn
                    (re-search-forward "package[\t ]*" (point-max) t)
                    (setq Begin (point))
                    (re-search-forward "[A-Za-z0-9_:]+" (point-max) t)
                    (setq End (point))
                    (setq Package (buffer-substring Begin End)))))

            (if (string-equal FuncName "m_New")
                (setq Body (concat "sub " FuncName " {
  my $ps_class = shift();
  my $lo_This = $ps_class->SUPER::m_New(@_);
  if ($lo_This) {
    ##TODO##
    f_console_fatal(\"##TODO## Constructor [" FuncName "] not yet implemented !\");
  }

  return($lo_This);
}

"))

              (setq Body (concat "sub " FuncName " {
  my $lb_result;

  my $po_This = shift();
  my %ph_args = @_;

  my $ps_arg_string = $ph_args{ps_arg_string};
  my $pi_arg_numeric = $ph_args{pi_arg_numeric};
  my $pb_arg_bool = $ph_args{pb_arg_bool};
  my $pf_arg_closure = $ph_args{pf_arg_closure};

  ##TODO##
  f_console_fatal(\"##TODO## Method [" FuncName "] not yet implemented !\");

  return($lb_result);
}

")))

            (insert (concat Intro Body)))))))




(defun rv_perl_f_insert_trace ()
  (interactive)
  (if (rv_perl_f_is_perl_mode)
      (progn
        (insert "f_console_debug_pkg(__PACKAGE__, sub {
  # ##TODO## your debug code here
  f_console_inspect(...);
});
"))))


(defun rv_perl_f_insert_separator ()
  (interactive)
  (if (rv_perl_f_is_perl_mode)
      (progn
        (insert "
# ********************************************************************
#  -
# ********************************************************************
"))))





(defun rv_perl_f_insert_header_class ()
  (interactive)
  (if (rv_perl_f_is_perl_mode)
      (progn
        (insert "
# ********************************************************************
#  - Class T_MyClass : ##TODO##
# ********************************************************************
package T_MyClass;


# Strict naming conventions
use strict;


# Inheritance
use base q(T_SuperClass);


# Std libs


# Extension libs
use PM_CCC::T_Console;
use PM_CCC::T_Utils;


# ********************************************************************
#  - INTERFACE CONSTANTS
# ********************************************************************


# ********************************************************************
#  - INTERFACE METHODS
# ********************************************************************



# ********************************************************************
#  - PRIVATE CONSTANTS
# ********************************************************************



# ********************************************************************
#  - PRIVATE METHODS
# ********************************************************************



# ********************************************************************
#  - End of package
# ********************************************************************

1;

"))))




(defun rv_perl_f_reformat_code ()
  (interactive)

  (save-excursion
    (message (concat "reformatting Perl code in buffer " (buffer-name) "..."))

    ;; sub { ...
    (goto-char (point-min))
    (while (re-search-forward "\\<sub[ \t+]\\([a-zA-Z_][a-zA-Z_0-9_]+\\)[ \t\n]*{" (point-max) t)
      (replace-match "sub \\1 {"))

    ;; <function> (...
    (goto-char (point-min))
    (while (re-search-forward "\\<\\(_?\\(f\\|e\\|lf\\)_[a-zA-Z_][a-zA-Z_0-9_]+\\)[ \t]+(" (point-max) t)
      (replace-match "\\1("))

    ;; if ( ... (
    ;; elsif ( ... (
    (goto-char (point-min))
    (while (re-search-forward "\\<\\(if\\|elsif\\)[ \t\n]*([ \t\n]+(" (point-max) t)
      (replace-match "\\1 (("))

    ;; ) ... {
    (goto-char (point-min))
    (while (re-search-forward ")[ \t\n]+{" (point-max) t)
      (replace-match ") {"))

    ;; ( ...
    (goto-char (point-min))
    (while (re-search-forward "([ \t]+" (point-max) t)
      (replace-match "("))

    ;; ... )
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+)" (point-max) t)
      (replace-match ")"))

    ;; ; ... }
    ;; (goto-char (point-min))
    ;; (while (re-search-forward ";[ \t\n]*}" (point-max) t)
    ;;   (replace-match ";\n}"))

    ;; } ... )
    (goto-char (point-min))
    (while (re-search-forward "}[ \t\n]+)" (point-max) t)
      (replace-match "})"))

    ;; ...;
    (goto-char (point-min))
    (while (re-search-forward "[ \t\n]+;" (point-max) t)
      (replace-match ";"))

    ;; ;;;;;
    (goto-char (point-min))
    (while (re-search-forward ";\\([\t ]*;\\)+[\t ]*$" (point-max) t)
      (replace-match ";"))

    ;; , ... }
    ;; (goto-char (point-min))
    ;; (while (re-search-forward ",[ \t\n]+}" (point-max) t)
    ;;   (replace-match "}"))

    ;; {...
    ;; (goto-char (point-min))
    ;; (while (re-search-forward "{[ \t]*\n[ \t\n]+" (point-max) t)
    ;; (replace-match "{\n"))

    ;; else ... { ...
    (goto-char (point-min))
    (while (re-search-forward "\\<else[ \t\n]+{" (point-max) t)
      (replace-match "else {"))

    (rv_language_f_indent_region (point-min) (point-max))

    (message (concat "reformatted Perl code in buffer " (buffer-name) " !"))))


(defun rv_perl_f_configure_fontify()
  (interactive)
  (save-excursion

    ;; method / function calls
    (add-to-list 'perl-font-lock-keywords-2
                 '("->\\([A-Za-z0-9_:]+\\)[	 \n\r]*(" (1 font-lock-function-name-face)))

    ;; function names
    (add-to-list 'perl-font-lock-keywords-2
                 '("\\<_?[fm]_\\w+\\>" . font-lock-function-name-face))

    ;; Use of packages
    (add-to-list 'perl-font-lock-keywords-2
                 '("^[\t ]*\\(use\\|no\\)[\t\n ]+\\([a-zA-Z0-9_:]+\\([\t\n ]*()\\)?\\)" (2 font-lock-type-face)))

    (add-to-list 'perl-font-lock-keywords-2
                 '("\\<\\([a-zA-Z0-9_:]+\\)->" (1 font-lock-type-face)))

    (add-to-list 'perl-font-lock-keywords-2
                 '("\\<\\([a-zA-Z0-9_:]+\\)::\\([a-zA-Z0-9_]+\\)[\t\n ]*(" (1 font-lock-type-face) (2 font-lock-function-name-face)))


    ;; Perl extended keywords
    (add-to-list 'perl-font-lock-keywords-2
                 '("\\<\\(between\\|isnull\\|coalesce\\|convert\\|min\\|max\\|avg\\|sum\\|count\\|is +null\\|is +not +null\\|null\\|given\\|case\\|when\\|then\\|end\\|not\\|in\\|like\\|pos\\|substr\\|qw\\|q\\|qq\\|qx\\|qr\\|and\\|or\\|xor\\|reverse\\|quotemeta\\|values\\|keys\\|sort\\|bless\\|caller\\|eq\\|ne\\|lt\\|le\\|gt\\|ge\\|cmp\\|ref\\|push\\|pop\\|map\\|grep\\|select\\|from\\|where\\|\\(\\(right\\|left\\|outer\\|inner\\) +\\)*join\\|on\\|order +by\\|group +by\\|having\\|split\\|length\\|scalar\\|my\\|local\\|each\\|shift\\|unshift\\|our\\|delete\\|undef\\|defined\\|exists\\|chomp\\|chop\\|print\\|printf\\|sprintf\\|printflush\\|open\\|close\\|flush\\|STDERR\\|STDOUT\\|warn\\|die\\)\\>" . font-lock-keyword-face))


    ;; Fields
    (add-to-list 'perl-font-lock-keywords-2
                 '("{\\([A-Za-z0-9_]+\\)}" (1 font-lock-builtin-face)))

    (add-to-list 'perl-font-lock-keywords-2
                 '("\\([-A-Za-z0-9_:]+\\)[ \t]*=>" (1 font-lock-builtin-face)))

    ;; Label:
    (add-to-list 'perl-font-lock-keywords-2
                 '("^[ \t]*\\<\\([A-Za-z]\\w*[ \t]*:\\)" (1 font-lock-perl-label-face)))

    (add-to-list 'perl-font-lock-keywords-2
                 '("\\<\\(last\\|next\\|redo\\)[ \t]*\\<\\([A-Za-z]\\w*\\)\\>" (1 font-lock-keyword-face) (2 font-lock-perl-label-face)))

    ;; Contants
    (add-to-list 'perl-font-lock-keywords-2
                 '("[\\$]?\\<[cC][a-z]?_[A-Za-z0-9_]+\\([\t\n ]*()\\)?" . font-lock-constant-face))

    (add-to-list 'perl-font-lock-keywords-2
                 '("[-+]?\\<[\\.0-9_]+\\>" . font-lock-constant-face))


    ;; DDL / SPD extensions
    (add-to-list 'perl-font-lock-keywords-2
                 '("\\<_?\\(DDL\\|SPD\\)_[A-Za-z0-9_]+" . font-lock-perl-spd-name-face))

    (add-to-list 'perl-font-lock-keywords-2
                 '("\\<GEN_[A-Za-z0-9_]+" . font-lock-keyword-face))

    ;; (index ...)
    (add-to-list 'perl-font-lock-keywords-2
                 '("( *\\(index\\) +\\([^ ]+?\\) *)" (1 font-lock-keyword-face) (2 font-lock-constant-face)))

    ;; SQL comments
    (add-to-list 'perl-font-lock-keywords-2
                 '("[\t ]+\\(--[\t ]+[^\n]*\\)$" (1 font-lock-comment-face)))

    ;; References
    (add-to-list 'perl-font-lock-keywords-2
                 '("\\(\\[\\[:.+?:\\]\\]\\)" (1 font-lock-type-face)))

    ;; TODO etc.
    (add-to-list 'perl-font-lock-keywords-2
                 '("##+[A-Z][-A-Za-z0-9_]+##+.*" . font-lock-todo-face))))


(rv_perl_f_configure_fontify)




(defun rv_perl_f_perl_mode_hook ()
  (linum-mode t)

  (setq parse-sexp-ignore-comments nil)
  (setq perl-brace-imaginary-offset 0)
  (setq perl-brace-offset 0)
  (setq perl-continued-brace-offset -2)
  (setq perl-continued-statement-offset 2)
  (setq perl-indent-level 2)
  (setq perl-label-offset 0)
  (setq perl-nochange ";?#\\|=\\|\\|\\(\\w\\|\\s_\\)+:")

  (setq perl-quote-like-pairs '())


  (local-set-key [f1] 'perl-indent-exp)
  (define-key perl-mode-map [return] 'newline-and-indent)
  (define-key perl-mode-map [(control m)] 'newline-and-indent)
  (define-key perl-mode-map [delete] 'delete-char)

  ;; Extend "word" definition...
  (modify-syntax-entry ?- "w")
  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?$ "w")
  (modify-syntax-entry ?% "w")
  (modify-syntax-entry ?@ "w")

  (imenu-add-to-menubar "*Perl*")
  (font-lock-mode t))


