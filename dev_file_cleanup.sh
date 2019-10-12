#!/bin/bash

# include common functions
. $(dirname $0)/ccc_lib.sh


f_console_separator "remove garbage files"
for ls_each_file_pat in 'tmon.out' 'core' '.*~' '*~' '*.old' '#*' '.#*' '*.bak*' '.*.bak*' '.tmp.*' '*.tmp' '*-tmp' '.new.*' '*.old-20*' '.*.old-20*' '.index'
do
  find . -name "$ls_each_file_pat" \( -type f -o -type l \) ! -path '*/ftp/*' -print -exec /bin/rm -f {} \;
done


f_console_separator "remove CVS Root files"
find . -name Root -print -exec /bin/rm {} \;


f_console_separator  "detect and remove invalid symlinks"
find . -type l ! -exec test -e {} \; -print -delete

