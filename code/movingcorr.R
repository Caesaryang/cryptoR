# Function that returns correlation between two stock/coin returns based on the past 90 days

movingcorr <- function( x, y, days = 90, type ="everything"){
  
  result <- NULL
  a <- NULL
  days <- days -1
  for ( i in seq_along(x)){
    if ( i <= days){
      result <- c(result, NA)
    }else{
     
       a <- cor(x[(i-days):(i)], y[(i-days):(i)], use = type)
      result <- c(result, a)
    }
  }
  return(result)
}
