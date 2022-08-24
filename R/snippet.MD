### Code Snippet - autocomplete (tab completion)

<br>

Tools > Global Options > Code > Edit Snippets  
Alt+T > G


```
snippet ftemplate
	#-------------------------------------------------------------------------------
	#
	#   title
	#
	#       Author  : Amir Azmi
	#       Created : `r strftime(strptime(date(), format="%a %b %d %H:%M:%S %Y"), format="%d %b %Y")`
	#       Updated : `r strftime(strptime(date(), format="%a %b %d %H:%M:%S %Y"), format="%d %b %Y")`
	#
	#-------------------------------------------------------------------------------
	library(pacman)
	
	#-------------------------------------------------------------------------------
	# set up
	
	#-------------------------------------------------------------------------------
	
	
snippet hr
	#-------------------------------------------------------------------------------
```
