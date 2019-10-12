#!/bin/bash


# include common functions
. $(dirname $0)/ccc_lib.sh

if [[ -d "CVS" ]]
then
  f_console_error "The current directory seems to be managed by CVS - try [ cvscheck ]"
  exit 2
fi


# remove local garbage
dev_file_cleanup.sh


# https://stackoverflow.com/questions/3258243/check-if-pull-needed-in-git
f_console_separator "bringing your remote refs up to date"
git fetch --all --verbose


# will show you the commits in all of the branches whose names end in 'master'
# (eg master and origin/master)
f_console_separator "recent commits in all branches"
git show-branch --all --topo-order --remotes


# will tell you whether the branch you are tracking is ahead, behind or has
# diverged. If it says nothing, the local and remote are the same
# git status --verbose

# https://unix.stackexchange.com/questions/155046/determine-if-git-working-directory-is-clean-from-a-script
if [[ -z $(git status --porcelain) ]]
then
  f_console_separator "OK - apparently no change to commit"

else
  # will tell you whether the branch you are tracking is ahead, behind or has
  # diverged. If it says nothing, the local and remote are the same
  # git status --verbose
  f_console_separator "WARNING - commit your changes with a command like: [ gitsync <describe your changes...> ]"
  git status --porcelain
fi


exit 0
