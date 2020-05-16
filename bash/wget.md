## wget command cheat sheet  
<br>  

#### Simple use case  
`wget -O <filename> <url> `  
<br>  
  
#### Output to standard output
`wget -O - <url>`   
<br>  
  
#### No logs
`wget -O <filename> -q /dev/null <url>`  
<br>     
    
#### Mirroring
`wget -mk -w 20 http://www.example.com/`  
-m turn on mirroring  
-k make links suitable for local browsing  
-w wait 20 seconds between each link download. Alternatively use --random-wait  
Once the command has finished a local copy of the entire site will be available.  



https://shapeshed.com/unix-wget/
