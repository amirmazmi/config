# Use update alternatives for different versions
 
e.g. NUMPY requires gcc >= 8.4

<br>

### Source  
https://linuxconfig.org/how-to-switch-between-multiple-gcc-and-g-compiler-versions-on-ubuntu-20-04-lts-focal-fossa
https://www.baeldung.com/linux/update-alternatives-command
<br><br>  
  
### Install gcc and set alternatives

Install versions
```
sudo apt install build-essential
sudo apt -y install gcc-7 g++-7 gcc-8 g++-8
```
<br>

Add entries into update-alternatives
```
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 8
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 8
```
<br>

Inspect config
```
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
```
<br>

List current options/alternatives
```
update-alternatives --list gcc
update-alternatives --list g++
```
<br>

Set as default
```
sudo update-alternatives --set gcc /usr/bin/gcc-8
sudo update-alternatives --set g++ /usr/bin/g++-8
```



