library(tidyverse)
library(googleVis)
library(anytime)
library(lubridate)

setwd("C:/Users/hongl/Documents/shoreline_lt_chart")

neng_rawdata <- read.csv(gzfile("NENG_history_trade.csv.gz"), header = FALSE)
names(neng_rawdata) <- c("coin","volume","timestamp","price")

neng_rawdata <- mutate(neng_rawdata, date = anydate(timestamp / 1000), week = cut(anydate(timestamp / 1000), "week", start.on.monday = FALSE), month = floor_date(anydate(timestamp / 1000), "month"))

# remove outlier
neng_rawdata <- neng_rawdata  %>% filter(volume > 0) %>%  filter(date > as.Date('2018-09-18'))

daily_data <- neng_rawdata %>%
  dplyr::group_by(date) %>%
  dplyr::summarize(open = first(na.omit(price)), close = last(na.omit(price)),low = min(price), high = max(price), volume = sum(volume))


c1 = gvisCandlestickChart(daily_data, xvar = "date", low = "low", open =  "open", close = "close", high = "high", 
                                  options = list(title = "NENG/DOGE Daily Price Candlestick Chart", legend = "none"))
plot(c1)



monthly_data <- neng_rawdata %>%
  dplyr::group_by(month) %>%
  dplyr::summarize(open = first(na.omit(price)), close = last(na.omit(price)),low = min(price), high = max(price), volume = sum(volume))


c2 = gvisCandlestickChart(monthly_data, xvar = "month", low = "low", open =  "open", close = "close", high = "high", 
                          options = list(title = "NENG/DOGE Monthly Price Candlestick Chart", legend = "none"))
plot(c2)


weekly_data <- neng_rawdata %>%
  dplyr::group_by(week) %>%
  dplyr::summarize(open = first(na.omit(price)), close = last(na.omit(price)),low = min(price), high = max(price), volume = sum(volume))


c3 = gvisCandlestickChart(weekly_data, xvar = "week", low = "low", open =  "open", close = "close", high = "high", 
                          options = list(title = "NENG/DOGE Weekly Price Candlestick Chart", legend = "none"))
plot(c3)

