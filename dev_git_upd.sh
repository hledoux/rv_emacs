#!/bin/bash


# include common functions
. $(dirname $0)/ccc_lib.sh


if [[ -d "CVS" ]]
then
  f_console_error "The current directory seems to be managed by CVS - try [ cvsupd ]"
  exit 2
fi


# remove local garbage
dev_file_cleanup.sh


# fetch the latest changes, and merge them into your local sand-box
# pull = fetch + merge
f_console_separator "pull / merge changes from remote Git repository"
git pull --all --verbose
