coin <- "bitcoin"
btc_exchanges <- getExchanges(coin)
gatecoin <- btc_exchanges[btc_exchanges$exchange_name == "Bithumb",]

usd <- btc_exchanges[btc_exchanges$trading_pair == "BTC/USD",]


kraken.btc.d <- read.csv("kraken/Kraken_BTCUSD_d.csv", skip = 1)
kraken.btc.h <- read.csv("kraken/Kraken_BTCUSD_1h.csv", skip = 1)
kraken.eth.d <- read.csv("kraken/Kraken_ETHUSD_d.csv", skip = 1)
kraken.eth.h <- read.csv("kraken/Kraken_ETHUSD_1h.csv", skip = 1)

coinbase.btc.d <- read.csv("coinbase/Coinbase_BTCUSD_d.csv", skip = 1)
coinbase.btc.h <- read.csv("coinbase/Coinbase_BTCUSD_1h.csv", skip = 1)
coinbase.eth.d <- read.csv("coinbase/Coinbase_ETHUSD_d.csv", skip = 1)
coinbase.eth.h <- read.csv("coinbase/Coinbase_ETHUSD_1h.csv", skip = 1)

okcoin.btc.d <- read.csv("okcoin/Okcoin_BTCUSD_d.csv", skip = 1)
okcoin.btc.h <- read.csv("okcoin/Okcoin_BTCUSD_1h.csv", skip = 1)
okcoin.eth.d <- read.csv("okcoin/Okcoin_ETHUSD_d.csv", skip = 1)
okcoin.eth.h <- read.csv("okcoin/Okcoin_ETHUSD_1h.csv", skip = 1)


kraken <- kraken.btc.d[ , c("Date", "Volume.To")]
colnames(kraken) <- c("Date", "Volume.Kraken")
coinbase <- coinbase.btc.d[ , c("Date", "Volume.To")]
colnames(coinbase) <- c("Date", "Volume.Coinbase")
okcoin <- okcoin.btc.d[ , c("Date", "Volume.To")]
colnames(okcoin) <- c("Date", "Volume.Okcoin")


exchange_data <- merge(kraken, coinbase, by.x = "Date", by.y = "Date", all.x = TRUE )
exchange_data <- merge(exchange_data, okcoin, by.x = "Date", by.y = "Date", all.x = TRUE )

chart_data <- melt(exchange_data, id='Date')
names(chart_data) <- c('date', 'stock', 'corr')

