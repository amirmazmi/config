#!/bin/bash

# to create use either: 
#       virtualenv <path/to/new/virtualenv>
#       virtualenv --python=/usr/bin/python2.6 <path/to/new/virtualenv>


# replace with the venv name
VENV="name_of_venv" 

source $VENV/bin/activate

if [ $? -eq 0 ]; then
    echo -e "\n[$VENV] virtualenv SUCCESSFULLY activated...\n"
else
    echo -e "\n[$VENV] virtualenv FAILED to activate...\n"
fi
