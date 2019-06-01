# Create a swap file for ubuntu
ref: https://help.ubuntu.com/community/SwapFaq


How do I add a swap file?  
Note: btrfs does not support swap files at the moment. See man swapon. and btrfs Faq  

Create the Swap File:  
We will create a 1 GiB file (/mnt/1GiB.swap) to use as swap:  
`sudo fallocate -l 1g /mnt/1GiB.swap`  
fallocate size suffixes: g = Giga, m = Mega, etc. (See man fallocate).  

If fallocate fails or it not available, you can use dd:  
`sudo dd if=/dev/zero of=/mnt/1GiB.swap bs=1024 count=1048576`  

We need to set the swap file permissions to 600 to prevent other users from being able to read potentially sensitive information from the swap file.  
`sudo chmod 600 /mnt/1GiB.swap`  

Format the file as swap:  
`sudo mkswap /mnt/1GiB.swap`  

Enable use of Swap File  
`sudo swapon /mnt/1GiB.swap`  
The additional swap is now available and verified with: cat /proc/swaps  

Enable Swap File at Bootup  
Add the swap file details to /etc/fstab so it will be available at bootup:  
`echo '/mnt/1GiB.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab` 

----
Example of making a swap file
This is an example of making and using a swap file on a computer with no swap partition.

$ sudo fallocate -l 1g /mnt/1GiB.swap  
$ sudo chmod 600 /mnt/1GiB.swap  
$ sudo mkswap /mnt/1GiB.swap  
Setting up swapspace version 1, size = 1048576 kB  
$ sudo swapon /mnt/1GiB.swap  
$ cat /proc/swaps   

Filename | Type | Size | Used | Priority
--- | --- | --- | --- | --- 
/home/swapfile | file | 1048576 | 1048576 | -1

$ echo '/mnt/4GiB.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab  
$ reboot  
$ free -h  

 X | total | used | free | shared | buff/cache | available 
--- | --- | --- | --- | --- | --- | ---
Mem: | 15G | 9.3G | 454M | 4.0G | 5.8G | 1.9G
Swap: | 1.0G | 1.0G | 0B |   |   |


# Disable and Remove a Swap File  
Disable the swap file from the running system and the delete it:  
`sudo swapoff /mnt/1Gib.swap`  
`sudo rm /mnt/1Gib.swap`  

Remove the swap file details from fstab:  
`gksudo gedit /etc/fstab`

Removing the swap file line  
`/mnt/1GiB.swap swap swap defaults 0 0`
