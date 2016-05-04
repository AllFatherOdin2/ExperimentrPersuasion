library(ggplot2)
library(plyr)


# Reporting
report <- function(data, attr) {
  cat("M=",   round( mean( data[[attr]] )  , 1), ",", 
      "sd=",  round( sd( data[[attr]] )    , 1), ",", 
      "Mdn=", round( median( data[[attr]] ), 1), ",", 
      "mad=", round( mad( data[[attr]] )   , 1), 
      sep="")
}

#data manipulation for counting
changeStatistics <- function(data, attr) {
  data[[attr]] <- sapply(data[[attr]], function(x) {
    if (x > 0)
      1
    else if (x < 0)
      -1
    else
      0
  })
  
  rowCount <- length(data[[attr]])
  negative <- sum(data[[attr]] < 0)
  zero <- sum(data[[attr]] == 0)
  positive <- sum(data[[attr]] > 0)
  
  negPercent <- negative/rowCount * 100
  zeroPercent <- zero/rowCount * 100
  posPercent <- positive/rowCount * 100
  
  cat("total=", round(rowCount) , ", ",
      "Neg=", negative, "/", rowCount, " (", round(negPercent, 2), "%), ", 
      "zero=",  zero, "/", rowCount, " (", round(zeroPercent, 2), "%), ", 
      "positive=", positive, "/", rowCount, " (", round(posPercent, 2), "%)", 
      sep="")
  
  
  data[[attr]]
}
