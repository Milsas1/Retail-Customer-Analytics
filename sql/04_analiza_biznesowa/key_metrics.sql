-- Kluczowe metryki biznesowe po czyszczeniu danych
-- Całkowity przychód (bez zwrotów)
select
    round(sum(quantity * unit_price), 2) as total_revenue
from clean_transactions
where quantity > 0 and unit_price > 0;

-- Liczba klientów
select
    count(distinct customer_id) as liczba_klientow
from clean_transactions;

-- Liczba zamówień
select
    count(distinct invoice) as liczba_zamowien
from clean_transactions;

-- Średnia wartość koszyka
select
    round(
        sum(quantity * unit_price)
        / count(distinct invoice),
        2
    ) as srednia_wartosc_koszyka
from clean_transactions
where quantity > 0 and unit_price > 0;
