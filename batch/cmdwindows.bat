@echo off

REM This file launches the script in another window and keeps it open for the duration as set in timeout
REM Note the multiple command being passed


REM echo one
REM start cmd.exe /c "testsched.bat"

REM start <taskname> <command> <parameters>
start "ChangeDIR" cmd.exe /k "python2 "C:\Users\AZSG0066 - Amir Azmi\Desktop\powershell sched task\chdirjob.py" && TIMEOUT /T 6 /NOBREAK && exit"


REM echo onetwo
REM timeout /t 5 /nobreak
exit
