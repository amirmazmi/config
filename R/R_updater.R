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

# --- WINDOWS ---
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


# --- Linux ---
# file is REnviron
# alternatively, add your user to the default R group called "staff":
#       sudo adduser <user> staff
# then make sure all .libPaths folders have permissions for group to write in those folders:
#       sudo chmod -R g+w library/
#       sudo chmod -R g+w site-library/


# ---------------------------------
# Alternative method
# ---------------------------------
# this is changing the default Rprofile file which will be carried over to all future scripts
# edit C:\Program Files\R\R-3.4.0\etc\Rprofile.site
# my custom library path
#.libPaths=("C:/Program Files/R/library")


