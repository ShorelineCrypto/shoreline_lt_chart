library(tidyverse)
library(googleVis)
library(anytime)
library(lubridate)
library(plotly)
library(processx)


setwd("C:/Users/hongl/shares/shoreline_lt_chart")

chta_rawdata <- read.csv(gzfile("CHTA_history_trade.csv.gz"), header = FALSE, sep = ",")
names(chta_rawdata) <- c("coin","volume","timestamp","price")

chta_rawdata <- mutate(chta_rawdata, date = anydate(timestamp / 1000), week = cut(anydate(timestamp / 1000), "week", start.on.monday = FALSE), month = floor_date(anydate(timestamp / 1000), "month"))

# remove outlier
chta_rawdata <- filter (chta_rawdata, volume > 0)

daily_data  <- chta_rawdata %>%
  dplyr::group_by(date) %>%
  dplyr::summarize(open = first(na.omit(price)), close = last(na.omit(price)),low = min(price), high = max(price), volume = sum(volume))




c1 <- daily_data %>% plot_ly(x = ~date, type="candlestick",
                      open = ~open, close = ~close,
                      high = ~high, low = ~low) 
c1 <- c1 %>% layout(title = "CHTA/DOGE Daily Price Candlestick Chart ( u=10-6 )",  yaxis = list(type = "log"))

c1
orca(c1, "chta_daily_candlestick.pdf")

monthly_data <- chta_rawdata %>%
  dplyr::group_by(month) %>%
  dplyr::summarize(open = first(na.omit(price)), close = last(na.omit(price)),low = min(price), high = max(price), volume = sum(volume))

c2 <- monthly_data %>% plot_ly(x = ~month, type="candlestick",
                     open = ~open, close = ~close,
                     high = ~high, low = ~low) 
c2 <- c2 %>% layout(title = "CHTA/DOGE Monthly Price Candlestick Chart ( u=10-6 )",  yaxis = list(type = "log"))

c2
orca(c2, "chta_monthly_candlestick.pdf")


weekly_data <- chta_rawdata %>%
  dplyr::group_by(week) %>%
  dplyr::summarize(open = first(na.omit(price)), close = last(na.omit(price)),low = min(price), high = max(price), volume = sum(volume))

c3 <- weekly_data %>% plot_ly(x = ~week, type="candlestick",
                               open = ~open, close = ~close,
                               high = ~high, low = ~low) 
c3 <- c3 %>% layout(title = "CHTA/DOGE Weekly Price Candlestick Chart ( u=10-6 )",  yaxis = list(type = "log"))

c3
orca(c3, "chta_weekly_candlestick.pdf")
