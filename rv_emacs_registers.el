(set-register ?C "cvs upd ; ~/cvs_branch/xccc-rel-x-y-z/tools/ccc_deploy.pl here ; make mk_root ; cvscheck")
(set-register ?c "cvs upd ; ~/xccc/tools/ccc_deploy.pl here ; make mk_root ; cvscheck")
(set-register ?d "(<(SpdDateFormatYYYYMMDDhhmmss)()>)")
(set-register ?e "(<(SpdStringsAreEqual)()()>)")
(set-register ?E "(<(SpdStringsAreNotEqual)()()>)")
(set-register ?f "(<(SpdBoolIsFalse)()>)")
(set-register ?F "<(SpdBoolValueFalse)>")
(set-register ?h "\n# ********************************************************************\n#  -\n# ********************************************************************\n")
(set-register ?i "_SPD_CCC_create_index_ext(ps_SqlTab => qq(table), ps_IdxSuf => q(suf), ps_ColLst => q(col1, col2))")
(set-register ?k "f_console_debug_pkg(__PACKAGE__, sub {\n  # ... debug code here ...\n});\n")
(set-register ?O "(<(SpdRowIsNotObsolete)()>)")
(set-register ?o "(<(SpdRowIsObsolete)()>)")
(set-register ?p "SPD_Arg(-ArgName => q(), -ArgType => q(), -ArgDefVal => q(), -FetchFromParam => 1, SPD_Comment('')),")
(set-register ?s "(<(SpdStringIsBlank)()>)")
(set-register ?S "(<(SpdStringIsNotBlank)()>)")
(set-register ?t "(<(SpdBoolIsTrue)()>)")
(set-register ?T "<(SpdBoolValueTrue)>")
(set-register ?u "\"use strict\";")
(set-register ?v "(<(SpdValueIsBlank)()>)")
(set-register ?V "(<(SpdValueIsNotBlank)()>)")
