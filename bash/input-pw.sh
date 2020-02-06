# Script to request user input for password


#---------------------------------------------------------------------
echo "Please enter your username";
read username;

echo "Please enter your password";
stty -echo
read password;
stty echo

#---------------------------------------------------------------------


read -s PASSWORD
echo $PASSWORD

#---------------------------------------------------------------------
