##						Emacs please make this -*- R -*-
## empty Rprofile.site for R on Debian
##
## Copyright (C) 2008 Dirk Eddelbuettel and GPL'ed
##
## see help(Startup) for documentation on ~/.Rprofile and Rprofile.site

# options
options(menu.graphics=FALSE)
options(repos="https://cran.rstudio.com/")
options(BioC_mirror="https://bioconductor.org/")

# libraries
library(setwidth)
library(colorout)

# sources
source("~/.Rproxy")
source("https://bioconductor.org/biocLite.R")

.First <- function() {
	cat("\n   Welcome to R!\n\n")
}
.Last <- function() {
	cat("\n   Goodbye!\n\n")
}
