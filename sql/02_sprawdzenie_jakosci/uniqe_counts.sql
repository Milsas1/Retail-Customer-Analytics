-- Liczba unikalnych wartości w kluczowych kolumnach
select
	count(distinct invoice) as uniqe_invoices,
	count(distinct stock_code) as uniqe_products,
	count(distinct customer_id) as uniqe_customers,
	count(distinct country) as unique_countries
from raw_transactions;