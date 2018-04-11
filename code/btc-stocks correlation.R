###simple alpha models ####

library(quantmod) 
library(PerformanceAnalytics)
library(crypto)
library(reshape2)
library(ggplot2)
source("movingcorr.R")

#Retrieve BTC daily prices
btc <-getCoins("bitcoin")
rich_list <- listCoins()

#compute daily returns
btc <- mutate(btc, return.btc = log(lag(close)/close) )
btc <- btc[-1, ]


returns_data <- subset(btc, select = c("date", "close", "return.btc"))
colnames(returns_data) <- c("date", "close.BTC", "return.BTC")

sym.vec <-c("^GSPC","AAPL", "FSITX")
getSymbols(sym.vec, from = "2013-04-29", to = "2018-03-31") 

#\\\\^GSPC////
GSPC <- GSPC[, "GSPC.Adjusted", drop=F]
GSPC$ret.GSPC = CalculateReturns(GSPC, method="discrete") #discrete or log
GSPC <- data.frame(date=index(GSPC), coredata(GSPC))
returns_data <- merge(returns_data, GSPC, by.x = "date", by.y = "date", all.x = TRUE)
#find correlation
returns_data$corr.GSPC <- movingcorr(returns_data$return.BTC, returns_data$ret.GSPC, days = 90, type = "na.or.complete")

#\\\\AAPL////
AAPL <- AAPL[, "AAPL.Adjusted", drop=F]
AAPL$ret.AAPL = CalculateReturns(AAPL, method="discrete")
AAPL <- data.frame(date=index(AAPL), coredata(AAPL))
returns_data <- merge(returns_data, AAPL, by.x = "date", by.y = "date", all.x = TRUE)
#find correlation
returns_data$corr.AAPL <- movingcorr(returns_data$return.BTC, returns_data$ret.AAPL, days = 90, type = "na.or.complete")



#\\\\FSITX////
FSITX <- FSITX[, "FSITX.Adjusted", drop=F]
FSITX$ret.FSITX = CalculateReturns(FSITX, method="discrete") #discrete or log
FSITX <- data.frame(date=index(FSITX), coredata(FSITX))
returns_data <- merge(returns_data, FSITX, by.x = "date", by.y = "date", all.x = TRUE)
#find correlation
returns_data$corr.FSITX <- movingcorr(returns_data$return.BTC, returns_data$ret.FSITX, days = 90, type = "na.or.complete")



####  Plot
#Select only the columns we want to graph
stock_list <- c("date", "corr.AAPL", "corr.GSPC", "corr.FSITX")
temp <- subset(returns_data, select = stock_list)
chart_data <- melt(temp, id='date')
names(chart_data) <- c('date', 'stock', 'corr')

### NEED TO RUN SEPARATELY TO PLOT ###
ggplot() +
  geom_line(data = chart_data[chart_data$date >= "2014-04-01",], aes(x = date, y = corr, color = stock), size = 1)+
  xlab("date") +
  ylab("correlation")
