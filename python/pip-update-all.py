#!usr/bin/python3

import pip, time
from subprocess import call
 
print("\n Check your pip command \n")
call("pip -V", shell=True)
call("pip2 -V", shell=True)
call("pip3 -V", shell=True)

sleep(2)
	
for dist in pip.get_installed_distributions():
	print("\n")
	call("sudo -H pip3 install --upgrade " + dist.project_name, shell=True)


print("\n\n ####### DONE ########\n\n")
