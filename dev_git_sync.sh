#!/bin/bash

# a shortcut for the sequence:
#  - git pull
#  - git commit -a -m '<blablabla>'
#  - git push
#
# arguments:
#  - comment...
#
# if no comment was passed ==> then behave like a " check" , warn and commit
# nothing


# include common functions
. $(dirname $0)/ccc_lib.sh


if [[ -d "CVS" ]]
then
  f_console_error "The current directory seems to be managed by CVS - try [ cvssync ]"
  exit 2
fi


# the arguments passed on the command line are considered as the comment to
# associate to the commit
ps_comment="$*"


if [[ "$ps_comment" == "" ]]
then
  # no comment provided ==> behave like a "gitcheck"
  dev_git_check.sh
  f_console_alert "please provide a description of your changes: [ $(basename $0) <describe your changes...> ]"


else
  # comment provided ==> consider it is time to commit / push
  dev_git_upd.sh
  dev_file_cleanup.sh

  f_console_separator "commit / push local changes to remote Git repository with description=[$ps_comment]"
  (git commit --all --message "$ps_comment") && (git push --verbose)

  dev_file_cleanup.sh
fi
