# rsync

<br><br>


### from local to remote using ssh
 - for check sum use `-c` flag (but slow)
 - source: https://stackoverflow.com/questions/9090817/copying-files-using-rsync-from-remote-server-to-local-machine

```
rsync -chavzP --stats <user>@<remote.host>:</path/to/copy> </local/path>
```

<br>

- using ssh

```
rsync -chavzP -e "ssh -p <portNumber>" <user>@<remote.host>:</path/to/copy> </local/path>
```
