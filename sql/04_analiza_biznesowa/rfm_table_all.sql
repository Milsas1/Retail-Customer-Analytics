-- Budowa tabeli RFM
create table rfm_table as
select 
	customer_id, 
	extract(days from(date '2011-12-10' - max(invoice_date))) as recency,
	count(distinct invoice) as frequency,
	sum(revenue) as monetary
from rfm_transactions
group by customer_id;

-- Podgląd tabeli RFM
select * from rfm_table;

-- Statystyki metryk RFM
select
	'recency' as metric,
	min(recency) as min,
	max(recency) as max,
	avg(recency) as avg,
	PERCENTILE_CONT(0.5) within group (order by recency) as median,
	PERCENTILE_CONT(0.95) within group (order by recency) as p95
from rfm_table
union all
select 
    'frequency' as metric,
    MIN(frequency) as min,
    MAX(frequency) as max,
    AVG(frequency) as avg,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY frequency) as median,
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY frequency) as p95
FROM rfm_table
UNION ALL
SELECT 
    'monetary' as metric,
    MIN(monetary) as min,
    MAX(monetary) as max,
    AVG(monetary) as avg,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY monetary) as median,
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY monetary) as p95
FROM rfm_table;
