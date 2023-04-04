## Preamble

1. There are many ways to do one thing. While people will tell you better ways, there is no right or wrong, only efficient or inefficient, ultimately it is about what works for you or fits your use case. As well as what you can understand.


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
Python scripts are scripts that have been created and can run by itself. These are simply *text files* with a `.py` extension to indicate it is a python file. In some terminals, the file can also have a `.txt` extension or even no extension at all and will still execute/run.


Example:
> open a text editor, copy paste the content below and save it as `hello.py`
> `print("Hello world")`


Execute in terminal
`python hello.py`

So attempting to execute hello.py would not work (since the terminal cannot see the file, check using `dir`). From here, navigate to the desired folder/directory using the `cd` command. The easiest way is to copy the location from a file explorer

e.g.
`cd <desired folder>`
`cd C:/User/user/Desktop/scripts`

Next run `dir` and if `hello.py` is listed, then the terminal can "see" the file. Executing `python hello.py` will print `hello`.


<br>

## 3. Python

### 3.1 REPL
Python can be invoked from the terminal to open the python shell or REPL (Read-Eval-Print-Loop). Simply type `python` in a terminal.

https://realpython.com/python-repl/



<br>

### 3.2 Working directory
Similarly, Python operates on the same principle that it can only "see" the current directory. This will be the directory where python was invoked from the terminal.

e.g.
> `C:/User/user/Desktop/scripts> python`

Therefore the working directory will be `C:/User/user/Desktop/scripts`. This can be confirmed by running the following commands in the python terminal.
```
import os
os.getcwd()     # get current working directory
```

To change directory in python, use `os.chdir(<directory>)`




<br>

## 3.3 Imports
In python imports are use to:
 1. import packages
 2. import scripts or modules that have been created

In most cases, you would already be familiar with `import numpy` but there will be times you would have created your own modules or collated your own functions (such as the black scholes class).

We have to note:
 1. the filename - `BlackScholes.py`
 2. the function or class name `BS`

For the `BlackScholes.py` example, there are several ways to import.
 1. `from BlackScholes import BS` (from filename import function/class)
     - typical use and imports a specific function/class
 2. `import BlackScholes.BS as BSfunc`
     - import and rename (reduce typing effort)
 3. `from BlackScholes import *`
     - just import everything in this file e.g. other functions as well, if there was any

Again, here python must be able to "see" or be in the same directory as the `.py` file we would like to import. At the very least, it has to be a subfolder in the present directory, such as a folder called `src`.

To import:
 1. `from src.BlackScholes import BS`
 2. `import src.BlackScholes.BS as BSfunc`
 3. `from src.BlackScholes import *`

Dot is to indicate the sublevel and will work for any further sub level down.


<br>

### 3.4 Namespace/Scope
The namespace is how python knows what are the variables in your environment.

For example,
```
x = 3
```
Then your namespace will contain a symbolic reference `x` to indicate the variable. Similar applies to the imports before.

 1. `from src.BlackScholes import BS` - loaded as `BS`
 2. `import src.BlackScholes.BS as BSfunc` - loaded as `BSfunc`
 3. `from src.BlackScholes import *` - loaded as defind the file

There are several levels in namespace
1. Built-in - print, while, if
2. Global - any defined outside of a function i.e. `x=3` (acccessible in any functions)
3. Local - any defined *inside* of a function (not accessible globally)

Be careful not to override the built in functions as it will cause errors when running your code.

```
print = 3
print("Test")
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'int' object is not callable
```

This is an advanced topic but just note when you get an error message
> NameError: name 'x' is not defined

that this may be the reason.


<br>

### 3.5 Atomic data types
Python has several built in data types:
 - list
 - dictionary
 - int
 - float
 - string

It is important to understand the basic types as all other packagees will depend on these types. There are how infomation is passed back and forth.

Example:
    Python has no JSON data type, in most cases it will be converted to a dictionary (or list of dictionaries)

    Create the a pandas DataFrame with column name is provided explicitly
    `df = pd.DataFrame([10,20,30,40,50,60], columns=['Numbers'])`
    `df = pd.DataFrame([['tom', 90], ['nick', 75], ['julie', 104]], columns=['Name', 'Age'])


-design language
-how to read documentation
-stack overflow



<br><br>

