#### list files only in wide format and filter for ipynb  
`dir /W /A:-D | findstr "ipynb"`
<br><br>

#### loop through list and print filenames - sanity check  
`for /f "tokens=*" %C in ('dir /W /A:-D ^| findstr "ipynb"') DO @(echo "%C)`
<br><br>

#### loop through and convert notebooks to python scripts  
`for /f "tokens=*" %C in ('dir /W /A:-D ^| findstr "ipynb"') DO @(ipython nbconvert --to python "%C")`
<br><br>

#### using default converts to html  
`for /f "tokens=*" %C in ('dir /W /A:-D ^| findstr "ipynb"') DO @(ipython nbconvert "%C")`
<br><br>
