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


ls_git_log_format='%h | %ci | %<(20,trunc)%D | %<(15,trunc)%cn | %s'
li_git_last_changes=10
li_git_last_tags=5


# recent history of commits
# - https://git-scm.com/docs/git-log
# - https://git-scm.com/docs/pretty-formats
f_console_separator "latest ${li_git_last_changes} changes"
git log -n ${li_git_last_changes} --format="${ls_git_log_format}" | cat


# list of most recent tags
# - https://git-scm.com/docs/git-for-each-ref
f_console_separator "latest ${li_git_last_tags} tags"
git for-each-ref refs/tags --sort=-taggerdate --format='%(objectname:short) | %(taggerdate:iso8601) | %(align:20)%(refname:short)%(end) | %(taggername)' --count=${li_git_last_tags}


# committed changes since last tag
f_console_separator "committed changes since last-tag=[$(git describe --tags --abbrev=0)]"
git log --format="${ls_git_log_format}" $(git describe --tags --abbrev=0)..HEAD | cat


# uncommitted elements, if any
if [[ $(git status --porcelain | wc -l) > 0 ]]
then
  f_console_separator "WARNING: uncommitted changes since [$(git describe --tags)]"
  git status --porcelain
fi


exit 0
