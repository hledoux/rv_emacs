(load "cc-mode")


(defun rv_cc_f_insert_header_method ()
  (interactive)
  (let ((ProcName (read-string "ProcName = ")))
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
                         (current-time-string)
                         " - "
                         (user-full-name)
                         "
//  - Last modification : "
                         (current-time-string)
                         " - "
                         (user-full-name)
                         "
// ********************************************************************
function " ProcName "()
{
  // ##TODO##
  alert('##TODO## Function [" ProcName "] not yet implemented !');
}
")))

      (insert (concat Intro)))))


(defun rv_cc_f_insert_separator ()
  (interactive)
  (insert "
// ********************************************************************
//  -
// ********************************************************************
"))

