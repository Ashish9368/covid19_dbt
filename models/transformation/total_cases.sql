{{ config(materialized='table') }}

select 
total_cases,
total_deaths,
total_recovered,
total_active_cases
from {{ ref('covid_indo_raw') }}
limit 1
