## Final form
```
echo -e "\n\t\t####### SPEEDTEST ####### \n" && (speedtest --csv-header --bytes | sed 's/Share,//g' && for (( k=1;k<=2;k++)); do speedtest --csv --bytes --server 1701 ; done) | column -t -s,
```


<br><br>  
## One liner for speedtest loop

`counter=0; while [ $k -le 3 ]; do echo -e "\n\n\t\t####### RUN:$k ####### \n"; speedtest --server \<server-id>; k=$(($k+1)) ; done`

or  

`for (( k=0;k<=5;k++)); do echo -e "\n\n\t\t####### RUN:$k ####### \n"; speedtest --server \<server-id>; done`



<br><br>  
## List servers
```  
speedtest --list | sed -n 2,40p  
```

```
speedtest --list | sed -n 2,100p | grep Indonesia
```
