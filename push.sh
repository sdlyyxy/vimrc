#!/bin/bash
git add *
eval "git commit -m" '"'`date`'"'
git pull
git push

