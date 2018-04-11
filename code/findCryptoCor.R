# Creating function for retreiving crypto returns, can calculating correlation to BTC returns
#requires an object btc to be downloaded, and coin_dataset to be created
library(crypto)

findCryptoCor <- function(coin_slug, base_coin = btc){
  #Retrieve daily prices
  coin_data <-getCoins(coin_slug)
  name <- rich_list[rich_list$slug == coin_slug,]$symbol
  
  #compute daily returns
  coin_data <- mutate(coin_data, return = log(lag(close)/close) )
  coin_data <- coin_data[-1, ]
  
  #Select coin_data Returns
  coin_data_sub <- subset(coin_data, select = c("date", "close", "return"))
  colnames(coin_data_sub) <- c(paste0("date.", name),paste0("close.", name) ,paste0("return.", name))
  
  return(coin_data_sub)
}
#bch_sub <- findCryptoCor("bitcoin-cash", base_coin = btc)







