#-------------------------------------------
# R packages to install 
# Typical libraries used
#-------------------------------------------
# make sure R shortcut is set to run as admin
# right click on shortcut > properties > run as admin



x <- c(
    "devtools",
    "TTR",
    "swirl",
    "forecast",
    "plotly",
    "quantmod",
    "arfima",
    "fracdiff",
    "kernlab",
    "ff",
    "ffbase",
    "tidyr",
    "dplyr",
    "xlsx",
    "installr",
    "XML",
    "data.table",
    "dtplyr",
    "httr",
    "RMySQL",
    "R.utils",
    "Hmisc",
    "pacman",
    "ranger",
    "timetk",   # formerly known as timekit
    "knitr",
    "tinytex"   # need to run this to complete installation -> tinytex::install_tinytex()
)

install.packages(x)

