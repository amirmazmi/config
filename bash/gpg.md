
#### Encrypt a single file
`gpg --symmetric --cipher-algo TWOFISH --output <filename.gpg> /path/to/file`
<br><br>

#### To decrypt the encryped file:
`gpg --decrypt --output <filename> /path/to/archive.gpg`
<br><br>

#### Use the following to output to terminal only:
`gpg --decrypt --output - /path/to/archive.gpg`

