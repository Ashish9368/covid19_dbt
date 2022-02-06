{{ config(materialized='table') }}

select 
location,
sum(new_cases) as loc_new_cases,
sum(new_deaths) as loc_new_deaths,
sum(new_recovered) as loc_new_recovered,
sum(active_cases) as loc_active_cases
from {{ ref('covid_indo_raw') }}
group by location