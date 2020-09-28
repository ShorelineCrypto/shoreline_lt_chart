.mode csv
.output NENG_history_trade.csv 
.open sqlite.db
select coin, fromSellerToBuyer,time,price from history where coin='NewEnglandcoin' AND coin_pair = 'Dogecoin' ;
