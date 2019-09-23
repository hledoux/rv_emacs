
(defun rv_spd_f_is_spd_mode ()
  (string-match "^\\(spd\\|tpl\\)" (rv_language_f_buffer_ext)))


(defun rv_spd_f_normalize_space_between_blocks ()
  (interactive)
  (save-excursion
    (if (rv_spd_f_is_spd_mode)
        (progn
          (goto-char 1)
          (while (re-search-forward " *\\([,;]\\)\n+\\( *\\<\\(DDL_Table\\>\\|SPD_Procedure\\|SPD_QueryDeclare\\|SPD_QueryEval\\|SPD_QueryDescribe\\|SPD_Assert\\)\\)" (point-max) t)
            (replace-match "\\1\n\n\n\n\n\\2"))))))




(defun rv_spd_f_insert_header_method ()
  (interactive)
  (if (rv_spd_f_is_spd_mode)
      (progn
        (let ((ProcName (read-string "ProcName = ")))
          (insert "
GEN_Include('XXX_defs.tpl'); ##TODO##



# ********************************************************************
#  FUNCTION DESCRIPTION :
#  -
#  ARGUMENTS :
#  -
#  RETURN VALUE :
#  -
#  HISTORY :
#  - Creation          : " (rv_language_f_current_time_string) " - " (rv_language_f_current_user_name) "
#  - Last modification : " (rv_language_f_current_time_string) " - " (rv_language_f_current_user_name) "
# ********************************************************************
SPD_Procedure
  (-ProcName => '" ProcName "',
   ##TODO## -Database => 'DB-NAME',

   SPD_Comment('<<PUT HERE THE DESCRIPTION>>'),

   SPD_Arg(q(@ps_arg_str) => q(varchar(100)) => q('toto') => q(upper(@ps_arg_str)) => SPD_Comment('...')),
   SPD_Arg(q(@pi_arg_int) => q(integer) => q(27) => q() => SPD_Comment('...')),
   SPD_Arg(q(@pb_arg_bool) => q(char(1)) => q(null) => q() => SPD_Comment('...')),


   SPD_BodyStd
   (

    # ##TODO## Remind a few SPD macros
    #
    # Canonical way to...
    #
    # - check a string is blank / empty ==> Boolean expression
    #   (<(SpdStringIsBlank)(alias.my_str)>)		Ctrl-x g s
    #   (<(SpdStringIsNotBlank)(alias.my_str)>)		Ctrl-x g S
    #
    # - test a boolean value Y/N/null or T/F/null ==> Boolean expression
    #   (<(SpdBoolIsFalse)(alias.my_bool)>)		Ctrl-x g f
    #   (<(SpdBoolIsTrue)(alias.my_bool)>)		Ctrl-x g t
    #
    # - insert /assign a boolean literal
    #   <(SpdBoolValueFalse)>				Ctrl-x g F
    #   <(SpdBoolValueTrue)>				Ctrl-x g T
    #
    # - Check a row if [_obsolete] or not ==> Boolean expression
    #   (<(SpdRowIsObsolete)(alias)>)			Ctrl-x g o
    #   (<(SpdRowIsNotObsolete)(alias)>)		Ctrl-x g O
    #
    # - Create an index					Ctrl-x g i
    #   _SPD_CCC_create_index(qq(Table) => q(EXT) => q(col1, col2))
    #   _SPD_CCC_create_index(qq(Table) => q(EXT) => q(col1, col2) => 1) # unique...


    # Declare constants
    SPD_Var(q(@cs_cst_str) => q(varchar(100)) => q('toto') => SPD_Comment(...)),
    SPD_Var(q(@ci_cst_int) => q(integer) => q(27) => SPD_Comment(...)),
    SPD_Var(q(@cb_cst_bool) => q(char(1)) => q(<(SpdBoolValueTrue)>) => SPD_Comment(...)),


    # Declare variables
    SPD_Var(q(@ls_var_str) => q(varchar(100)) => q('toto') => SPD_Comment(...)),
    SPD_Var(q(@li_var_int) => q(integer) => q(27) => SPD_Comment(...)),
    SPD_Var(q(@lb_var_bool) => q(char(1)) => q<(SpdBoolValueTrue)> => SPD_Comment(...)),



    # Declaration of queries
    (
     SPD_QueryDescribeSelect
     (SPD_Comment('...'),
      -QueryClass => 'initial-collection',
      -TargetTable => q(),
      -From => q(),

      -Where => q(
                  (<(SpdStringIsBlank)(<<PLIF>>)>) and
                  (<(SpdBoolIsTrue)(<<PLAF>>)>) and
                  (<<PLOUF>> = 3)),

      -GroupBy => q(),
      -Having => q(),
      -OrderBy => q(),

      SPD_SetColumn(col_1 => q(alias.col_1)),
      SPD_SetColumn(col_2 => q(alias.col_1)),
      SPD_SetColumn( => q()),
      SPD_SetColumn( => q())),





     SPD_QueryDescribeInsert
     (SPD_Comment('...'),
      -QueryClass => '',
      -TargetTable => q(),
      -From => q(),
      -Where => q(),
      -GroupBy => q(),
      -Having => q(),
      -OrderBy => q(),

      SPD_SetColumn(col_1 => q(alias.col_1)),
      SPD_SetColumn(col_2 => q(alias.col_1)),
      SPD_SetColumn( => q()),
      SPD_SetColumn( => q())),





     SPD_QueryDescribeDiffUpd
     (SPD_Comment('...'),
      -QueryClass => '',
      -TargetTable => q(),
      -From => q(),
      -Where => q(),

      SPD_SetColumn(col_1 => q(alias.col_1)),
      SPD_SetColumn(col_2 => q(alias.col_1)),
      SPD_SetColumn( => q()),
      SPD_SetColumn( => q())),





     SPD_QueryDescribeDelete
     (SPD_Comment('...'),
      -QueryClass => '',
      -TargetTable => q(),
      -From => q(),
      -Where => q()),

     ),




    # Execution of queries
    (
     SPD_QueryUse('initial-collection', q(...SQL condition...),
                  SPD_Replace(q(<<PLIF>>) => q(alias.my_plif)),
                  SPD_Replace(q(<<PLAF>>) => q(alias.my_plaf)),
                  SPD_Replace(q(<<PLOUF>>) => q(alias.my_plouf))),


     _SPD_CCC_create_index(qq(Table) => q(EXT) => q(col1, col2)),
     ),
    ),


   SPD_UnitTest(-Script => q{execute " ProcName "}),
   );")))))



(defun rv_spd_f_convert_to_setcolumn ()
  (interactive)

  (save-excursion
    (goto-char 1)

    (while (search-forward-regexp "^\\( +\\)\\([a-zA-Z_][a-zA-Z0-9_]*\\) *= *( *\\(\\(.\\|\n\\)*?\\) *) *, *$" nil t)
      (replace-match "\\1SPD_SetColumn(\\2 => q(\\3))," t nil)))

  (save-excursion
    (goto-char 1)
    (while (search-forward-regexp "^\\( +\\)\\([a-zA-Z_][a-zA-Z0-9_]*\\) *= *\\(.*?\\) *,? *$" nil t)
      (replace-match "\\1SPD_SetColumn(\\2 => q(\\3))," t nil)))

  (save-excursion
    (goto-char 1)
    (while (search-forward-regexp "^\\( +\\)\\([a-zA-Z_][a-zA-Z0-9_]*\\)\\.\\([a-zA-Z_][a-zA-Z0-9_]*\\) *,? *$" nil t)
      (replace-match "\\1SPD_SetColumn(\\3 => q(\\2.\\3))," t nil))))
