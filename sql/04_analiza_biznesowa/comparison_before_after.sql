-- Porównanie danych przed i po czyszczeniu
-- Liczba rekordów
select 'przed_czyszczeniem' as etap, count(*) as liczba_wierszy
from raw_transactions
union all
select 'po_czyszczeniu', count(*)
from clean_transactions;

-- Przychód (tylko dodatnie transakcje)
select 'przed_czyszczeniem' as etap,
       round(sum(quantity * unit_price), 2) as revenue
from raw_transactions
where quantity > 0 and unit_price > 0
union all
select 'po_czyszczeniu',
       round(sum(quantity * unit_price), 2)
from clean_transactions;

-- Liczba unikalnych klientów
select 'przed_czyszczeniem' as etap,
       count(distinct customer_id) as liczba_klientow
from raw_transactions
union all
select 'po_czyszczeniu',
       count(distinct customer_id)
from clean_transactions;

-- Udział usuniętych rekordów (%)
select
    round(
        100.0 * (1 - (select count(*) from clean_transactions)::numeric
        / (select count(*) from raw_transactions)), 2
    ) as procent_usunietych_rekordow;
