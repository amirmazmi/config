# Bash setup

Order of loading files in bash

Instead of .bashrc, login shells source .profile  
- unless .bash_login exists  
- unless .bash_profile exists

so can source .bashrc in .bash_profile with following line  
`. /home/<username>/.bashrc`
  
