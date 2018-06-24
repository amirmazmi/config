#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jun 24 19:42:43 2018

@author: speedy

This script appends a command line alias to the end of the .bashrc file and 
a reloads it. 

"""

import os
import subprocess
# =============================================================================
file_ori = '.bashrc'
filebackup = file_ori + '-wawawa'

stmt = r'''


# user defined aliases  
#    alias update='sudo apt update -y;     
                    printf "\n----------- apt update done\n\n\n";   
                    sudo apt upgrade -y;                             
                    printf "\n----------- apt upgrade done\n\n\n";
                    sudo apt dist-upgrade -y;
                    printf "\n----------- dist-upgrade done\n\n\n";
                    sudo apt autoremove;
                    printf "\n\n\t###### DONE ######\n\n\n" '
                    
                    
'''

# =============================================================================
# change dir
if (os.getcwd() != os.environ['HOME']) & ( '.bashrc' not in os.listdir()) :
    os.chdir( os.environ['HOME'])
    print('Changing dir to {}'.format( os.getcwd() ))

# create a copy 
mkcopy = subprocess.run( ['cp', '-vvv', file_ori, filebackup],
                      stdout=subprocess.PIPE,
                      check=True)

print( mkcopy.stdout.decode('utf-8'))
 
# open file and append alias to end
with open( file_ori, 'a') as f:
    f.write( stmt)
    f.close()

# reload bashrc file
reloadfile= subprocess.run( ['.', '~/.bashrc'], 
                           stdout=subprocess.PIPE,
                           check=True,
                           shell=True)
