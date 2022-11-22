# Extract imports from python scripts using bash

one liner
```for FILENAME in $(ls | grep 'py'); do grep 'import' $FILENAME; done | awk '{print $2}'ort | uniq | grep -v -E "<exclude scripts>" | tr '\n' ' '```

  
  
