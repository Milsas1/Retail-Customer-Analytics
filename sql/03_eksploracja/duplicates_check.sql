-- Wykrycie potencjalnych duplikatów
select invoice, stock_code, quantity, unit_price, count(*)
from raw_transactions
group by invoice, stock_code, quantity, unit_price
having count(*) > 1;

-- Analiza duplikatów transakcji
with duplicates as (
	select 
		stock_code,
		description,
		quantity,
		unit_price,
		customer_id,
		invoice_date,
		count(*) as dup_count,
		array_agg(distinct invoice) as invoices
	from raw_transactions
	group by 
		stock_code,
		description,
		quantity,
		unit_price,
		customer_id,
		invoice_date
	having count(*) > 1
)
select * from duplicates
order by dup_count desc;

-- Klasyfikacja typów duplikatów
with duplicates as (
	select 
		stock_code,
		description,
		quantity,
		unit_price,
		customer_id,
		invoice_date,
		array_agg(distinct invoice) as invoices,
		count(distinct invoice) as invoice_count,
		count(*) as total_dupes
	from raw_transactions
	group by 
		stock_code,
		description,
		quantity,
		unit_price,
		customer_id,
		invoice_date
	having count(*) > 1
)
select 
	stock_code,
	description,
	quantity,
	unit_price,
	customer_id,
	invoice_date,
	total_dupes,
	invoice_count,
	case
		when invoice_count = 1 then 'Duplikat techniczny (usunąć)'
		when invoice_count > 1 and total_dupes <= 3 then 'Prawdopodobne powtórzenie (zachować)'
		else 'Ręczna weryfikacja'
	end as duplicate_type
from duplicates
order by duplicate_type desc, total_dupes desc;
