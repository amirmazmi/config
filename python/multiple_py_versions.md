## How to install multiple Python versions in ubuntu
**DO NOT RUN!!!  `apt-get install python3.X`**  

source: https://hackersandslackers.com/multiple-versions-python-ubuntu/
<br><br>

Start by making sure we have have the latest mirrors and packages  
`apt update && apt upgrade -y`  
<br>  

Install dependencies
```
sudo apt-get install build-essential checkinstall
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
```
<br>
  
Instead download python from source and manually install
```
# download
cd /opt
sudo wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz
sudo tar xzf Python-3.8.0.tgz

# install
cd Python-3.8.0
sudo ./configure --enable-optimizations
sudo make altinstall
```  
<br>

Then, verify...  
`python3 --version`  
<br>
  
Next, make sure ubuntu is aware of alternatives.
```
update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1
update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2
```  
<br>  
  
And we need to make sure we have pip
```
apt install python3-pip
python3.8 -m pip install --upgrade pip
```    
<br>
  
To switch between versions:  
`update-alternatives --config python`






<br><br>


