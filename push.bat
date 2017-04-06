@echo off
set nowtime=%date:~0,4%-%date:~5,2%-%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2%
git add *
git commit -m "%nowtime%
git pull
git push