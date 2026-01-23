-- przychód tylko z pozytywnych transakcji
select 
	round(sum(quantity*unit_price), 2) as total_revenue
from raw_transactions
where quantity > 0 and unit_price > 0;

-- całkowity przychód (ze zwrotami)
select 
	round(sum(quantity*unit_price), 2) as total_revenue
from raw_transactions;

-- przychód według krajów
select
	country,
	sum(quantity * unit_price) as revenue
from raw_transactions 
where quantity > 0 and unit_price > 0
group by country 
order by revenue desc;