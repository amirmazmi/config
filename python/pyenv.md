# Install multiple version of python

Guide - https://realpython.com/intro-to-pyenv/




<br>

# Auto init

add to .bashrc
```
export PYENV_ROOT="$HOME/.pyenv"
161 command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
162 eval "$(pyenv init -)"
163 eval "$(pyenv virtualenv-init -)"
```


<br>

# Commands
list all available 
`pyenv install --list`

install 
`pyenv install 3.9.16`

create virtualenv using specific version
`pyenv virtualenv <python_version> <environment_name>`

activate environment
`pyenv local <environment_name>`
 or
`pyenv activate <environment_name>`

deactivate
`pyenv deactivate`



<br><br>




