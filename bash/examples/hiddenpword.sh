#!/bin/bash

# -r        Backslash  does not act as an escape character.  The backslash is considered to be part
             # of the line. In particular, a backslash-newline pair can not be used as a line continuation.

# -s        Silent mode. If input is coming from a terminal, characters are not echoed.
# -n nchars
             # read returns after reading nchars characters rather than waiting for a complete line of
             # input.
# -p prompt
             # Display prompt on standard error, without a trailing newline, before attempting to read
             # any input. The prompt is displayed only if input is coming from a terminal.


echo
read -rp $'  Please enter your username: ' username

stty -echo
read -rsp $'  Please enter your password: ' password 
stty echo


echo -e "\n"
echo $username 
echo $password 
echo -e "\n"
