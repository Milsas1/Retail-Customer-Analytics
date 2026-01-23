-- Liczba transakcji z ujemną ilością
select
	count(*) as negative_qty_count,
	count(*) * 100.0 / (select count(*) from raw_transactions) as negative_qry_percent
from raw_transactions
where quantity < 0;