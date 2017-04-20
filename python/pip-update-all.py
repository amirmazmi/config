#!usr/bin/python3

import pip
from subprocess import call
 
for dist in pip.get_installed_distributions():
	print("\n")
	print("-------------------------------------------------")
	print("----- I should have installed conda!!! ----------")
	print("-------------------------------------------------")
	print("\n")
	call("sudo -H pip3 -v install --upgrade " + dist.project_name, shell=True)


print(" ####### DONE ########\n\n")
