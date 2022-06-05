with Stock_Sell AS (
        select 
        	stock_name , sum(price) as Sell_price 
        from 
		Stocks
        	where operation = 'Sell'
       		group by stock_name , operation
        ),

Stock_Buy AS(
        select 
		stock_name , sum(price) as Buy_price
        from 
		Stocks
        	where operation = 'Buy'
        	group by stock_name , operation
        )

select
	SS.stock_name ,
	(Sell_price - Buy_price) as capital_gain_loss
from
	Stock_Sell SS left outer join Stock_Buy SB
	on SS.stock_name = SB.stock_name


