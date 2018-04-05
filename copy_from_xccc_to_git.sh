#!/bin/env bash

git pull

rsync -a -v ~/xccc/res/ccc/emacs/*.el ./

git commit -a -m- && git push
