## Correlation between Crypto Currencies over time 

I decided to look at the relationship between various crypto currencies to Bitcoin over the past 3 years. The goal of this exercise was to determine if crypto prices fluctuated independently to each other or if prices move in response to the overall price of Bitcoin. Simply put, do investors value each coin separately or relative to the price of Bitcoin. 

This analysis is useful because if coins prices are uncorrelated to Bitcoin, then it would be possible to create a balanced diversified portfolio to reduce unsystematic risk (similar to a balanced equity portfolio). However, if price movements in most cryptos follow the price of Bitcoin, then there is not much benefit to holding alt-coins over just holding Bitcoin. It would be wiser (and easier) to simply invest in Bitcoin. 

### Results


**Ethereum Correlation to Bitcoin** 2015-2018

I first looked at the correlation of the daily price changes (using the daily close price from [coinmarketcap](http://coinmarketcap.com) with the crypto R package) between Bitcoin (BTC) and the next largest cryptocurrency by market cap. Ethereum (ETH)

![Ethereum Price Correlation to Bitcoin](/pics/ETH-correlation-over-time.jpeg)

I found that until the recent price surge (see: bubble) ETH and BTC were fairly uncorrelated. It was only during the BTC run to $20k USD and subsequent crash that the price correlation rose dramatically. Therefore, I believe that there are fundamentals of ETH that make it uncorrelated to BTC (or at the least, not substantially correlated), however recently the crypto investor hype has superseded these fundamentals and driven ETH to align with BTC. 

**Other Crytocurrencies** 2014-2018

I then graphed the correlation of six other top currencies with respect to BTC. Litecoin (LTC), Bitcoin Cash (BCH), Stellar (XLM), Ripple (XRP), Cardano (ADA), and IOTA (MITOA). 

![Crypto Currency Price Correlation to Bitcoin](/pics/Correlation-Coins.jpeg)

In general, we see a similar pattern to Ethereum. The prices for most coins are slightly positively correlated to Bitcoin up until early 2018 when they begin to align more sharply. (Note: these correlation are based on 90 days of past returns, therefore changes take time to propagate into the model. A rising correlation likely means the two returns were correlated from the start of the accent). 

A important exception in Litecoin, which appears to be highly correlated to Bitcoin (with some exceptions) since 2014. This is likely due to the similarities in the fundamental features and use cases for these coins. 

![Crypto Recent Price Correlation to Bitcoin](/pics/Correlation-Coins-Apr17-Mar18.jpeg)

Looking at the past year specifically we see the variation in correlations across cryptocurrencies melt away. There all became dominated by the hype surrounding Bitcoin. 

### Comparison with Traditional Stocks and Bonds

To check our work, it felt it would be necessary to compare to price of Bitcoin to traditional investments. Using the quandmod R package I pulled daily returns on Apple Corp (AAPL), the S&P500 (^GSPC), and a Fidelity U.S. Bond Index Fund (FSITX). 

![Crypto Currency Price Correlation to Bitcoin](/pics/BTC-Stocks-Corr.jpeg)

Here is see almost no trend in price correlation over time, each stock ranges mostly between -0.2 to 0.2 since 2014. There is an exception again in the start of 2018 when both BTC and the stock markets when they a major correction. (I'll leave it to other to speculate on whether these two events are related - but I suspect they are). BTC is neither highly correlated or highly uncorrelated to traditional investment markets. 

## Conclusions ##

Based on this analysis, it appears that there are fundamental differences in the price changes of cryptocurrencies, enough so that diversification may be possible. But currently (April 2018) the prices seem to be highly correlated and a truly diversified portfolio (like that of an index funds) is difficult to achieve. Therefore, I would be wary of investing in Crypto Index Funds under the current market conditions. 

However, crypto markets are notoriously difficult to predict and it will be important to track this correlation to monitor changes in market sentiment. As crypto markets mature, we will likely see more independence between coins. 

## Appendix ##

The code I used for this assignment is available on my [Github page](https://github.com/dkeresteci/cryptoR). I collected the data using the R packages [Crypto](https://github.com/JesseVent/crypto) and [Quantmod](https://cran.r-project.org/package=quantmod)


