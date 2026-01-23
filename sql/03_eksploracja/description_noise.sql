-- Wykrycie nieprawidłowych opisów produktów
select count(*)
from raw_transactions 
where description like '%[^a-zA-Z0-9 ]%' or description is null or length(description) < 3;

-- Przykłady nieprawidłowych opisów
select *
from raw_transactions 
where description like '%[^a-zA-Z0-9 ]%' or description is null or length(description) < 3
limit 10;
