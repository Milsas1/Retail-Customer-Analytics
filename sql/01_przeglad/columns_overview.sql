-- Sprawdzenie struktury tabeli raw_transactions
select 
	column_name, 
	data_type
from information_schema.columns
where table_name = 'raw_transactions';