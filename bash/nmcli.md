# CLI interface for network manager

source: https://www.networkworld.com/article/3662052/use-bash-to-change-an-ip-address-from-dynamic-to-static-on-linux.html

<br>


### Connect Wifi

Show status
```
nmcli dev status
nmcli radio wifi
```
<br>

Enable wifi and list access points
```
nmcli radio wifi on
nmcli dev wifi list
```
<br>

Connect
```
sudo nmcli dev wifi connect <ssid>
sudo nmcli --ask dev wifi connect <ssid>
```

<br>  


### Disconnect Wifi

Bring down the connection
```
nmcli con down id connectionname
```

<br><br>

---  

<br><br>  
  

Show connections
```
nmcli connection show
```

<br>

Get UUID
```
CONNUUID=$(nmcli connection show | sed -n '2p' | awk '{print $2}')
# OR
CONNUUID=$(nmcli connection show | grep <connection-name> | awk '{print $2}')
```

<br>

Set static IP - **make sure gateway ip is set or will not connect**
```
sudo nmcli connection modify $CONNUUID IPv4.address $IP/$sz   # set static IP
sudo nmcli connection modify $CONNUUID IPv4.gateway $router   # set path to router
sudo nmcli connection modify $CONNUUID IPv4.method manual     # change to static
# down up to apply
sudo nmcli connection down $CONNUUID && sudo nmcli connection up $CONNUUID
```



