.mode csv
.output CHTA_history_trade.csv 
.open sqlite.db
select coin, fromSellerToBuyer,time,price from history where coin='Cheetahcoin' AND coin_pair = 'Dogecoin' ;
