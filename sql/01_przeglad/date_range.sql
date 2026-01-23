-- Określenie zakresu czasowego danych transakcyjnych
select 
	min(invoice_date) as min_date,
	max(invoice_date) as max_date
from raw_transactions;
