# Byobu

To create new tabs (called screens) inside the current session you can:  
`byobu new-window "ls -la && sleep 5"`  
  
To start a new session (new byobu instance you can attach to) with a command you can:  
`byobu new-session -s "session name" "ls -la && sleep 5"`  

To create it already detached:  
`byobu new-session -d -s "session name" "ls -la && sleep 5"`  
  
To attach to a session by name:  
`byobu attach -t "session name"`  
  
create a new window in existing sessions - will close if process finished  
`byobu new-window -t "session name" -n "wawa" "tail -fn200 2023-01-01_01-02.log"`  
    
rename window - `F8`  
  
split pane  
`ctrl a |` OR `ctrl a S`  
  
unsplit  
`ctrl a !`  
  
resize pane  
`ctrl a` + `ctrl ↓ OR ↑`
