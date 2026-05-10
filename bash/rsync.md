# rsync

<br><br>


### from local to remote using ssh
 - source: https://stackoverflow.com/questions/9090817/copying-files-using-rsync-from-remote-server-to-local-machine
 - for check sum use `-c` flag (but slow)
 - `--dry-run` to test output

```
rsync -chavzP --exclude={pyenv,__pycache__} --stats <user>@<remote.host>:</path/to/copy> </local/path>
```

<br>

- using ssh

```
rsync -chavzP --exclude={pyenv,__pycache__} -e "ssh -p <portNumber>" <user>@<remote.host>:</path/to/copy> </local/path>
```
