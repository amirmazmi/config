#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jun 24 2018

@author: speedy

This script appends a command line alias to the end of the .bashrc file and 
a reloads it. 

"""

import os
import subprocess
# =============================================================================
file_ori = '.bashrc'
filebackup = file_ori + '-backup'

stmt = r'''


# user defined aliases  
alias update='sudo apt update -y;     
                    printf "\n----------- apt update done\n\n\n";   
                    sudo apt upgrade -y;                             
                    printf "\n----------- apt upgrade done\n\n\n";
                    sudo apt dist-upgrade -y;
                    printf "\n----------- dist-upgrade done\n\n\n";
                    sudo apt autoremove;
                    printf "\n\n\t###### DONE ######\n\n\n" '
                    
# screengrab
alias screengrab='CURRDIRR=$(pwd);
                        cd ~/Desktop; 
                        echo -e "\n" && scrot -ucd 5 && echo -e "\n";
                        cd $CURRDIRR '

                    
'''

# =============================================================================
# change dir
if (os.getcwd() != os.environ['HOME']) & ( '.bashrc' not in os.listdir()) :
    os.chdir( os.environ['HOME'])
    print('[+] directory changed to {}'.format( os.getcwd() ))

print("[+] Creating backup copy...")    
# create a copy 
mkcopy = subprocess.run( ['cp', '-vvv', file_ori, filebackup],
                      stdout=subprocess.PIPE,
                      check=True)
print( "[!] Copy result: ", mkcopy.stdout.decode('utf-8'))

print( "[+] Appending to file...")
# open file and append alias to end
with open( file_ori, 'a') as f:
    f.write( stmt)
    f.close()
print("[+] File appended")
    
print("[+] Reloading bashrc...")     
# reload bashrc file
reloadfile= subprocess.run( ['.', '~/.bashrc'], 
                           stdout=subprocess.PIPE,
                           check=True,
                           shell=True)
print( "[!] Append result: ",reloadfile.stdout.decode('utf-8'))
print("\n\n\t### append alias to bashrc complete ### \n\n\n")

      
      
