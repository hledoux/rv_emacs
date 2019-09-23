(load "cc-mode")


(defun rv_cc_f_is_cc_mode ()
  (string-match "^\\(cc\\|cpp\\|cxx\\|c++\\|hh\\|hpp\\|hxx\\|h++\\|c\\|h\\)$" (rv_language_f_buffer_ext)))



(defun rv_cc_f_insert_header_method ()
  (interactive)
  (if (rv_cc_f_is_cc_mode)
      (progn
        (let ((FuncName (read-string "FuncName = ")))
          (let ((Intro (concat "
// ********************************************************************
//  FUNCTION DESCRIPTION :
//  -
//  ARGUMENTS :
//  -
//  RETURN VALUE :
//  -
//  HISTORY :
//  - Creation          : "
                               (rv_language_f_current_time_string)
                               " - "
                               (rv_language_f_current_user_name)
                               "
//  - Last modification : "
                               (rv_language_f_current_time_string)
                               " - "
                               (rv_language_f_current_user_name)
                               "
// ********************************************************************
function " FuncName "() {
  // ##TODO##
  alert('##TODO## Function [" FuncName "] not yet implemented !');
}
")))

            (insert (concat Intro)))))))


(defun rv_cc_f_insert_separator ()
  (interactive)
  (if (rv_cc_f_is_cc_mode)
      (progn
        (insert "
// ********************************************************************
//  -
// ********************************************************************
"))))

