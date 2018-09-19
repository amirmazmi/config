# -*- coding: utf-8 -*-
"""
Created on Wed Sep 19 11:28:23 2018

From: http://www.madebuild.org/blog/?p=30
"""


import os
import platform
import ctypes
from time import sleep

# GetExitCodeProcess uses a special exit code to indicate that the process is
# still running.
_STILL_ACTIVE = 259

def is_pid_running(pid):
    return (_is_pid_running_on_windows(pid) if platform.system() == "Windows"
        else _is_pid_running_on_unix(pid))

def _is_pid_running_on_unix(pid):
    try:
        os.kill(pid, 0)
    except OSError:
        return False
    return True

def _is_pid_running_on_windows(pid):

    kernel32 = ctypes.windll.kernel32
    handle = kernel32.OpenProcess(1, 0, pid)
    if handle == 0:
        return False

    # If the process exited recently, a pid may still exist for the handle.
    # So, check if we can get the exit code.
    exit_code = ctypes.wintypes.DWORD()
    is_running = (
        kernel32.GetExitCodeProcess(handle, ctypes.byref(exit_code)) == 0)
    print("\t\tis_running: {} \t exit_code:{}".format(is_running, exit_code.value))
    kernel32.CloseHandle(handle)

    # See if we couldn't get the exit code or the exit code indicates that the
    # process is still running.
    return is_running or exit_code.value == _STILL_ACTIVE



#--------------------------------------------------------
# Example
#    1. start cygwin
#    2. run ps command
#    3. get winpid for bash and assign to target
#    4. run script
#    5. kill cygwin and note output
#---------------------------------------------------------
target = 78808
count = 0
iters = 60
while( count < iters):
    print("[{}]".format(count), is_pid_running(target))
    sleep(0.2)
    count += 1
#--------------------------------------------------------
