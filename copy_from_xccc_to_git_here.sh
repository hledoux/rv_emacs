#!/bin/env bash


echo "pull from GitHub"
git pull


echo "copy from xccc"
rsync -a -v ~/xccc/res/ccc/emacs/*.el ./


echo "push to GitHub"
git commit -a -m- && git push
