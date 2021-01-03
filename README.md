# Shoreline Long Term Candlestick Chart


## What is shoreline_lt_chart?

This is sets of method and R scripts to plot any cryptocurrency cancelstick price chart over long period of time (2Y chart for NENG). Here we mainly showcase two methods
of plotting Nengcoin (NENG) NENG/DOGE price since Sept. 2018 using raw data from ShorelineCrypto exchange history database records. In general, this tool set and
method works if below conditions are met:

 - Data source: trade history raw data from sqlite3 database of OpenTrade exchange software in csv format. 
 - A desktop computer, either windows 10, macOS, or Linux
 - Rstudio:  https://rstudio.com/products/rstudio/download/#download
 - R latest version needed for Rstudio: Windows: https://cran.r-project.org/bin/windows/base/ Mac: https://cran.r-project.org/bin/macosx/

The below codes and steps were completed in Windows 10 with Rstudio v1.3.1093 and R v4.0.2.

## Download raw data from exchange back-end server
Run below shell script in the same folder as the Opentrade sqlite3 database file "sqlite.db" at, which is at "opentrade/server/database" :

```
  sqlite3 < download_neng_history.sql
  gzip NENG_history_trade.csv
  
```

Now transfer the file "NENG_history_trade.csv.gz" into the same folder with R codes, which is current folder.

## Rstudio R plotting for candlestick in windows/macOS/linux

 - Start up Rstudio,  install the missing packages whenever is necessary. 
 - Open up either of R code file
 - Modify the R code setwd working folder path, replace "C:/Users/hongl/Documents/shoreline_lt_chart" with correct windows 10/macOS/Linux working folder path.
 - Run and plot candlestick charts. You should get the same pdf files as showncased on NENG. In linux command line where GUI R studio is not avaible, you generally can run "Rscript" command on the same R codes and obtain identical results as Rstudio. 

## Candlestick log scale chart vs Google Linear chart

The candlestick charts from "work.R" in log scale looks better than Google chart from "work_googlechart.R".  Google chart R code had to remove more outliers because of out of whack data points.  Google chart R code generated plots in browser, which printed the files attached here in pdf. 

You can use Rstudio with R programming to chart whatever style or scale as you want on the NENG raw data provided here.

## License


shoreline_lt_chart is released under the terms of the MIT license. See `COPYING` for more
information or see http://opensource.org/licenses/MIT.


