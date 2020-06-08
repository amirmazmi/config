
## One liner for speedtest loop

`counter=0; while [ $k -le 3 ]; do echo -e "\n\n\t\t####### RUN:$k ####### \n"; speedtest --server \<server-id>; k=$(($k+1)) ; done`

or  

`for (( k=0;k<=5;k++)); do echo -e "\n\n\t\t####### RUN:$k ####### \n"; speedtest --server \<server-id>; done`






<br><br>  
## List servers
```  
speedtest --list | sed -n 2,40p  
```
