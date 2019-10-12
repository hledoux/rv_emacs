#!/bin/env bash


echo "pull from GitHub"
git pull


echo "copy from xccc"
rsync -a -v ~/xccc/res/ccc/emacs/*.el ./
rsync -a -v --exclude CVS ~/xccc/res/ccc/emacs/extensions/ ./extensions/


echo "push to GitHub"
git add *.el
git commit -a -m- && git push
