library(ggplot2)
library(dplyr)
library(coin)
library(pwr)
library(shiny)
library(miniUI)
library(boot)
library(tidyr)
library(irr)
library("reshape2")

# Reporting
report <- function(data, attr) {
  cat("M=",   round( mean( data[[attr]] )  , 1), ",", 
      "sd=",  round( sd( data[[attr]] )    , 1), ",", 
      "Mdn=", round( median( data[[attr]] ), 1), ",", 
      "mad=", round( mad( data[[attr]] )   , 1), 
      sep="")
}