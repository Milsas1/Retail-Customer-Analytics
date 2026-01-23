-- Identyfikacja brakujących wartości w kluczowych kolumnach
select 
	count(*) filter(where invoice is null) as null_invoice,
	count(*) filter(where stock_code is null) as null_sctock_code,
	count(*) filter(where description is null) as null_description,
	count(*) filter(where quantity is null) as null_quantity,
	count(*) filter(where invoice_date is null) as null_invoice_date,
	count(*) filter(where unit_price is null) as null_unit_price,
	count(*) filter(where customer_id is null) as null_customer_id,
	count(*) filter(where country is null) as null_country
from raw_transactions;