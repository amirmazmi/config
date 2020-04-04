#
#-------------------------------------------
#   Script to run update and check R version
#-------------------------------------------
#
# installr is only for windows - https://github.com/talgalili/installr/issues/88

# Use pacman to manage packages
if(!require(pacman)) {
    install.packages("pacman"); require(pacman)
}
p_load(installr)

# check current version
version

# tells you if there is a new version of R or not.
check.for.updates.R()


# install, move, update.package, quit R.
# copy_packages=F since using global library
if (check.for.updates.R()){
    updateR(fast=F, browse_news=F, install_R=T, copy_packages=F, 
        copy_Rprofile.site=T, keep_old_packages=F, update_packages=T, 
        start_new_R=F, quit_R=F)
}

## Restart Rstudio ##


### --- Linux --- ###

# Need to add the repo to apt source list
# 1. Add public key -> sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
# 2. Go to /etc/apt/sources.list and add the relevant lines
    ## 18.04
    # deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/
    ## 16.04
    # deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/
# 3. run apt-update 




#--------------------
# RStudio versions
#--------------------

# Use GUI to check current version in Help > About RStudio
# To update, Help > Check for Updates





#################################################
#     Below is only if using global library     #
#################################################

# check path to global library
Sys.getenv("R_LIBS_USER")

# packages by default are installed to the first element of .libPaths
.libPaths()


# ---------------------------------
# Best way
# ---------------------------------

### --- WINDOWS --- ###
# Based on: 
# https://stackoverflow.com/questions/15170399/changing-r-default-library-path-using-libpaths-in-rprofile-site-fails-to-work

# First create folder to store library - C:/Program Files/R/library

# Create windows environment variable
# Control Panel > System Properties -> Advanced system properties -> Environment Variables -> User Variables
# Variable name: R_LIBS_USER
# Variable value: C:/Program Files/R/library

# confirm using .libPAths()


# open default environment file
file.edit(".Renviron") 
# Set default global library
# R_LIBS_USER=C:/Program Files/R/library



#### Alternative method

# this is changing the default Rprofile file which will be carried over to all future scripts
# edit C:\Program Files\R\R-3.4.0\etc\Rprofile.site
# my custom library path
#.libPaths=("C:/Program Files/R/library")



#### --- Linux ---###
# file is REnviron
# alternatively, add your user to the default R group called "staff":
#       sudo adduser <user> staff

# Ideally, .libPaths have the following order:
#   "/usr/local/lib/R/site-library"
#   "/usr/lib/R/site-library"
#   "/usr/lib/R/library" 

# The first folder above would already have staff as the group otherwise,
# make sure all .libPaths folders have permissions for group to write in those folders:
#       sudo chmod -R g+w library/
#       sudo chmod -R g+w site-library/
