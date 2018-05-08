@echo off

REM list all tasknames here
set task1=job1
set task2=job2
set task3=job3
set task4=job4

REM newline for pretty formatting
echo.
echo.
echo 	- Update Password -

REM input username
echo Please enter username
set /p un="Enter username: "

echo.

REM input password - use powershell to mask inputs
echo Please enter password
set "psCommand=powershell -Command "$pword = read-host 'Enter Password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set pw=%%p


echo.
echo.

REM make changes to the tasks
schtasks /change /ru %un% /rp %pw% /tn %task1
schtasks /change /ru %un% /rp %pw% /tn %task2%
schtasks /change /ru %un% /rp %pw% /tn %task3%
schtasks /change /ru %un% /rp %pw% /tn %task4%

REM clear all stored credentials from script
set un=0
set pw=0

REM print message when done
echo.
echo.
echo	- Password update is complete - 
echo.
echo.
echo.




