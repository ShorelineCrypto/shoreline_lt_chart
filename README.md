# Shoreline Long Term Candlestick Chart


## What is shoreline_lt_chart?

This is sets of method and R scripts to plot any cryptocurrency cancelstick price chart for long period of time. Here we mainly showcase two methods
to plotting NewEnglandcoin (NENG) NENG/DOGE price since Sept, 2018 using raw data from ShorelineCrypto exchange history database record. In general, this tools and
method works if below conditions are met:

 - Data source - trade history raw data from sqlite3 database of OpenTrade exchange software in csv format. 
 - A desktop computer, either windows 10, macOS, or Linux
 - Rstudio:  https://rstudio.com/products/rstudio/download/#download
 - R latest version: Windows: https://cran.r-project.org/bin/windows/base/ Mac: https://cran.r-project.org/bin/macosx/

The below codes and steps were completed in windows 10 with Rstudio v1.3.1093 and R v5.0.2.

## Download raw data from exchange back-end server
Run below shell script in the same folder as the Opentrade sqlite3 database file "sqlite.db" at, which is at "opentrade/server/database" :

```
  sqlite3 < download_neng_history.sql
  gzip NENG_history_trade.csv
  
```

Now transfer the file "NENG_history_trade.csv.gz" into the same folder with R codes, now can move plot candlestick

## Rstudio R plotting for candlestick in windows/macOS/linux

Start up Rstudio,  install the missing packages whenever is necessary, open up either of R code file,  modify the R code working folder path,
now can run and plot the same pdf files as showncased on NENG .

## Candlestick log scale chart vs Google Linear chart

The candlestick charts from "work.R" in log scale looks better than Google chart.  Google chart R code had to remove more outliers because of out of whack
data points.  You can use Rstudio with R programming to chart whatever style or scale as you want using our both example R codes.

## License


Cheetah_Cpuminer is released under the terms of the MIT license. See `COPYING` for more
information or see http://opensource.org/licenses/MIT.


