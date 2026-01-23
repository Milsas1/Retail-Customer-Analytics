-- Wykrycie nieprawidłowych numerów faktur
select 
	invoice,
	count(distinct customer_id) as customers_count,
	count(distinct invoice_date::date) as dates_count
from raw_transactions rt 
group by invoice 
having count(distinct rt.customer_id) > 1 or count(distinct invoice_date) > 1;

-- Liczba problematycznych faktur
select count(*) as invoices_count
from (
	select
		invoice
	from raw_transactions rt 
	group by invoice
	having count(distinct rt.customer_id) > 1
		or count(distinct invoice_date::date) > 1
	) as invoices;