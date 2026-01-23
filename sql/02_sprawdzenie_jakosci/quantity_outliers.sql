-- Identyfikacja wartości odstających quantity (IQR)
select
	percentile_cont(0.25) within group (order by quantity) as q1,
	percentile_cont(0.75) within group (order by quantity) as q3
from raw_transactions;

with bounds as (
    select
        percentile_cont(0.25) within group (order by quantity) as q1,
        percentile_cont(0.75) within group (order by quantity) as q3
    from raw_transactions
)
select
    count(*) as total_records,
    sum(case when quantity < (q1 - 1.5*(q3 - q1)) then 1 else 0 end) as below_lower,
    sum(case when quantity > (q3 + 1.5*(q3 - q1)) then 1 else 0 end) as above_upper,
    sum(case when quantity > (q3 + 3*(q3 - q1)) then 1 else 0 end) as extreme_upper
from raw_transactions, bounds;

-- Wykrycie podejrzanych wartości quantity
select
    count(*) as total_records,
    sum(case when quantity < -12.5 or quantity > 23.5 then 1 else 0 end) as suspicious,
    sum(case when quantity < -26 or quantity > 37 then 1 else 0 end) as extreme
from raw_transactions;