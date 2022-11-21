# CLI interface for network manager

source: https://www.networkworld.com/article/3662052/use-bash-to-change-an-ip-address-from-dynamic-to-static-on-linux.html

<br>

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

Set static IP 
```
sudo nmcli connection modify $CONNUUID IPv4.address $IP/$sz   # set static IP
sudo nmcli connection modify $CONNUUID IPv4.gateway $router   # set path to router
sudo nmcli connection modify $CONNUUID IPv4.method manual     # change to static
sudo nmcli connection down $CONNUUID      # down up to apply
sudo nmcli connection up $CONNUUID
```
