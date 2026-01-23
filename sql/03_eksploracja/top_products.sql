-- Najczęściej sprzedawane produkty
select stock_code, description, count(*) as frequency
from raw_transactions
group by stock_code, description
order by frequency desc
limit 10;
