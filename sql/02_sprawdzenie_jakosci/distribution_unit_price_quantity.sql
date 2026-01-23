-- Analiza rozkładu unit_price (percentyle)
select
	min(unit_price) as min_price,
	PERCENTILE_CONT(0.01) within group (order by unit_price) as p1,
	PERCENTILE_CONT(0.05) within group (order by unit_price) as p5,
	PERCENTILE_CONT(0.25) within group (order by unit_price) as p25,
	PERCENTILE_CONT(0.5) within group (order by unit_price) as median,
	PERCENTILE_CONT(0.75) within group (order by unit_price) as p75,
	PERCENTILE_CONT(0.95) within group (order by unit_price) as p95,
	PERCENTILE_CONT(0.99) within group (order by unit_price) as p99,
	max(unit_price) as max_price
from raw_transactions;

-- Analiza rozkładu quantity (percentyle)
select
	min(quantity) as min_quantity,
	PERCENTILE_CONT(0.01) within group (order by quantity) as p1,
	PERCENTILE_CONT(0.05) within group (order by quantity) as p5,
	PERCENTILE_CONT(0.25) within group (order by quantity) as p25,
	PERCENTILE_CONT(0.5) within group (order by quantity) as median,
	PERCENTILE_CONT(0.75) within group (order by quantity) as p75,
	PERCENTILE_CONT(0.95) within group (order by quantity) as p95,
	PERCENTILE_CONT(0.99) within group (order by quantity) as p99,
	max(quantity) as max_quantity
from raw_transactions;