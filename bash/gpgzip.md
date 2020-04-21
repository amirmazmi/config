

#### Passwords may be cached by gpg agent. Can avoid this by creating ~/.gnupg/gpg-agent.conf with the following options
```
default-cache-ttl 1
max-cache-ttl 1
```
<br><br>

#### To encrypt a directory into archive.gpg using a passphrase:
```gpg-zip --symmetric --gpg-args '--cipher-algo TWOFISH' --output <filename.gpg> <path/to/directory>```
<br><br> 
 
#### To decrypt archive.gpg into a directory of the same name:
```gpg-zip --decrypt <path/to/archive.gpg>```
 <br><br>
 
#### To list the contents of the encrypted archive.gpg:
```gpg-zip --list-archive <path/to/archive.gpg>```
<br><br>
