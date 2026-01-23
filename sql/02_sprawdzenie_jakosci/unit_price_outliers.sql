-- Identyfikacja wartości odstających unit_price (IQR)
select
	percentile_cont(0.25) within group (order by unit_price) as q1,
	percentile_cont(0.75) within group (order by unit_price) as q3
from raw_transactions
where unit_price > 0;

with bounds as (
    select
        percentile_cont(0.25) within group (order by unit_price) as q1,
        percentile_cont(0.75) within group (order by unit_price) as q3
    from raw_transactions
    where unit_price > 0
)
select
    count(*) as total_records,
    sum(case when unit_price < (q1 - 1.5*(q3 - q1)) then 1 else 0 end) as below_lower,
    sum(case when unit_price > (q3 + 1.5*(q3 - q1)) then 1 else 0 end) as above_upper,
    sum(case when unit_price > (q3 + 3*(q3 - q1)) then 1 else 0 end) as extreme_upper
from raw_transactions, bounds
where unit_price > 0;

-- Wykrycie podejrzanych cen jednostkowych
select
    count(*) as total_records,
    sum(case when unit_price < -3.07 or unit_price > 8.45 then 1 else 0 end) as suspicious,
    sum(case when unit_price < -7.39 or unit_price > 12.77 then 1 else 0 end) as extreme
from raw_transactions
where unit_price > 0;

