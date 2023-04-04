## Preamble


<br>

## 1. Terminal

> Also called shell or command line interface (CLI)

Use of terminal is basic for managing python, including creating and managing virtual environments, installing packages using `pip` or `conda` running jupyter notebooks, even executing python scripts.

In windows, there are 2 terminal available, command prompt and powershell. While powershell is a powerful terminal, using command prompt is (**relatively** safer) and easier.

The easiest way to open command prompt in the folder you would like to operate, is to open the location in file explorer and type `cmd` in the address bar.


<br>

### 1.1 Python scripts
Python scripts are scripts that have been created and can run by itself. These are simply *text files* with a `.py` extension to indicate it is a python file. In some terminals, the file can also have a `.txt` extension or even no extension at all and will still execute/run.


Example:
> "hello.py"
> ```
> print("Hello world")
> ```

Execute in terminal
`python hello.py`

<br>

### 1.2 Basic commands
 - `cd` - change directory
 - `dir` or `ls` - list directory (show contents of current directory)
 - `pwd` - present working directory
https://realpython.com/terminal-commands/

The terminal is a powerful tool that can control the entire operating system and is lightweight.

Terminal usually operates on the present working directory, similar to using a file explorer where you are only able to see the contents of the current location. The current location is shown before the prompt `C:/User/user/Desktop>`. The '>' is the prompt.

So attempting to execute hello.py would not work (since the terminal cannot see the file, check using `dir`). From here, navigate to the desired folder/directory using the `cd` command. The easiest way is to copy the location from a file explorer

e.g.
`cd <desired folder>`
`cd C:/User/user/Desktop/scripts`

Next run `dir` and if `hello.py` is listed, then the terminal can "see" the file. Executing `python hello.py` will print `hello`.


<br>

## 3. Python
Python can be invoked from the terminal to open the python shell or REPL (Read-Eval-Print-Loop). Simply type `python` in a terminal.




Similarly, Python operates on the same principle that it can only "see" the current directory. This will be the directory where python was invoked from the terminal.

e.g.
> `C:/User/user/Desktop/scripts>python`

Therefore the working directory will be `C:/User/user/Desktop/scripts`. This can be confirm by running the following commands in the python terminal.




-imports
-namespace
-atomic data types
-design language
-how to read documentation
-stack overflow





