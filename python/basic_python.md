## Preamble

There are many ways to do one thing. While people will tell you better ways, there is no right or wrong, perhaps efficient or inefficient, ultimately it is about what works for you or fits your use case. As well as what you can understand.

Below are some notes that address the environments around python rather than programming in python itself. 




<br>

## 1. Terminal

> Also called shell or command line interface (CLI)  

Use of terminal is basic for managing python, including creating and managing virtual environments, installing packages using `pip` or `conda` running jupyter notebooks, even executing python scripts.

In windows, there are 2 terminal available, command prompt and powershell. While powershell is a powerful terminal, using command prompt is (**relatively** safer) and easier.

The easiest way to open command prompt in the folder you would like to operate, is to open the location in file explorer and type `cmd` in the address bar.




<br>

### 1.1 Basic commands
 - `cd` - change directory
 - `dir` or `ls` - list directory (show contents of current directory)
 - `pwd` - present working directory

 https://realpython.com/terminal-commands/

The terminal is a powerful tool that can control the entire operating system and is lightweight.

Terminal usually operates on the present working directory, similar to using a file explorer where you are only able to see the contents of the current location. The current location is shown before the prompt `C:/User/user/Desktop>`. The '>' is the prompt.



<br>

### 1.2 Python scripts
Python scripts are scripts that have been created and can run by itself or are a collection of functions. These are simply *text files* with a `.py` extension to indicate it is a python file. In some terminals, the file can also have a `.txt` extension or even no extension at all and will still execute/run.


Example:
On your desktop, open a text editor, copy paste the content below and save it as `hello.py`  
> `print("Hello world")`

Open a terminal and execute  
`python hello.py`

<br> 

So attempting to execute hello.py would not work (since the terminal cannot see the file, check using `dir`). From here, navigate to the desired folder/directory using the `cd` command. The easiest way is to copy the location from a file explorer

e.g.  
`cd <desired folder>`  
`cd C:/User/user/Desktop/scripts`  

Next run `dir` and if `hello.py` is listed, then the terminal can "see" the file. Executing `python hello.py` will print `Hello world`.

<br><br>




## 2. Python

### 2.1 REPL
Python can be invoked from the terminal to open the python shell or REPL (Read-Eval-Print-Loop). Simply type `python` in a terminal. Commands that can be run in a script can also be run in the REPL. This is a good way to do super simple tests or check basic syntax.
  
  
https://realpython.com/python-repl/

<br>




### 2.2 Working directory
Similarly, Python operates on the same principle that it can only "see" the current directory. This will be the directory where python was invoked from the terminal or where jupyter notebook was launched. 

e.g.
> `C:/User/user/Desktop/scripts> python`  

Therefore the working directory will be `C:/User/user/Desktop/scripts`. This can be confirmed by running the following commands in the python terminal.
```
import os  
os.getcwd()     # get current working directory
```

To change directory in python, use `os.chdir(<directory>)`

<br>




## 2.3 Imports
In python imports are use to:
 1. import packages
 2. import scripts or modules that have been created
  
  
In most cases, you would already be familiar with `import numpy` but there will be times you would have created your own modules or collated your own functions (such as the black scholes class).
  
<br>  

We have to note:
 1. the filename - `BlackScholes.py`
 2. the function or class name `BS`  
  
<br>  

For the `BlackScholes.py` example, there are several ways to import.
 1. `from BlackScholes import BS` (from filename import function/class)
     - typical use and imports a specific function/class
 2. `import BlackScholes.BS as BSfunc`
     - import and rename (usually used to reduce typing effort)
 3. `from BlackScholes import *`
     - just import everything in this file e.g. other functions as well, if there was any
  
<br>

Again, here python must be able to "see" or be in the same directory as the `.py` file we would like to import. At the very least, it has to be a subfolder in the present directory, such as a folder called `src`.
  
<br>

To import:
 1. `from src.BlackScholes import BS`
 2. `import src.BlackScholes.BS as BSfunc`
 3. `from src.BlackScholes import *`

Dot is to indicate the sublevel and will work for any further sub level down.
  
The only way to reload imports is to restart the kernel (in jupyter). Python will not re-import even if you re-run the import line. 
    
<br>





### 2.4 Namespace/Scope
The namespace is how python knows what objects are in your environment. These include packages, functions and variables.

