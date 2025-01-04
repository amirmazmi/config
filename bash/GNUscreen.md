# GNU Screen

man page: https://www.gnu.org/software/screen/manual/screen.html


- create session `screen -S <session_name>`  
- list session  `screen -ls`   
- resume `screen -r <numeric id or session name>`  


<br>

### Keyboard Shortcuts
 - list all windows <kbd>Ctrl-a  "</kbd>
 - rename window <kbd>Ctrl-a  A</kbd>
 - detach <kbd>Ctrl-a  d</kbd>
 - split horizontally <kbd>Ctrl-a  S</kbd>
 - split vertically <kbd>Ctrl-a  |</kbd>
 - switch regions <kbd>Ctrl-a Tab</kbd>
 - kill window <kbd>Ctrl-a  k</kbd>
 - close current region (does not exit) <kbd>Ctrl-a  X</kbd>
 - close all except current region (does not exit) <kbd>Ctrl-a  Q</kbd>
 
 <br>

### Commands
Commands are invoked using <kbd>ctrl-a  :</kbd> 

 - `split -h` &ensp; split into horizontal regions (top and bottom)
 - `split -v` &ensp; split into vertical regions (side by side)
 - `resize +N` &ensp; or `-N` (n is number or lines)
 - `sessionname <newname>` &ensp; rename session



