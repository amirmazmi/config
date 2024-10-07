### One liner to convert to base64


 `read -sp "password: " passvar; echo -e '\n'; echo $passvar | base64; echo -e '\n';  `
  
  
### encode base64
`encode_b64() { read -sp "string to encode: " passvar; echo -e '\n'; echo $passvar | base64; echo;}`