For example,
```
x = 3
```
Then your namespace will contain a symbolic reference to `x` for the variable. Similar applies to the imports before.
Most IDEs will have a variable explorer to see the current objects in your namespace. However, this is only available as an extension in jupyter. 

<br>

 1. `from src.BlackScholes import BS` - loaded as `BS`
 2. `import src.BlackScholes.BS as BSfunc` - loaded as `BSfunc`
 3. `from src.BlackScholes import *` - loaded as defined in the file
  
<br>  

There are several levels in namespace
1. Built-in - print, while, if
2. Global - any defined outside of a function i.e. `x=3` (acccessible in any functions)
3. Local - any defined *inside* of a function (not accessible globally)
 
<br>
  
Be careful not to override the built in functions as it will cause errors when running your code.

```
print = 3
print("Test")
# output:
# Traceback (most recent call last):
#  File "<stdin>", line 1, in <module>
# TypeError: 'int' object is not callable
```
In the example above, you have overridden the print function with a value (not good!)

<br>

Scope is an advanced topic but just note when you get an error message
> NameError: name 'x' is not defined
  
know that this may be the reason.

<br>



### 2.5 Atomic data types
Python has several built in data types:
 - list
 - dictionary
 - int
 - float
 - string

<br>

It is important to understand the basic types as all other packagees will depend on these types. This is how infomation is passed back and forth.

Example:
Create the a pandas DataFrame with column name provided explicitly
```
df = pd.DataFrame([10,20,30,40,50,60], columns=['Numbers'])
df = pd.DataFrame([['tom', 90], ['nick', 75], ['julie', 104]], columns=['Name', 'Age'])
```
As you can see, the input are list or list of lists.

Python has no JSON/YAML data type, in most cases it will be converted to a dictionary (or list of dictionaries). Important when connecting to APIs. 

<br>





### 2.6 Object oriented
In most cases, python packages are object oriented. This is a programming paradigm called object-oriented programming (OOP). 

Example: `df = pd.DataFrame()` means the object is a pandas class object.

`"Hello world"` is a string object, therefore has associated methods (functions) such as `.replace()`

```
"Hello world".replace("o", "a")
# output: 'Hella warld'
```

You would have seen this in `df.head()`

<br>

Python Classes https://www.w3schools.com/python/python_classes.asp

<br>





### 2.7 Gotchas

The numbers that you see may not be how it is stored. Python does this to make your life easier. However, it is important to understand some issue with floating point numbers. This will be true for most programming languages as it is inherent with how computers work.
> Floating-point numbers are represented in computer hardware as base 2 (binary) fractions.
> https://docs.python.org/3/tutorial/floatingpoint.html

Example:
```
>>> 1/10
0.1
>>> format(0.1,'.50f')
'0.10000000000000000555111512312578270211815834045410'
```
The number actually stored is not exact. In which case, you can use the `decimal` built-in package (some developers store dollar values as cent strings)

<br>




### 2.8 Tips

1. Single letters for iterators
    `for k in range(100)`
2. Write comments, this will help you remember what you were:
    - trying to do 
    - trying to achieve
    - when you write something quick and dirty
4. Better yet, name your variables clearly, ideally include their object types.
    - e.g. `df_rawdata`, `ls_ticker`, `dict_options`, `arr_randunifom`
5. When troubleshooting, use print statements liberally to check your logic. When you do programming more often, try to use an IDE and learn how to use a debugger. It will save a lot of time. 
6. Even if you are not a developer or programmer, learning to use github (this platform you are reading on now) will make version management way easier. A desktop version called git is also available for sensitive or IP related work. 
7. When asking for help, share the block of code and the exact error message. People want to help but guessing what caused the error is difficult. 
8. You will re-use your code, so always write with this in mind. Because learning the easy way is better than pain.  

<br>




### 2.9 Recommendations
1. Plotly - in most cases, this will cover most plotting you need to do. Being able to zoom, pan, tilt will prevent from having to plot multiple times. 
2. SymPy - symbolic python like using a graphical calculator. Define an expression once then substitute values. 

<br><br>




## 3. Resources

### 3.1 Documentation
This is the most important way to understand how to use any packages and its functions. It would be beneficial to understand how to read this.   
Ideally, someone explains to you how to read this. 

<br>



### 3.2 Other resources
https://stackoverflow.com/  
https://quant.stackexchange.com/

Alternatively, brush up on your google-fu https://www.pcmag.com/encyclopedia/term/google-fu






<br><br>

