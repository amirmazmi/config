@echo off

REM Script to fix issue where one monitor is blank

displayswitch /clone
echo .  
echo .
echo .
echo .
echo 				##### Fixing display #####
echo .
echo .


timeout 5 > nul

displayswitch /extend
timeout 3 > nul

echo .  
echo .
echo .
echo .
echo 				##### Display fixed! #####
echo .
echo .


timeout 5 > nul

exit
