# Bash one liner

### hmac sha256
`echo -n "message" | openssl dgst -sha256 -hmac "key"`  
<br>  
  
    
### hmac sha256 encode with url safe base64
`echo -n "message" | openssl dgst -sha256 -hmac "key" -binary | base64 | sed -e 's/+/-/g' -e 's/\//_/g' | tr -d =`  
  
<br>  
  
---  


### message
`amount100|collection_idyhx5t1pp|due_at2018-9-27|emailtester@test.com|idzq0tm2wc|mobile|nameTESTER|paid_amount100|paid_at2018-09-27 15:15:09 +0800|paidtrue|statepaid|urlhttp://www.billplz-sandbox.com/bills/zq0tm2wc`

### key
`S-s7b4yWpp9h7rrkNM1i3Z_g`

### HMAC
`0fe0a20b8d557eeae570377783d062a3816a9ea80f368860bacfa7ec3ca4d00e`  

<br>  

### Example
`echo -n "amount100|collection_idyhx5t1pp|due_at2018-9-27|emailtester@test.com|idzq0tm2wc|mobile|nameTESTER|paid_amount100|paid_at2018-09-27 15:15:09 +0800|paidtrue|statepaid|urlhttp://www.billplz-sandbox.com/bills/zq0tm2wc" | openssl dgst -sha256 -hmac "S-s7b4yWpp9h7rrkNM1i3Z_g"`

