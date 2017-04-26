#
#-------------------------------------------
#   Script to run update and check R version
#-------------------------------------------
#

# Use pacman to manage packages
if(!require(pacman)) {
    install.packages("pacman"); require(pacman)
}


p_load(installr)


# check current version
# version

# tells you if there is a new version of R or not.
check.for.updates.R()


# install, move, update.package, quit R.
if (check.for.updates.R()){
    updateR(fast=F, browse_news=F, install_R=T, copy_packages=T, 
        copy_Rprofile.site=T, keep_old_packages=F, update_packages=T, 
        start_new_R=F, quit_R=F)
}



#--------------------
## Restart Rstudio ##
#--------------------







#################################################
#     Below is only if using global library     #
#################################################

# check path to global library
Sys.getenv("R_LIBS_USER")

# packages by default are installed to the first element of .libPaths
.libPaths()

# open default environment file
file.edit(".Renviron")
# Set default global library
# R_LIBS_USER=C:/Program Files/R/library






