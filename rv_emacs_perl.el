(load "perl-mode")


(defun rv_perl_f_insert_header_method ()
  (interactive)
  (let ((ProcName (read-string "ProcName = ")))
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
                         (current-time-string)
                         " - "
                         (user-full-name)
                         "
#  - Last modification : "
                         (current-time-string)
                         " - "
                         (user-full-name)
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

      (if (string-equal ProcName "m_New")
          (setq Body (concat "sub " ProcName "
{
  my $ps_class = shift();
  my $lo_This = $ps_class->SUPER::m_New(@_);
  if ($lo_This) {
    ##TODO##
    f_console_fatal(\"##TODO## Constructor [" ProcName "] not yet implemented !\");
  }

  return($lo_This);
}

"))

        (setq Body (concat "sub " ProcName "
{
  my $lb_result;

  my $po_This = shift();
  my %ph_args = @_;

  my $ps_arg_string = $ph_args{ps_arg_string};
  my $pi_arg_numeric = $ph_args{pi_arg_numeric};
  my $pb_arg_bool = $ph_args{pb_arg_bool};
  my $pf_arg_closure = $ph_args{pf_arg_closure};

  ##TODO##
  f_console_fatal(\"##TODO## Method [" ProcName "] not yet implemented !\");

  return($lb_result);
}

")))

      (insert (concat Intro Body)))))




(defun rv_perl_f_insert_trace ()
  (interactive)
  (insert "f_console_debug_pkg(__PACKAGE__, sub {
  # ##TODO## your debug code here
  f_console_inspect(...);
});
"))


(defun rv_perl_f_insert_separator ()
  (interactive)
  (insert "
# ********************************************************************
#  -
# ********************************************************************
"))





(defun rv_perl_f_insert_header_class ()
  (interactive)
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

"))




(defun rv_perl_f_configure_fontify()
  (interactive)
  (save-excursion

    ;; method / function calls
    (setq perl-font-lock-keywords-2
          (cons '("->\\([A-Za-z0-9_:]+\\)[	 \n\r]*(" (1 font-lock-function-name-face)) perl-font-lock-keywords-2))

    ;; Use of packages
    (setq perl-font-lock-keywords-2
          (cons '("^[\t ]*\\(use\\|no\\)[\t\n ]+\\([a-zA-Z0-9_:]+\\([\t\n ]*()\\)?\\)" (2 font-lock-type-face)) perl-font-lock-keywords-2))

    (setq perl-font-lock-keywords-2
          (cons '("\\<\\([a-zA-Z0-9_:]+\\)->" (1 font-lock-type-face)) perl-font-lock-keywords-2))

    (setq perl-font-lock-keywords-2
          (cons '("\\<\\([a-zA-Z0-9_:]+\\)::\\([a-zA-Z0-9_]+\\)[\t\n ]*(" (1 font-lock-type-face) (2 font-lock-function-name-face)) perl-font-lock-keywords-2))


    ;; Fields
    (setq perl-font-lock-keywords-2
          (cons '("{\\([A-Za-z0-9_]+\\)}"  (1 font-lock-builtin-face)) perl-font-lock-keywords-2))

    (setq perl-font-lock-keywords-2
          (cons '("\\([-A-Za-z0-9_:]+\\)[ \t]*=>"  (1 font-lock-builtin-face)) perl-font-lock-keywords-2))

    ;; Contants
    (setq perl-font-lock-keywords-2
          (cons '("[\\$]?\\<[cC][a-z]?_[A-Za-z0-9_]+\\([\t\n ]*()\\)?" . font-lock-constant-face) perl-font-lock-keywords-2))

    (setq perl-font-lock-keywords-2
          (cons '("[-+]?\\<[\\.0-9_]+\\>" . font-lock-constant-face) perl-font-lock-keywords-2))

    ;; DDL / SPD / WEB extensions
    (setq perl-font-lock-keywords-2
          (cons '("\\<\\(WEB\\|DDL\\|SPD\\)_[A-Za-z0-9_]+" . font-lock-warning-face) perl-font-lock-keywords-2))

    (setq perl-font-lock-keywords-2
          (cons '("\\<_\\(WEB\\|DDL\\|SPD\\)_[A-Za-z0-9_]+" . font-lock-constant-face) perl-font-lock-keywords-2))

    (setq perl-font-lock-keywords-2
          (cons '("\\<GEN_[A-Za-z0-9_]+" . font-lock-keyword-face) perl-font-lock-keywords-2))

    ;; Perl extended keywords
    (setq perl-font-lock-keywords-2
          (cons '("\\<\\(given\\|when\\|not\\|like\\|pos\\|substr\\|qw\\|q\\|qq\\|qx\\|qr\\|and\\|or\\|xor\\|reverse\\|quotemeta\\|values\\|keys\\|sort\\|bless\\|caller\\|eq\\|ne\\|lt\\|le\\|gt\\|ge\\|cmp\\|ref\\|push\\|pop\\|map\\|grep\\|join\\|split\\|length\\|scalar\\|my\\|local\\|each\\|shift\\|unshift\\|our\\|delete\\|undef\\|defined\\|exists\\|chomp\\|chop\\|print\\|printf\\|sprintf\\|printflush\\|open\\|close\\|flush\\|STDERR\\|STDOUT\\|warn\\|die\\|f_\\w+\\)\\>" . font-lock-keyword-face) perl-font-lock-keywords-2))

    ;; SQL comments
    (setq perl-font-lock-keywords-2
          (cons '("[\t ]+\\(--[\t ]+[^\n]*\\)$" (1 font-lock-comment-face)) perl-font-lock-keywords-2))

    ;; References
    (setq perl-font-lock-keywords-2
          (cons '("\\(\\[\\[:.+?:\\]\\]\\)"  (1 font-lock-type-face)) perl-font-lock-keywords-2))

    ;; (setq perl-font-lock-keywords-2 nil)
    ))


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
