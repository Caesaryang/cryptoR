library(crypto)
library(quantmod)
library(ggplot2)
library(reshape2)
library(dplyr)

source("movingcorr.R")
source("findCryptoCor.R")

#Retrieve BTC daily prices
btc <-getCoins("bitcoin")
rich_list <- listCoins()

#compute daily returns
#btc <- mutate(btc, return.btc = lag(close)/close - 1)

btc <- mutate(btc, return.btc = log(lag(close)/close) )
btc <- btc[-1, ]


### ETHEREUM ###
eth_sub <- findCryptoCor("ethereum", base_coin = btc)
coin_dataset <- merge(btc, eth_sub, by.x = "date", by.y = "date.ETH", all.x = TRUE)
coin_dataset$corr.ETH <- movingcorr(coin_dataset$return.btc, coin_dataset$return.ETH, days = 90)


### Litecoin ###
ltc_sub <- findCryptoCor("litecoin", base_coin = btc)
coin_dataset <- merge(coin_dataset, ltc_sub, by.x = "date", by.y = "date.LTC", all.x = TRUE)
coin_dataset$corr.LTC <- movingcorr(coin_dataset$return.btc, coin_dataset$return.LTC, days = 90)

### Bitcoin Cash ###
bch_sub <- findCryptoCor("bitcoin-cash", base_coin = btc)
coin_dataset <- merge(coin_dataset, bch_sub, by.x = "date", by.y = "date.BCH", all.x = TRUE)
coin_dataset$corr.BCH <- movingcorr(coin_dataset$return.btc, coin_dataset$return.BCH, days = 90)

## Stellar ###
XLM_sub <- findCryptoCor("stellar", base_coin = btc)
coin_dataset <- merge(coin_dataset, XLM_sub, by.x = "date", by.y = "date.XLM", all.x = TRUE)
coin_dataset$corr.XLM <- movingcorr(coin_dataset$return.btc, coin_dataset$return.XLM, days = 90)

## Ripple ###
XRP_sub <- findCryptoCor("ripple", base_coin = btc)
coin_dataset <- merge(coin_dataset, XRP_sub, by.x = "date", by.y = "date.XRP", all.x = TRUE)
coin_dataset$corr.XRP <- movingcorr(coin_dataset$return.btc, coin_dataset$return.XRP, days = 90)

## Cardano ###
ADA_sub <- findCryptoCor("cardano", base_coin = btc)
coin_dataset <- merge(coin_dataset, ADA_sub, by.x = "date", by.y = "date.ADA", all.x = TRUE)
coin_dataset$corr.ADA <- movingcorr(coin_dataset$return.btc, coin_dataset$return.ADA, days = 90)

## Iota ###
MIOTA_sub <- findCryptoCor("iota", base_coin = btc)
coin_dataset <- merge(coin_dataset, MIOTA_sub, by.x = "date", by.y = "date.MIOTA", all.x = TRUE)
coin_dataset$corr.MIOTA <- movingcorr(coin_dataset$return.btc, coin_dataset$return.MIOTA, days = 90)



#Select only the columns we want to graph
coin_list <- c("date", "corr.ETH", "corr.LTC", "corr.BCH", "corr.XLM", "corr.XRP", "corr.ADA", "corr.MIOTA")
temp <- subset(coin_dataset, select = coin_list)
chart_data <- melt(temp, id='date')
names(chart_data) <- c('date', 'coin', 'corr')

### NEED TO RUN SEPARATELY TO PLOT ###
ggplot() +
  geom_line(data = chart_data[chart_data$date >= "2017-04-01",], aes(x = date, y = corr, color = coin), size = 1)+
  xlab("date") +
  ylab("correlation")


#plot daily ETH returns
#qplot(eth[, "date"], y = eth[ ,"return"] , geom="point", main = "ETH Daily Returns",  xlab = "Date", ylab = "% return")

#Plot
#qplot(coin_dataset[, "date"], y = coin_dataset[ ,"corr.eth"] , geom="line", main = "ETH Corrleation to BTC",  xlab = "Date", ylab = "Corr Coeff")

