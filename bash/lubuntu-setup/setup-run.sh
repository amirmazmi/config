# script to execute lubuntu setup
#   1. append alias to bashrc - backup previous file
#   2. edit lxterminal.conf - backup previous file
#   3. install linux packages
#   4. edit grub file for fn key

# 1. append alias to bashrc - backup previous file
lxterminal -e 'bash -c "python3 bashrc-update; bash"'

# 2. edit lxterminal.conf - backup previous file
# back up file
mv -vvv ~/.config/lxterminal/lxterminal.conf ~/.config/lxterminal/lxterminal.conf-backup
# copy file in
mv -vvvv lxterminal.conf ~/.config/lxterminal/lxterminal.conf

# 3. install linux packages
lxterminal -e 'bash -c "xargs -a linux-packages sudo apt install; bash"'


#   4. edit grub file for fn key


sleep 5
lxterminal -e "bash"
exit

