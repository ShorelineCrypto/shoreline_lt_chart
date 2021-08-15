library(tidyverse)
library(googleVis)
library(anytime)
library(lubridate)

setwd("C:/Users/hongl/shares/shoreline_lt_chart")

chta_rawdata <- read.csv(gzfile("CHTA_history_trade.csv.gz"), header = FALSE)
names(chta_rawdata) <- c("coin","volume","timestamp","price")

chta_rawdata <- mutate(chta_rawdata, date = anydate(timestamp / 1000), week = cut(anydate(timestamp / 1000), "week", start.on.monday = FALSE), month = floor_date(anydate(timestamp / 1000), "month"))

# remove outlier
chta_rawdata <- chta_rawdata  %>% filter(volume > 0) 

daily_data <- chta_rawdata %>%
  dplyr::group_by(date) %>%
  dplyr::summarize(open = first(na.omit(price)), close = last(na.omit(price)),low = min(price), high = max(price), volume = sum(volume))


c1 = gvisCandlestickChart(daily_data, xvar = "date", low = "low", open =  "open", close = "close", high = "high", 
                                  options = list(title = "CHTA/DOGE Daily Price Candlestick Chart", legend = "none"))
plot(c1)



monthly_data <- chta_rawdata %>%
  dplyr::group_by(month) %>%
  dplyr::summarize(open = first(na.omit(price)), close = last(na.omit(price)),low = min(price), high = max(price), volume = sum(volume))


c2 = gvisCandlestickChart(monthly_data, xvar = "month", low = "low", open =  "open", close = "close", high = "high", 
                          options = list(title = "CHTA/DOGE Monthly Price Candlestick Chart", legend = "none"))
plot(c2)


weekly_data <- chta_rawdata %>%
  dplyr::group_by(week) %>%
  dplyr::summarize(open = first(na.omit(price)), close = last(na.omit(price)),low = min(price), high = max(price), volume = sum(volume))


c3 = gvisCandlestickChart(weekly_data, xvar = "week", low = "low", open =  "open", close = "close", high = "high", 
                          options = list(title = "CHTA/DOGE Weekly Price Candlestick Chart", legend = "none"))
plot(c3)

