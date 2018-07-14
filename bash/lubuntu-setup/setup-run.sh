# script to execute lubuntu setup
#   1. append alias to bashrc - backup previous file
#   2. edit lxterminal.conf - backup previous file
#   3. install linux packages
#   4. edit grub file for fn key

# 1. append alias to bashrc - backup previous file
lxterminal -e 'bash -c "python3 bashrc-update; bash"'

# 2. edit lxterminal.conf - backup previous file
# back up file
# copy file in


# 3. install linux packages
lxterminal -e 'bash -c "xargs -a linux-packages sudo apt install"'


#   4. edit grub file for fn key




