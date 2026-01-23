-- Podstawowy przegląd braków w CustomerID
select
	count(*) as total_records,
	count(customer_id) as records_with_customer,
	count(*) - count(customer_id) as missing_customer,
	round(100.0 * (count(*) - count(customer_id)) / count(*), 2) as missing_percent
from raw_transactions;

-- Braki w CustomerID według kraju
select
	country,
	count(*) as total_records,
    count(customer_id) as records_with_customer,
    count(*) - count(customer_id) as missing_customer,
    round(100.0 * (count(*) - count(customer_id)) / count(*), 2) as missing_pct
from raw_transactions
group by country
order by missing_pct desc;

-- Revenue generowane przez brakujące CustomerID
select
    'missing' as customer_status,
    sum(quantity * unit_price) as total_revenue
from raw_transactions
where customer_id is null
union all
select
    'with_customer',
    sum(quantity * unit_price)
from raw_transactions
where customer_id is not null;

-- Top produkty w transakcjach bez CustomerID
select
    stock_code,
    description,
    count(*) as count_missing,
    sum(quantity * unit_price) as revenue_missing
from raw_transactions
where customer_id is null
group by stock_code, description
order by count_missing desc
limit 20;
