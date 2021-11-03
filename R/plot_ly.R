

fname <- "plot_something"
flocation <- "plots"

# save as html
htmlwidgets::saveWidget( as_widget( fig ), file.path(flocation, paste0( fname, ".html"))
); unlink( paste0( flocation, "/" , fname, "_files"), recursive=T)

# save as static image
orca( mapbox_cluster, file=file.path("plots", paste0(fname, ".png")), 
      width=1200, height=1000,
)

