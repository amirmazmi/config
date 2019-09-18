### How to execute in new terminal

##### Execute script in new terminal  
```  
lxterminal -e '/bin/bash -c "speedtest --list | sed -n '"5,10p"'; sleep 20 "'  
```


run with sudo for escalated privilges or login as root
```
sudo lxterminal ...
````
