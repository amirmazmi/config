# Byobu

Man page for tmux - https://manpages.ubuntu.com/manpages/trusty/en/man1/tmux.1.html   

<br>
   
To start a new session (new byobu instance you can attach to) with a command you can:  
`byobu new-session -s "session name" "ls -la && sleep 5"`  

To create it already detached:  
`byobu new-session -d -s "session name" "ls -la && sleep 5"`  
  
To attach to specific session by name:  
`byobu attach -t <session name>`  
 but running `byobu attach` will attach to any session then can navigate using `ctrl a "`  

create a new window in existing sessions - will close if process finished  
`byobu new-window -t <session name> -n "wawa" "tail -fn200 2023-01-01_01-02.log"`  

*depends on current session/window/pane*
```
byobu new-window -n <window_name> -t <session_name>
byobu select-window -t SESSION:0  
byobu select-pane -t SESSION:0
```

### Alias
`select-window`:`selectw`  
`select-pane`: `selectp`

commands can also be chained using `\;`


<br><br>   

--- 

rename window - `F8`  
  
split pane  
`ctrl a |` OR `ctrl a S`  
  
unsplit  
`ctrl a !`  
  
resize pane  
`ctrl a` + `ctrl ↓ OR ↑`

toggle (un)maximize pane
`shift f11`


