#!/usr/bin/Rscript

library(optparse)

option_list <- list(
                make_option(c("-v", "--verbose"), action="store_true", 
                            default=TRUE,
                            help="Print extra output [default]"),
                make_option(c("-q", "--quietly"), action="store_false",
                            dest="verbose", 
                            help="Print little output"),
                make_option(c("-c", "--count"), 
                            type="integer", 
                            default=5,
                            help="Number of random normals to generate [default %default]",
                            metavar="number")
    )

print( parse_args( OptionParser( option_list=option_list)) )

