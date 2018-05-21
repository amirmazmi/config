# save in same location as temp.py
# 	C:\Users\<username>\.spyder-py3\spyderStartUp.py



print('\n\n\t--- Startup script ---')
# ------------------------------------------------
# change pandas options
import pandas as pd
print('\n[+] Adjusting pandas options ',
		'\n\t display.width 		{} -> {}'.format( pd.get_option('display.width'), 150),
		'\n\t display.max_column 	{} -> {}'.format( pd.get_option('display.max_column'), 50)
		)
pd.set_option('display.max_column', 50)
pd.set_option('display.width', 150)
del pd

# ------------------------------------------------
# add new section here



# ------------------------------------------------
print('\n\n\t--- End of script ---\n\n')

