# GNU Screen

man page: https://www.gnu.org/software/screen/manual/screen.html

|                 | command                                                | note                           |
|:---------------:|--------------------------------------------------------|--------------------------------|
| create session  | `screen -S <session name>`                             |                                |
| list session    | `screen -ls`                                           |                                |
| resume          | `screen -r <numeric id or session name>`               |                                |
| start detached  | `screen -dmS <session name> bash -c '<command>; bash'` | bash at the end to stay open   |
| kill window     | `screen -S <sessionname> -p 0 -X kill`                 | 'p' switch/flag selects window |
| kill session    | `screen -S <sessionname> -X quit`                      |                                |




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


### Config file ~/.screenrc
```
# file for GNU screen settings

autodetach 	    on
startup_message off

defscrollback 	10000			# scrollback history
altscreen 	    on			    # vim output does not stay in terminal history

term            screen-256color
#term           xterm-256color
termcapinfo     xterm* OL=2000

caption 	   always "%?%F%{= Kk}%:%{=u kR}%?  %h %-024=%{+b} %C%a %D %d %M %Y%{= db}"

shelltitle 	   'bash'
hardstatus 	    alwayslastline
# hardstatus 	alwayslastline "%{= kR} %-Lw%{=b Kk} %n%f %t %{-}%+Lw %=%{= dd}"

hardstatus 	    string '%{gk}[%{wk}%?%-Lw%?%{=b kR}(%{W}%n*%f %t%?(%u)%?%{=b kR})%{= w}%?%+Lw%?%? %{g}][%{d}%l%{g}][ %{= w}%Y/%m/%d %0C:%s%a%{g} ]%{W}'
## Without time
#hardstatus     string '%{wk}%?%-Lw%?%{=b kR}(%{W}%n*%f %t%?(%u)%?%{=b kR})%{= w}%?%+Lw%?%? %{g}]'
## source: https://unix.stackexchange.com/questions/114505/gnu-screen-status-bar-how-to-make-it-display-shell-session-names


#bindkey -k k7 detach # bind F7  to detach screen session from this terminal
#bindkey -k k8 kill   # bind F8  to kill current screen window.
#bindkey -k k9 next   # bind F9 to move to previous window
#bindkey -k F1 prev   # bind F11 to move to next window
#bindkey -k F2 hardstatus alwaysignore # F12 to turn the status bar on
#bindkey -k k9 screen # bind F9  to create a new screen
#bindkey -k k; title  # bind F10 to rename current screen window
#bindkey -k F1 prev   # bind F11 to move to previous window
#bindkey -k F2 next   # bind F12 to move to next window
#bindkey "^[Od" prev  # change window with ctrl-left
#bindkey "^[Oc" next  # change window with ctrl-right

```
